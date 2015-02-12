class Ability
    include CanCan::Ability

    def initialize(user)
    
        #user ||= User.new # guest user (not logged in)
        if user != nil
            if user.has_role? :Admin
                can :manage, :all
            elsif user.has_role? :Gestor
                #All the "Gestor" stuff go here
                can :manage, :edital
                can :manage, :linha_pesquisa
            elsif user.has_role? :Avaliador
                #All the "Avaliador" stuff go here
                can [:edit, :show, :update, :index, :resultado], AvaliacaoCurriculo
            else
                #Aqui vão todas as ações permitidas a usuários logados, mas sem papel, ou seja, candidatos
                #can :manage, Inscricao, :user_id => user.id
                can :manage, Inscricao
                can :manage, ProducaoCientifica
            end
            #Aqui vão as permissões para qualquer usuário logado
            can :create, Pessoa
            can [:edit, :read, :update, :index], Pessoa do |pessoa|  
                pessoa.try(:user) == user  
            end 
        end
    end
    
end