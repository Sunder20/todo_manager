require './connect_db.rb'
connect_db!

ActiveRecord::Migration.create_table(:users) do |t|
  t.column :name, :text
  t.column :email, :text
  t.column :password, :text  
end
