class Tecnico < ApplicationRecord
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }
  validates :siape, presence: true, numericality: { only_integer: true }
end