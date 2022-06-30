class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :Author
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
