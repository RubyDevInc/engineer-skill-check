module SignInSupport
  def sign_in(employee)
    visit login_path
    fill_in 'account', with: employee.account
    fill_in 'password', with: employee.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
  end
end
