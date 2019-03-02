FactoryGirl.define do
  factory :api_v1_chapter, class: Api::V1::Chapter do
    id '848066f5-2fb3-474b-99d9-010c59cfc428'
    name 'Sketchy Chapter'
    course_id '1407572e-00f0-482b-99ea-117789c04b31'
    visible true
    position 1
    slug 'chapter'
    created_at '2016-04-30 19:32:41'
    updated_at '2016-04-30 19:32:41'
  end
end