require 'rails_helper'

RSpec.describe 'user claims a job', type: :system do
  let!(:correcter) { create(:correcter) }
  let!(:submitter) { create(:submitter) }

  before do
    driven_by(:rack_test)
  end

  context 'when job is awaiting_correction' do
    it 'can be claimed by user' do
      post = create(:post, user: submitter)
      visit login_path
      fill_in 'email', with: correcter.email
      fill_in 'password', with: correcter.password
      click_button 'Log in' 

      visit post_corrections_path post
      click_on 'Claim this job'
      post.reload

      expect(post.in_correction?).to be true
    end
  end

  context 'when job is in_correction' do
    it 'cannotu be claimed by user' do
      post = create(:post, user: submitter)
      visit login_path
      fill_in 'email', with: correcter.email
      fill_in 'password', with: correcter.password
      click_button 'Log in' 

      visit post_corrections_path post
      post.update_attributes(status: :in_correction)
      click_on 'Claim this job'

      expect(current_path).to eq jobs_path
      expect(post.claimed_by).not_to eq correcter.id
    end
  end
end
