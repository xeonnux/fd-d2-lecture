# id
# username
# password
# role ( manager / rider)

class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  # method to identify manager
  def manager?
    @role == 'manager'
  end

  # method to identify rider
  def rider?
    @role == 'rider'
  end
end
