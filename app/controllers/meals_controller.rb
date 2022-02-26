require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(repository)
    @view = MealsView.new
    @repository = repository
  end

  def add
    # get name and price from view
    name = @view.ask_user_for(:name)
    price = @view.ask_user_for(:price).to_i
    # create new meal instance
    meal = Meal.new(name: name, price: price)
    # add meal instance to repo
    @repository.create(meal)
  end

  def list
    # Get array of meals (repo)
    meals = @repository.all
    # Display in terminal (view)
    @view.display(meals)
  end
end
