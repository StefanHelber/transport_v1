class Demandsite < ActiveRecord::Base
  attr_accessible :demand_quantity, :site_id

  belongs_to :site, :class_name => "Site"
  has_many :translinks, :dependent => :destroy
  accepts_nested_attributes_for :translinks


  def demandsite_codename
    self.site.codename
  end

end
