class ProjectMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.project_invitation.subject
  #
  def project_invitation(user)
    @user = user
    @project = @user.projects.last

    mail to: @user.email, subject: 'Tasks Manager - New project invitation'
  end
end
