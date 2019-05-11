class Post < ApplicationRecord
  enum status: [:awaiting_correction, :in_correction, :awaiting_approval, :complete]
  belongs_to :user
  belongs_to :correcter, class_name: 'User', foreign_key: 'claimed_by', optional: true

  scope :awaiting_correction, -> { where(status: :awaiting_correction, corrected_text: nil) }
  scope :not_mine, -> (user_id) { where.not(user_id: user_id) }

  def self.create_with_cost(post_params)
    # TODO: save this somewhere else
    cost_per_word = 5

    Post.create(
      post_params.merge(cost_in_cents: post_params[:original_text].split.count * cost_per_word))
  end

  def word_count
    original_text.split.count
  end

  def pretty_price
    sprintf('%.2f', cost_in_cents / 100.00)
  end
end
