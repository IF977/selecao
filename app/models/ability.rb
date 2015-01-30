class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

    user ||= User.new # guest user (not logged in)
    if user.has_role? :Admin
      can :manage, :all
    else
        if user.has_role? :Gestor
            #All the "Gestor" stuff go here
            can :manage, :edital
            can :manage, :linha_pesquisa
        else
            if user.has_role? :Avaliador
                #All the "Avaliador" stuff go here
            else
            #Aqui vão todas as ações permitidas a usuários logados, mas sem papel, ou seja, candidatos
            can :update, Pessoa, :user_id => user.id
            end
        end
      #can :read, :all
    end
  end
end
