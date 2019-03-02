module Api::V1
  class SketchySymbol < ActiveRecord::Base
    belongs_to :section
  end
end