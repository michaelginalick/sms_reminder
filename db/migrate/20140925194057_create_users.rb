class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password
      t.string :pasword_digest
      t.boolean :verified

      t.timestamps
    end
  end
end
