require 'rails_helper'

RSpec.describe 'user views their submissions', type: :system do
  let!(:correcter) { create(:correcter) }
  let!(:submitter) { create(:submitter) }

  before do
    driven_by(:rack_test)
  end

  scenario 'user views only their own submissions' do
    my_original_text = 'this is some interesting text'
    my_post = create(:post, user: submitter, original_text: my_original_text)
    not_my_post = create(:post, user: correcter)

    visit login_path
    fill_in 'email', with: submitter.email
    fill_in 'password', with: submitter.password
    click_button 'Log in' 
    visit my_posts_path

    expect(body).to include my_original_text
  end
end
