class Translink < ActiveRecord::Base
  attr_accessible :demandsite_id, :supplysite_id, :transport_quantity, :unit_cost
  belongs_to :supplysite, :class_name =>  "Supplysite"
  belongs_to :demandsite, :class_name =>  "Demandsite"
end
