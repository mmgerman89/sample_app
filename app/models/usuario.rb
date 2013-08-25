# == Schema Information
#
# Table name: usuarios
#
#  id         :integer         not null, primary key
#  nombre     :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Usuario < ActiveRecord::Base
  has_secure_password
  EXP_EMAIL_VALIDO = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  attr_accessible :email, :nombre, :password, :password_confirmation

  
  before_save { |usuario| usuario.email = email.downcase }
  
  validates :nombre, presence: true, length: { maximum: 50 }
  validates :email, presence: true, 
                    format: { with: EXP_EMAIL_VALIDO },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
 
end
