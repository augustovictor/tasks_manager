require 'test_helper'

class ProjectMailerTest < ActionMailer::TestCase
  test "project_invitation" do
    mail = ProjectMailer.project_invitation
    assert_equal "Project invitation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
