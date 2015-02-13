class Ability
    include CanCan::Ability

    def initialize(user)
    
        #user ||= User.new # guest user (not logged in)
        if user != nil
            can :manage, Cidade
            if user.has_role? :Admin
                can [:new, :create, :index, :show], AvaliacaoCurriculo
                can :manage, Edital
                can :manage, LinhaPesquisa
                can :manage, ProcessoSeletivo
                can :manage, ProcessoSeletivosLinhaPesquisa
                can :manage, DetalhesEvento
                can :manage, Evento
                can :manage, Cidade
                can :manage, User
                can :manage, Role
            elsif user.has_role? :Gestor
                #All the "Gestor" stuff go here
            elsif user.has_role? :Avaliador
                #All the "Avaliador" stuff go here
                can [:edit, :show, :update, :avaliar_curriculos], AvaliacaoCurriculo
            else
                #Aqui vão todas as ações permitidas a usuários logados, mas sem papel, ou seja, candidatos
                #can :manage, Inscricao, :user_id => user.id
            end
            #Aqui vão as permissões para qualquer usuário logado
            can :create, Pessoa
            can [:edit, :read, :update, :index], Pessoa do |pessoa|  
                pessoa.try(:user) == user  
            end 
            can :manage, Inscricao do |inscricao|  
                inscricao.try(:user) == user  
            end 
            can :manage, ProducaoCientifica
        end
    end
    
end