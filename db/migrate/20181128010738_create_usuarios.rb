class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.integer :cpf
      t.string :password_digest
      t.string :nome
      t.string :email
      t.integer :celular
      t.integer :residencial
      t.timestamps
    end
  end
end