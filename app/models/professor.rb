class Professor < ApplicationRecord
	validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }
	validates :siape, presence: true, numericality: { only_integer: true }
	validates :cargo_professor_id, allow_blank: true
end