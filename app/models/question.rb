class Question < ActiveRecord::Base
  validates :difficulty, numericality: true
  has_many :answer
end
