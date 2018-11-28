class StatusRequerimento < ApplicationRecord
  validates :nome, presence: true
end