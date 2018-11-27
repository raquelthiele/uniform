class Requerimento < ApplicationRecord
	validates :codigo, presence: true, uniqueness: true, numericality: { only_integer: true }
	validates :requerente_cpf, presence: true, numericality: { only_integer: true }
	validates :opcao_requerimento_id, presence: true, numericality: { only_integer: true }
	validates :descricao, presence: true, length: { maximum: 500 }
	validates :status_requerimento_id, presence: true, numericality: { only_integer: true }
	validates :data_criacao, presence: true
	validates :disciplina_id, allow_blank: true
	validates :atribuido_cpf, allow_blank: true
	validates :data_conclusao, allow_blank: true
end