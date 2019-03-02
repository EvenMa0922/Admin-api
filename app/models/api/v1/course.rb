module Api::V1
  class Course < ActiveRecord::Base
    belongs_to :package
    has_many :chapters, -> { where(visible: true).order(position: :asc) }
    has_many :qbank_questions
  end
end