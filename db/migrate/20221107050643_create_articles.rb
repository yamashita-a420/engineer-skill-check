class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, null:false
      t.text :content, null:false
      t.integer :author, null:false
      t.datetime :deleted_at, precision: 6

      t.timestamps
    end
  end
end
