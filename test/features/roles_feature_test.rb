# require 'test_helper'
#
# feature "Roles" do
#   given(:identity) { Factory :identity }
#
#   background do
#     manually_sign_in identity
#   end
#
#   describe "with authorized user" do
#     background do
#       # TODO: How do I assign a role to a user for testing?
#     end
#
#     scenario "visit Roles page" do
#       [:admin, :employee, :dealer].each do |role|
#         Role.create!(name: role)
#       end
#       visit roles_path
#       page.must_have_content 'admin'
#       page.must_have_content 'dealer'
#       page.must_have_content 'employee'
#     end
#
#     describe "create a new role" do
#       background do
#         visit roles_path
#         click_link nil, href: new_role_path
#       end
#
#       scenario "with valid data" do
#         fill_in :role_name, with: 'seeker'
#         click_button 'Create'
#         page.must_have_selector '.alert-box', text: 'success'
#         page.must_have_content 'seeker'
#       end
#
#       scenario "with invalid data" do
#         fill_in :role_name, with: ''
#         click_button 'Create'
#         page.must_have_text 'error'
#       end
#     end
#
#     describe "edit a role" do
#       given(:role) { Role.create! name: 'keeper' }
#
#       background do
#         visit edit_role_path(role)
#       end
#
#       scenario "displays role name in the page heading" do
#         page.must_have_selector 'h1', text: role.name
#       end
#
#       describe "with valid data" do
#         background do
#           @name = 'bludger'
#           fill_in :role_name, with: @name
#           click_button 'Update'
#         end
#
#         scenario "redirects to the roles page" do
#           page.must_have_selector 'h1', text: 'Roles'
#         end
#
#         scenario "displays a success message" do
#           page.must_have_selector '.alert-box', text: 'success'
#         end
#       end
#
#       describe "with invalid data" do
#         background do
#           fill_in :role_name, with: ''
#           click_button 'Update'
#         end
#
#         scenario "renders the form" do
#           page.must_have_selector 'h1', text: "Edit #{role.name}"
#         end
#
#         scenario "displays errors" do
#           page.must_have_content 'error'
#         end
#       end
#     end
#   end
# end
