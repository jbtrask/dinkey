class Person < ActiveRecord::Base

  belongs_to :couple
  before_save :set_status

  def set_status
    self.status ||= Forgery(:lorem_ipsum).words((2..40).to_a.sample)
  end

end
