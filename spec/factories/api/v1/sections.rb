FactoryGirl.define do
  factory :api_v1_section, class: Api::V1::Section do
    id '24c6a552-eef7-4c5a-abfb-6df2f7133960'
    name 'Sketchy Section Name'
    subtitle 'Section Subtitle'
    chapter_id '848066f5-2fb3-474b-99d9-010c59cfc428'
    visible true
    created_at '2016-04-30 19:32:41'
    updated_at '2016-04-30 19:32:41'
    minutes 10
    hotspot ''
    image nil
    video nil
    position 1
    caption nil
    html_title nil
    video_available true
    quiz_available true
    slug 'slug-name'
  end
end