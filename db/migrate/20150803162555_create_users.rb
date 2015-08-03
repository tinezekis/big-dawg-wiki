class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :permission_level
      t.string :username
      t.string :hashed_password

      t.timestamps null: false
    end
  end
end
