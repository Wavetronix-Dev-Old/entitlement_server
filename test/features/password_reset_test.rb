require "test_helper"

feature "PasswordResets" do
  scenario "emails identity when requesting password reset" do
    identity = Factory(:identity)
    ActionMailer::Base.deliveries = []
    visit sign_in_path
    click_link "Forget your password"
    fill_in "Email", :with => identity.email
    click_button "Next"
    page.must_have_content "sent password reset"
    last_email = ActionMailer::Base.deliveries.last
    last_email.to.must_include identity.email
  end
end
