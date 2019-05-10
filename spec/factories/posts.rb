FactoryBot.define do
  factory :post do
    original_text { "MyText" }
    corrected_text { "MyText" }
  end

  factory :uncorrected_post do
    original_text { 'Some text' }
  end
end
