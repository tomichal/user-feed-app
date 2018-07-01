class PostRelayJob < ApplicationJob
  def perform(post_id)
    post = Post.includes(:user).find_by(id: post_id)
    # Guard against post being deleted whilst the DJ was processing this job.
    if post
      post_html = PostsController.render(partial: "posts/post", locals: { post: post })
      post.user.follower_users.each do |user|
        PostsChannel.broadcast_to("follower_user:#{user.id}", post: post_html)
      end
      if post.user.is_feed_public?
        PostsChannel.broadcast_to("follower_user:", post: post_html)
      end
    end
  end
end