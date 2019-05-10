require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has many posts' do
    user = create :submitter
    2.times { create :post, user: user }

    expect(user.posts.count).to eq 2
  end
end
