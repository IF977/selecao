class AvaliacaoPreProjeto < ActiveRecord::Base
  belongs_to :user
  belongs_to :inscricao

  def self.search(query)
  	where("user_id = :q", :q => "#{query}")
  end
end
