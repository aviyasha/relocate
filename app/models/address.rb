class Address < ActiveRecord::Base
  belongs_to :resource, polymorphic: true

  def to_string
    [address_1,
     address_2,
     address_3,
     city,
     state,
     zip].reject(&:blank?).join(', ')
  end
end
