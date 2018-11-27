class Disciplina < ApplicationRecord
	validates :codigo, presence: true, numericality: { only_integer: true }
	validates :nome, presence: true
	validates :professor_cpf, presence: true, numericality: { only_integer: true }
end