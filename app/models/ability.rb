class Ability
    include CanCan::Ability

    def initialize(user)
    
    user ||= User.new # guest user (not logged in)
    
        if user.has_role? :Admin
            can :manage, :all
        elsif user.has_role? :Gestor
            #All the "Gestor" stuff go here
            can :manage, :edital
            can :manage, :linha_pesquisa
        elsif user.has_role? :Avaliador
            #All the "Avaliador" stuff go here
        else
            #Aqui vão todas as ações permitidas a usuários logados, mas sem papel, ou seja, candidatos
            can :update, Pessoa, :user_id => user.id
            #can :manage, Inscricao, :user_id => user.id
            can :manage, Inscricao
            can :manage, ExperienciaPdi
            can :manage, ExperienciaDocencia
            can :manage, ExperienciaProfissional
            can :manage, ProducaoCientifica
        end
    end
    
end
