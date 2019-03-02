module Api::V1
  class QbankAnswer < ActiveRecord::Base
    belongs_to :qbank_question
  end
end