class UserRelayJob < ApplicationJob
  def perform(user_id)
    user = User.find_by(id: user_id)
    # Guard against user being deleted whilst the DJ was processing this job.
    if user.present?
      alerts = { success: "Feed was updated. <a href>Reload</a> the page to see if there are new public posts." }
      alerts_html = ApplicationController.render(partial: "shared/alerts", locals: { alerts: alerts })
      # NOTE: Rather than replacing the public feed we'll show a notification.
      # This should be a better UX, since it will avoid a situation when user
      # is disrupted mid-way through reading some posts.
      UsersChannel.broadcast_to("user:", alerts: alerts_html)
    end
  end
end