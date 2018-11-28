class OpcaoRequerimento < ApplicationRecord
  validates :nome, presence: true
end