# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Criando papeis de usuario
Role.create(:id => 1, :name => "Admin")
Role.create(:id => 2, :name => "Avaliador")

#Criando usuario incial do sistema, com senha '12345678'
user = User.create(email: 'admin@admin.com', :password => 12345678, :password_confirmation => 12345678)

#Adicionando Role 'Admin' ao usuario inicial
user.add_role :Admin
user.save!


#Inserindo os eventos do edital 2015
 Evento.create(:descricao => 'Período de inscrições')
 Evento.create(:descricao => 'Período de avaliação da etapa 1')
 Evento.create(:descricao => 'Divulgação do resultado da etapa 1')
 Evento.create(:descricao => 'Período para recursos da etapa 1')
 Evento.create(:descricao => 'Período de avaliação da etapa 2')
 Evento.create(:descricao => 'Divulgação do resultado da etapa 2')
 Evento.create(:descricao => 'Período para recursos da etapa 2')
 Evento.create(:descricao => 'Divulgação do resultado final')
 Evento.create(:descricao => 'Período para recursos do resultado final')
 Evento.create(:descricao => 'Período para confirmação da intenção de cursar')
 Evento.create(:descricao => 'Período de matrículas e data de início das aulas')


