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
  attr_accessible :email, :nombre
  
  validates :nombre, presence: true, length: { maximum: 50 }
  validates :email, presence: true
end
