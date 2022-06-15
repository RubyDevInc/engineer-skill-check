class RenameEmailColumnToEmployees < ActiveRecord::Migration[6.1]
  def change
    rename_column :employees, :email, :e_mail
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
