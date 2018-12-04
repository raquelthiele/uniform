class Usuario < ApplicationRecord

  has_many :requerimentos_requeridos, class_name: "Requerimento", foreign_key: "requerente_id"
  # has_many :requerimentos_atribuidos, class_name: "Requerimento", foreign_key: "atribuido_id"

  attr_accessor :tipo, :matricula, :siape

  before_save { self.email = email.downcase }

  validates :cpf, presence: true, uniqueness: true, length: { is: 11 },
    numericality: { only_integer: true }
  validates :nome, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX }
  validates :celular, presence: true, length: { is: 11 },
    numericality: { only_integer: true }
  validates :residencial, allow_blank: true, length: { is: 11 },
    numericality: { only_integer: true }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 },
    allow_nil: true
  validates :tipo, presence: true

  # Returns the hash digest of the given string.
  def Usuario.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def requerimentos
    Requerimento.where("requerente_id = ? OR atribuido_id = ?", self.id, self.id)
  end
  def requerimentos_requeridos
    Requerimento.where("requerente_id = ? ", self.id)
  end
  def requerimentos_atribuidos
    Requerimento.where("atribuido_id = ?", self.id)
  end

  def tecnico?
    # current_usuario.tipo?
    true
  end

  def professor?
    # current_usuario.tipo?
    true
  end

  def aluno?
    # current_usuario.tipo?
    true
  end
end