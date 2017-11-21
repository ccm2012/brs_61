class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.admin?
      can :manage, [User, Book]
    else
      can :read, User
      can [:read, :search], Book
    end
    can :show, Category
    can %i(create update destroy), ReadingHistory
  end
end
