FactoryBot.define do
  factory :purchase_item do
    postcode  {"123-4567"}
    prefecture_id {2}
    city {"札幌市"}
    block {"1-1"}
    building {"札幌ハイツ"}
    phon_number {"09012345678"}
  end
end
