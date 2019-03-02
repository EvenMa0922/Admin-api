FactoryGirl.define do
  factory :api_v1_sketchy_symbol, class: Api::V1::SketchySymbol do
    id '54d1133e-9dcf-404e-ad0a-9c2c1068679a'
    symbol_name 'Sketchy Symbol Name'
    hotspot_info 'Zero calories'
    cartesian_x 10.01
    cartesian_y 10.02
    position 1
    width nil
    height nil
    width_res nil
    height_res nil
    section_id '24c6a552-eef7-4c5a-abfb-6df2f7133960'
    soap_category_id nil
  end
end