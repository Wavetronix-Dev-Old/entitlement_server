require "test_helper"

feature "PasswordResets" do
  scenario "emails user when requesting password reset" do
    # ActionMailer::Base.deliveries = []
    # user = Factory(:user)
    # visit sign_in_path
    # click_link "password"
    # fill_in "Wavetronix email", :with => user.email
    # click_button "Next"
    # page.must_have_content "sent password reset"
    # raise ActionMailer::Base.deliveries.last
  end
end
