module Api::V1
  class QbankQuestion < ActiveRecord::Base
    belongs_to :package
    belongs_to :course
    belongs_to :chapter
    belongs_to :section
    has_many :qbank_answers
  end
end