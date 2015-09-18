class Provincia < ActiveRecord::Base
	has_many :localidades

	validates :detalle, presence: true, length: {maximum: 70}
	validates :codigo, presence: true
end
