require "spec_helper"

RSpec.describe PostsController, type: :controller do
  render_views

  describe "#index" do
    context "public feed" do
      let!(:posts) {create_list(:post, 3, :public)}
      before do
        get :index
      end

      it {expect(response).to have_http_status(200)}
      it {expect(response).to render_template(:index)}
      it {expect(assigns(:posts)).to eq posts.sort_by(&:created_at).reverse}
    end

    context "logged in user" do
      let(:user) {create(:user)}
      let(:followed_user) {create(:user, is_feed_public: false)}
      let(:followed_user2) {create(:user, is_feed_public: false)}
      let!(:followed_posts) {create_list(:post, 3, user: followed_user)}
      let!(:followed_posts2) {create_list(:post, 3, user: followed_user2)}
      let!(:public_posts) {create_list(:post, 3, :public)}
      before do
        sign_in user
        user.followed_users = [followed_user, followed_user2]
      end

      context "without params" do
        before do
          get :index
        end

        it {expect(response).to have_http_status(200)}
        it {expect(response).to render_template(:index)}
        it "only shows posts from the followed users" do
          expect(assigns(:posts)).to eq (followed_posts+followed_posts2).sort_by(&:created_at).reverse
          expect(assigns(:posts)).to_not include(public_posts)
        end
      end

      context "with params" do
        context "followed user" do
          before do
            get :index, params: { user_id: followed_user.id }
          end

          it {expect(response).to have_http_status(200)}
          it {expect(response).to render_template(:index)}
          it "only shows posts from the selected followed user" do
            expect(assigns(:posts)).to eq followed_posts.sort_by(&:created_at).reverse
          end
        end

        context "not followed user" do
          before do
            get :index, params: { user_id: public_posts.first.user.id }
          end

          it {expect(response).to have_http_status(200)}
          it {expect(response).to render_template(:index)}
          it "only show empty list of posts" do
            expect(assigns(:posts)).to eq []
          end
        end
      end
    end
  end
end