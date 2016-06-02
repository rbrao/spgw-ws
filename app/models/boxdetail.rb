class Boxdetail < ActiveRecord::Base
  belongs_to :department, :foreign_key => :department_id
  belongs_to :location, :foreign_key => :location_id
  belongs_to :operatingsystem, :foreign_key => :operatingsystem_id
  belongs_to :servicestate, :foreign_key => :servicestate_id
end
