require 'rails_helper'

RSpec.describe 'user claims a job', type: :system do
  let!(:correcter) { create(:correcter) }
  let!(:submitter) { create(:submitter) }
  let!(:post) { create(:post, user: submitter) }

  before do
    driven_by(:rack_test)
  end

  context 'job is awaiting_correction' do
    it 'is claimed by user' do
      visit login_path
      fill_in 'email', with: correcter.email
      fill_in 'password', with: correcter.password
      click_button 'Log in' 

      visit post_corrections_path post
      puts body
    end
  end
end
