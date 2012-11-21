class Site < ActiveRecord::Base
  attr_accessible :codename, :name
  validates :codename, presence: true, length: { maximum: 3, minimum:3 }
  validates :name, presence: true, length: { maximum: 50 }

end
