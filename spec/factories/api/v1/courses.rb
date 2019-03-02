FactoryGirl.define do
  factory :api_v1_course, class: Api::V1::Course do
    id '1407572e-00f0-482b-99ea-117789c04b31'
    name 'Sketchy & Course'
    description nil
    package_id 'fb731380-aff9-11e8-96f8-529269fb1459'
    visible true
    position 1
    slug 'course'
    running_time '2h 45m'
    created_at '2016-04-30 19:32:41'
    updated_at '2016-04-30 19:32:41'
  end
end