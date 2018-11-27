class Usuario < ApplicationRecord

	before_save { self.email = email.downcase }

	validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }
	validates :nome, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
	validates :celular, presence: true, length: { is: 11 }, numericality: { only_integer: true }
	validates :residencial, allow_blank: true, length: { is: 11 }, numericality: { only_integer: true }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end