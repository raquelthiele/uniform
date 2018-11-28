class Aluno < ApplicationRecord
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }
  validates :matricula, presence: true, length: { is: 11 }, numericality: { only_integer: true }
end