class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_roles, :dependent => :destroy
  has_many :roles, through: :users_roles
  accepts_nested_attributes_for :user_roles, :allow_destroy => true

  def user_roles
  	user_roles = self.roles.pluck(:name)
  	retorno = "| "
    if user_roles.length > 0
      for i in 0...user_roles.length
        retorno = retorno + user_roles[i] + " | "
      end 
    end
    retorno
  end

  def selected_roles
    Role.pluck(:id, :name).map { |r| [r[0],r[1], user_roles != nil ? user_roles.include?(r[1]) : false] }
  end
end
