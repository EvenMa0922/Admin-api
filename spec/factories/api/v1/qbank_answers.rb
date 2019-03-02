FactoryGirl.define do
  factory :api_v1_qbank_answer, class: Api::V1::QbankAnswer do
    id '035e3936-a08c-4d67-a11a-bd749f45872d'
    answer '4'
    qbank_question_id '870ea6e5-1b96-4813-abbb-88e99612db57'
    correct true
    explanation 'When you sum 2 and 2 together, you get 4'
    created_at nil
    updated_at nil
  end
end