class LinhaPesquisa < ActiveRecord::Base
  resourcify

  belongs_to :edital
end
