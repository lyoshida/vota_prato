class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome, limite:80
      t.integer :idade
      t.timestamps
    end
  end
end
