module Api::V1
  class Section < ActiveRecord::Base
    belongs_to :chapter
    has_many :sketchy_symbols
    has_many :qbank_questions
  end
end