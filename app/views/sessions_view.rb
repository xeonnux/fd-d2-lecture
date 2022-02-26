class SessionsView
  
  def ask_user_for(stuff)
    puts "what is the #{stuff}?"
    print ">  "
    gets.chomp
  end
end
