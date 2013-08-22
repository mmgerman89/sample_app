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
 
 describe "cuando el formato del email es invalido" do
   it "debe ser invalido" do
     correos = %w[user@foo,com user at foo.org example.user@foo.
                  foo@bar baz.com foo@bar+baz.com]
     
     correos.each do |correo_invalido|
       @usuario.email = correo_invalido
       @usuario.should_not be_valid
     end
   end
 end
 
 describe "cuando el formato del email es valido" do
   it "debe ser valido" do
     correos = %w[user@foo.COM AUS-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
     
     correos.each do |correo_valido|
       @usuario.email = correo_valido
       @usuario.should be_valid
     end
   end
 end
 
 describe "cuando el email ya fue utilizado" do
   before do
     usuario_duplicado = @usuario.dup
     usuario_duplicado.email = @usuario.email.upcase
     usuario_duplicado.save
   end
   
   it { should_not be_valid }
 end
end
