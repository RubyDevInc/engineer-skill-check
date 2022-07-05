require 'csv'
csv_data = CSV.generate do |csv|
  csv << %w(社員番号 氏名(姓) 氏名(名) アカウント パスワード メールアドレス 入社年月日 部署 オフィス 社員情報管理権限 お知らせ投稿権限)
  @employees.each do |employee|
    csv << [
      employee.number,
      employee.last_name,
      employee.first_name,
      employee.account,
      employee.password,
      employee.email,
      employee.date_of_joining,
      employee.department.name,
      employee.office.name,
      employee.employee_info_manage_auth,
      employee.news_posting_auth,
    ]
  end
  csv_data
end
