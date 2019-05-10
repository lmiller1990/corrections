require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:correcter) { create :correcter }
  let!(:submitter) { create :submitter }

  describe '#word_count' do
    it 'returns word count' do
      post = build(:post, original_text: 'a b c')
      expect(post.word_count).to eq 3
    end
  end

  describe '#pretty_price' do
    it 'returns price in dollars with two decimal places' do
      post = build(:post, cost_in_cents: 925)
      expect(post.pretty_price).to eq '9.25'

      post = build(:post, cost_in_cents: 1000)
      expect(post.pretty_price).to eq '10.00'
    end
  end

  describe '.awaiting_correction' do
    it 'returns posts w/ status awaiting correction and nil correction text' do
      awaiting = create(:post, status: :awaiting_correction, corrected_text: nil, user: correcter)
      complete = create(:post, status: :awaiting_correction, corrected_text: 'Some text', user: correcter)
      complete = create(:post, status: :complete, user: correcter)

      expect(Post.awaiting_correction.count).to eq 1
    end
  end

  describe '.not_mine' do
    it 'returns posts not belonging to current user' do
      my_post = create :post, user: correcter
      not_my_post = create :post, user: submitter

      expect(Post.not_mine(correcter.id)).to eq [ not_my_post ]
    end
  end
end
