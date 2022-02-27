class SessionsView
  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username}"
    end
  end

  def ask_user_for(stuff)
    puts "what is the #{stuff}?"
    print ">  "
    gets.chomp
  end
end
