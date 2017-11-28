class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    id = user.id

    if user.admin?
      can :manage, [User, Book]
    else
      can :read, User
      can [:show, :search], Book
    end
    can :manage, Review, user_id: id
    can :read, Review
    can :manage, Comment, user_id: id
    can :read, Comment
    can :show, Category
    can %i(create update destroy), ReadingHistory
    can %i(create destroy), Vote
  end
end
