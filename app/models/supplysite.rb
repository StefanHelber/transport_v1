class Supplysite < ActiveRecord::Base
  attr_accessible :supply_quantity, :site_id

  belongs_to :site, :class_name => "Site"
  has_many :translinks, :dependent => :destroy
  accepts_nested_attributes_for :translinks


  def supplysite_codename
    self.site.codename
  end
end
