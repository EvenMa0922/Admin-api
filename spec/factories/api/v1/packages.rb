FactoryGirl.define do
  factory :api_v1_package, class: Api::V1::Package do
    id 'fb731380-aff9-11e8-96f8-529269fb1459'
    name 'Tea'
    description 'Hello world'
    visible false
    created_at '2016-04-30 19:32:41'
    updated_at '2016-04-30 19:32:41'
    slug 'asd'
    position 7
    exam_level 'step-2'
    # trait :course do
    #   after(:build) do |package|
    #     package.courses << FactoryGirl.create(:api_v1_course)
    #     FactoryGirl.create(:api_v1_chapter)
    #     FactoryGirl.create(:api_v1_section)
    #     FactoryGirl.create(:api_v1_sketchy_symbol)
    #   end
    # end
  end
end