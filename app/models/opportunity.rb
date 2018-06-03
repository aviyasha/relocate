class Opportunity < ActiveRecord::Base
	has_one :address, as: :resource
end
