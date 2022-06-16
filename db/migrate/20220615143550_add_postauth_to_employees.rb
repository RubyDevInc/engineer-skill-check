# frozen_string_literal: true

class AddPostauthToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :news_posting_auth, :boolean, null: false
  end
end
