require "spec_helper"

RSpec.describe Post, type: :model do
  describe ".feed" do
    context "user is nil" do
      let!(:public_posts) { create_list(:post, 3, :public) }
      let!(:private_post) { create(:post, :private) }

      before do
        public_posts.each(&:reload)
        private_post.reload
      end

      it "returns public feed posts" do
        posts = Post.feed(nil)
        expect(posts.size).to eq 3
        expect(posts).to eq public_posts.sort_by { |post| post.created_at }.reverse
      end

      it "does not include private feed posts" do
        expect(Post.feed(nil)).to_not include(private_post)
      end
    end

    context "user is not nil" do
      let(:user) { create(:user) }
      let(:followed_user) { create(:user) }
      let!(:followed_posts) { create_list(:post, 3, user: followed_user) }
      let!(:public_post) { create(:post, :public) }

      before do
        user.followed_users << followed_user
      end

      it "only returns posts by followed users" do
        posts = Post.feed(user)
        expect(posts.size).to eq 3
        expect(posts).to eq followed_posts.sort_by { |post| post.created_at }.reverse
      end

      it "does not include public posts by users not followed " do
        expect(Post.feed(user)).to_not include(public_post)
      end
    end
  end
end
