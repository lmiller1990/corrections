FactoryBot.define do
  factory :post do
    original_text { "MyText" }
    corrected_text { "MyText" }
    cost_in_cents { 25 }
  end

  factory :uncorrected_post do
    original_text { 'Some text' }
    cost_in_cents { 25 }
  end
end
