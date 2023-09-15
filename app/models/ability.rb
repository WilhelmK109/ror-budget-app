class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Category, author_id: user.id
    can :read, Expense, author_id: user.id
    can :destroy, Category, author_id: user.id
    can :destroy, Expense, author_id: user.id
  end
end
