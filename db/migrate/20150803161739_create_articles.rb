class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :orig_author_id

      t.timestamps null: false
    end
  end
end
