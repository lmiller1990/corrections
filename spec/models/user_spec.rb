require 'rails_helper'

RSpec.describe User, type: :model do
  it 'submitter many posts' do
    user = create :submitter
    2.times { create :post, user: user }

    expect(user.posts.count).to eq 2
  end

  it 'correcter has many posts as jobs' do
    correcter = create :correcter
    user = create :submitter
    2.times { create :post, user: user, claimed_by: correcter.id }

    expect(correcter.jobs.count).to eq 2
  end
end
