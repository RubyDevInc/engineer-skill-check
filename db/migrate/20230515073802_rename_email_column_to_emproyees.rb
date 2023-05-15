class RenameEmailColumnToEmproyees < ActiveRecord::Migration[6.1]
  def change
    rename_column :employees, :email, :e_mail
  end
end
