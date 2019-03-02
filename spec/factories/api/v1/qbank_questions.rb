FactoryGirl.define do
  factory :api_v1_qbank_question, class: Api::V1::QbankQuestion do
    id '870ea6e5-1b96-4813-abbb-88e99612db57'
    question 'What is 2 + 2?'
    section_id '24c6a552-eef7-4c5a-abfb-6df2f7133960'
    chapter_id '848066f5-2fb3-474b-99d9-010c59cfc428'
    course_id '1407572e-00f0-482b-99ea-117789c04b31'
    package_id 'fb731380-aff9-11e8-96f8-529269fb1459'
    created_at nil
    updated_at nil

    trait :qbank_answer do
      after (:create) do |qbank_question|
        qbank_question.answers << FactoryGirl.create(:api_v1_qbank_answer)
      end
    end
  end
end