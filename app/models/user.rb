class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_roles#, :dependent => :destroy
  has_many :roles, through: :users_roles
  accepts_nested_attributes_for :user_roles, :allow_destroy => true

  has_one :pessoa
  accepts_nested_attributes_for :pessoa

  def my_roles
  	my_roles = self.roles.pluck(:name)
  	retorno = ""
    if my_roles.length > 0
      for i in 0...my_roles.length
        retorno = retorno + my_roles[i] + "\n"
      end 
    end
    retorno
  end

end
