class Test < ActiveRecord::Base
  validates :title, presence: true
  has_many :question
end
