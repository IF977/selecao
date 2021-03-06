class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :cpf
      t.date :data_nascimento
      t.string :naturalidade
      t.string :nacionalidade
      t.string :estado_civil
      t.string :grau_formacao
      t.string :logradouro
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.references :cidade
      t.references :estado, index: true
      t.string :cep
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :pessoas, :users
    add_foreign_key :pessoas, :estados
  end
end
