class User < ActiveRecord::Base
  validates :role, inclusion: { in: %w(student teacher admin)}
  has_many :tests
end
