class MealsView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - MUR #{meal.price}"
    end
  end

  def ask_user_for(stuff)
    puts "what is the #{stuff}?"
    print ">  "
    gets.chomp
  end
end
