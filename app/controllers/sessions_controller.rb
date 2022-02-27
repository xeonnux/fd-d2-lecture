require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def login
    # 1. Ask user for username
    username = @sessions_view.ask_user_for(:username)
    # 2. Ask user for password
    password = @sessions_view.ask_user_for(:password)
    # 3. Find the employee with the username
    employee = @employee_repository.find_by_username(username)
    # 4. Compare the passsword given with the one in the DB
    if employee.password == password
      return employee
    else
      @sessions_view.wrong_credentials
      login
    end
  end
end
