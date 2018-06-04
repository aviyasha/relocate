class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	has_one :address, as: :resource

 	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "200x200>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_attached_file :resume
  validates_attachment_file_name :resume, matches: [/\.pdf$/, /\.docx?$/, /\.xlsx?$/, /\.odt$/, /\.ods$/]

 	def full_name
		[first_name, last_name].reject(&:blank?).join(' ').titleize
 	end

 	def age
 		return nil unless birth_date.present?
 		
 		Date.current.year - birth_date.year
 	end
end
