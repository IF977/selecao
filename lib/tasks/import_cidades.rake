require 'csv'

namespace :csv do

  desc "Import CSV Data"
  task :import_cidades => :environment do

    #Estados
    estados_file_path = 'db/seeds/estados.csv'
    print ('Incluindo estados. Aguarde. \n')
    CSV.foreach(estados_file_path) do |row|
      Estado.create!({
        :id => row[0],
        :nome => row[1],
        :sigla => row[2],        
      })
    end

    #Cidades
    cidades_file_path = 'db/seeds/cidades.csv'
    print ('Incluindo cidades. Aguarde. \n')
    CSV.foreach(cidades_file_path) do |row|
     Cidade.create!({
       :id => row[0],
       :estado_id => row[1],
       :nome => row[2],        
     })
    end
  end
end