class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :fname
    	t.text :description
    	t.string :uupc

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
