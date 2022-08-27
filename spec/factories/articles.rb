FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Article title #{n}" }
    text { "Article text" }
    file_path { '/uploads/pdf.pdf' }

    factory :article_with_comments do
      after :create do |article, evaluator|
        create_list :comment, 3, article: article
      end
    end
  end
end