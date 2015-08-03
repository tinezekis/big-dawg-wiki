class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :updating_author_id
      t.integer :article_id
      t.text :content
      t.text :footnotes
      t.boolean :is_most_recent
      t.boolean :is_published

      t.timestamps null: false
    end
  end
end
