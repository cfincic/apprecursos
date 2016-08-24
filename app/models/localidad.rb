class Localidad < ActiveRecord::Base
  belongs_to :provincia

  validates :detalle, presence: true, length: {maximum: 70}
  validates :provincia, presence: true
  validates :codigo, presence: true
end
