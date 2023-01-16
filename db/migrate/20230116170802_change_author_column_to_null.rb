class ChangeAuthorColumnToNull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :articles, :author, true
  end

  def down
    change_column_null :articles, :author, false
  end
end
