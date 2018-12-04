class Requerimento < ApplicationRecord
  # belongs_to :requerente, class_name: "Usuario", foreign_key: "requerente_id"
  # belongs_to :atribuido, class_name: "Usuario", foreign_key: "atribuido_id"
  # default_scope -> { order(data_criacao: :desc) }

  # validates :requerente_id, presence: true, numericality: { only_integer: true }
  # validates :opcao_requerimento_id, presence: true, numericality: { only_integer: true }
  # validates :descricao, presence: true, length: { maximum: 500 }
  # validates :status_requerimento_id, presence: true, numericality: { only_integer: true }
  # validates :data_criacao, presence: true
  # validates :disciplina_id, allow_blank: true
  # validates :data_conclusao, allow_blank: true

  before_create :check_create
  before_create :check_update

  protected
    def check_create
      self.status_requerimento_id = 2
      self.data_criacao = DateTime.now
      self.atribuido_id = 5
      if(self.opcao_requerimento_id == 1 ||
        self.opcao_requerimento_id == 2 ||
        self.opcao_requerimento_id == 3 ||
        self.opcao_requerimento_id == 4 ||
        self.opcao_requerimento_id == 5 ||
        self.opcao_requerimento_id == 6 ||
        self.opcao_requerimento_id == 7 ||
        self.opcao_requerimento_id == 8)
          self.atribuido_id == 5
      else
          self.atribuido_id == 4
      end
    end
    def check_update
      if (self.status_requerimento_id == 3 || self.status_requerimento_id == 4)
        self.data_conclusao = DateTime.now
      end
    end
end