require 'rails_helper'

RSpec.describe Post, type: :model do
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
      awaiting = create(:post, status: :awaiting_correction, corrected_text: nil)
      complete = create(:post, status: :awaiting_correction, corrected_text: 'Some text')
      complete = create(:post, status: :complete)

      expect(Post.awaiting_correction.count).to eq 1
    end
  end
end
