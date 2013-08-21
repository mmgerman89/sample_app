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

require 'spec_helper'

describe Usuario do
 before { @usuario = Usuario.new(nombre: "Ger", email: "german@martinez.com") }
 
 subject { @usuario }
 
 it { should respond_to(:nombre) }
 it { should respond_to(:email) }
 
 it { should be_valid }
 
 describe "cuando el nombre no esta presente" do
   before { @usuario.nombre = " " }
   it { should_not be_valid }
 end
 
 describe "cuando el email esta vacio" do
   before { @usuario.email = " " }
   it { should_not be_valid }
 end
 
 describe "cuando el nombre es muy largo" do
   before { @usuario.nombre = "a" * 51 }
   it { should_not be_valid }
 end
end
