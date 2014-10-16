class User < ActiveRecord::Base
  has_many :tests

  def authorized?(action)
    case self.role
    when "admin"
      true
    when "teacher"
      true unless action == 'delete_all'
    when "student"
      false unless action == 'take'
    else
      false
    end
  end
end
