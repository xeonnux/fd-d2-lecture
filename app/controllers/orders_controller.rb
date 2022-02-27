require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/sessions_view"
require_relative "../views/orders_view"

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new
    @orders_view = OrdersView.new
  end

  # def add
  #   meals = @meal_repository.all
  #   @meals_view.display(meals)
  #   index = @orders.ask_user_for_index
  #   meal = meals[index]

  #   customers = @customer_repository.all
  #   @customers_view.display(customers)
  #   index_customer = @orders.ask_user_for_index
  #   customer = customers[index_customer]

  #   employees = @employee_repository.all
  #   @sessions_view.display(employees)
  #   index_customer = @orders.ask_user_for_index
  #   employee = employees[index]

  #   order = Order.new(meal: meal , customer: customer, employee: employee)

  #   @order_repository.create(order)
  # end

  def add
    # ----- Underneath we have seperated the selection in methods kept in private ----- #
    meal = select_meal
    customer = select_customer
    employee = select_employee
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @orders_view.display(undelivered_orders)
  end

  def list_my_orders(current_user)
    orders = @order_repository.my_undelivered_orders(current_user)
    @orders_view.display(orders)
  end

  def mark_as_delivered(current_user)
    # we display the list of orders
    my_orders = @order_repository.my_undelivered_orders(current_user)
    @orders_view.display(my_orders)

    # We ask the user to choose the index of the order to mark as delivered
    index = @orders_view.ask_user_for_index
    order = my_orders[index]
    @order_repository.mark_as_delivered(order)
  end

  private

  def select_meal
    meals = @meal_repository.all
    @meals_view.display(meals)
    index = @orders_view.ask_user_for_index
    return meals[index]
  end

  def select_customer
    customers = @customer_repository.all
    @customers_view.display(customers)
    index = @orders_view.ask_user_for_index
    return customers[index]
  end

  def select_employee
    employees = @employee_repository.all_riders
    @sessions_view.display(employees)
    index = @orders_view.ask_user_for_index
    return employees[index]
  end
end
