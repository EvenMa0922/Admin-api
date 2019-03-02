module Api::V1
  class Chapter < ActiveRecord::Base

    belongs_to :course
    has_many :sections, -> { where(visible: true).order(position: :asc) }
    has_many :qbank_questions
  end
end