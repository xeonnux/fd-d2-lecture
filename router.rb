class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    # implement login
    while @running
      @current_user = @sessions_controller.login
      while @current_user
        if @current_user.manager?
          # if username && password manager -> access to manager menu
          # display manager menu
          route_manager_action
        else
          # display rider menu
          # if username && password is rider -> access to rider menu
          route_rider_action
        end
      # option to logout
      # print_menu
      # choice = gets.chomp.to_i
      # print `clear`
      # route_action(choice)
      end
    end
  end

  private

  # def print_menu
  #   puts "--------------------"
  #   puts "------- MENU -------"
  #   puts "--------------------"
  #   puts "1. Add new meal"
  #   puts "2. List all meals"
  #   puts "3. Add new customer"
  #   puts "4. List all customers"
  #   puts "8. Exit"
  #   print "> "
  # end

  def route_manager_action
    print_manager_menu
    choice = gets.chomp.to_i
    print `clear`
    manager_action(choice)
  end

  def route_rider_action
    print_rider_menu
    choice = gets.chomp.to_i
    print `clear`
    rider_action(choice)
  end

  def print_manager_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. Add new order"
    puts "6. List all undelivered orders"
    puts "7. Log out"
    puts "8. Exit"
    print "> "
  end

  def print_rider_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. Log out"
    puts "6. Exit"
    print "> "
  end

  def manager_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then puts "TODO"
    when 6 then puts "TODO"
    when 7 then logout!
    when 8 then stop!
    else puts "Try again..."
    end
  end

  
  def rider_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then logout!
    when 6 then stop!
    else puts "Try again..."
    end
  end

  # def route_action(choice)
  #   case choice
  #   when 1 then @meals_controller.add
  #   when 2 then @meals_controller.list
  #   when 3 then @customers_controller.add
  #   when 4 then @customers_controller.list
  #   when 8 then stop!
  #   else puts "Try again..."
  #   end
  # end

  def logout!
    @current_user = nil
  end

  def stop!
    logout!
    @running = false
  end
end

# # TODO: implement the router of your app.
# class Router
#   def initialize(meals_controller, custo_contro)
#     @meals_controller = meals_controller
#     @custo_controller = custo_contro
#   end

#   def run
#     puts "------------------------------"
#     puts "------------ MENU ------------"
#     puts "------------------------------"
#     puts "What do you want to do"
#     puts "1 - List all meals"
#     puts "2 - Add a meal"
#     puts "3 - List customer"
#     puts "9 - Quit"
#     print "> "
#     action = gets.chomp.to_i
#     case action
#     when 1 then @meals_controller.list
#     when 2 then @meals_controller.add
#     when 3 then @custo_controller.list
#     when 9 then "Goodbye!"
#     else
#       puts "Wrong number typed try again"
#     end
#   end
# end
