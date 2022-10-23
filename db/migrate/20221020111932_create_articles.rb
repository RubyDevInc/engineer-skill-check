class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :employee, null: false, foreign_key: true
      t.datetime :deleted_at, null: true, default: nil

      t.timestamps
    end
    add_foreign_key :articles, :employees
  end
end
