require "spec_helper"

RSpec.describe Post, type: :model do
  describe ".feed" do
    context "user is nil" do
      let(:public_posts) { create_list(:post, 3, :public) }
      let(:private_posts) { create_list(:post, 3, :private) }

      before do
        public_user.posts = build_list(:post, 3)
        private_user.posts = build_list(:post, 3)
      end
      it "returns public feed posts" do

      end

      it "does not include private feed posts" do

      end
    end

    context "user is not nil" do

    end
  end
end
