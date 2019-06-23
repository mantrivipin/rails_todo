# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.admin?
        can :manage, :all
      end
      can [:set_status, :update_status], Task, user_id: user.id
    end
  end
end
