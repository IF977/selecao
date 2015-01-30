require 'csv'

namespace :csv do

  desc "Import CSV Data"
  task :import_estados => :environment do

    estados_file_path = 'db/seeds/estados.csv'
    #Estados
    CSV.foreach(estados_file_path) do |row|
      Estado.create!({
        :id => row[0],
        :nome => row[1],
        :sigla => row[2],        
      })
    end

    #Cidades
    #cidades_file_path = 'db/seeds/cidades.csv'
    #CSV.foreach(cidades_file_path) do |row|
    #  Cidade.create!({
    #    :id => row[0],
    #    :estado_id => row[1],
    #    :nome => row[2],        
    #  })
    #end
  end
end