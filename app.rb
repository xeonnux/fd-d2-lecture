# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative "router"

require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/meal_repository'

require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/customer_repository'

require_relative 'app/controllers/sessions_controller'
require_relative 'app/repositories/employee_repository'

custo_repo = CustomerRepository.new(File.join(__dir__, 'data/customers.csv'))
custo_controller = CustomersController.new(custo_repo)

meal_repo = MealRepository.new(File.join(__dir__, 'data/meals.csv'))
meals_controller = MealsController.new(meal_repo)

employee_repository = EmployeeRepository.new(File.join(__dir__, 'data/employees.csv'))
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(meals_controller, custo_controller, sessions_controller)

router.run
