class Test < ActiveRecord::Base
  validates :title, presence: true
  has_many :test_instances
  has_many :questions
end
