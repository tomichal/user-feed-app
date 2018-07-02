require "spec_helper"

RSpec.describe User, type: :model do
  describe "Associations" do
    let(:user) {create(:user)}

    describe "#follower_users" do
      it "returns followers of the user" do
        user.follower_users = followers = create_list(:user, 3)
        expect(user.follower_users).to match_array followers
      end
    end

    describe "#followed_users" do
      it "returns users followed by the user" do
        user.followed_users = follows = create_list(:user, 3)
        expect(user.followed_users).to match_array follows
      end
    end
  end

  describe ".search" do
    context "with follower_user_id" do
      let!(:followed_users) { create_list(:user, 3) }
      let!(:follower_user) { create(:user) }
      before do
        follower_user.followed_users = followed_users
      end

      it "returns users followed by the given user" do
        expect(User.search(follower_user_id: follower_user.id)).to match_array followed_users
      end
    end

    context "with followed_user_id" do
      let!(:followed_user) { create(:user) }
      let!(:follower_users) { create_list(:user, 3) }
      before do
        follower_users.each { |u| u.followed_users = [followed_user] }
      end

      it "returns users who follow the given user" do
        expect(User.search(followed_user_id: followed_user.id)).to match_array follower_users
      end
    end
  end
end