class WikiPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
     record.private? || user.present?
  end

  def update?
    user.present?
  end

  class Scope
   attr_reader :user, :scope

   def initialize(user, scope)
     @user = user
     @scope = scope
   end

   def resolve
    if user.present?
      scope.eager_load(:collaborators).where("wikis.private = ? OR wikis.user_id = ? OR collaborators.user_id = ?", false, user.id, user.id)
    else
      scope.where(:private => false)
    end
   end
  end
end
