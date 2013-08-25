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
 before do
  @usuario = Usuario.new(nombre: "Ger", email: "german@martinez.com",
                        password: "asdasd", password_confirmation: "asdasd")
 end
 
 subject { @usuario }
 
 it { should respond_to(:nombre) }
 it { should respond_to(:email) }
 it { should respond_to(:password_digest) }
 it { should respond_to(:password) }
 it { should respond_to(:password_confirmation) }
 it { should respond_to(:authenticate) }
 
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
 
 # Test para el password
 
 describe "cuando el password esta vacio" do
   before { @usuario.password = @usuario.password_confirmation = " " }
   it { should_not be_valid }
 end
 
 describe "cuando el password no coincide con la confirmacion" do
   before { @usuario.password_confirmation = "otracosa" }
   it { should_not be_valid }
 end
 
 describe "cuando el password de confirmacion es nil" do
   before { @usuario.password_confirmation = nil }
   it { should_not be_valid }
 end
 
 describe "resultado devuelto por el valor del metodo authenticate" do
   before { @usuario.save }
   let(:usuario_encontrado) { Usuario.find_by_email(@usuario.email) }
   
   describe "con password valido" do
     it { should == usuario_encontrado.authenticate(@usuario.password) }
   end
   
   describe "con password invalido" do
     let(:usuario_pass_invalido) { usuario_encontrado.authenticate("invalido") }
     
     it { should_not == usuario_pass_invalido }
     specify { usuario_pass_invalido.should be_false }
   end
 end
 
 describe "con el password muy corto" do
   before { @usuario.password = @usuario.password_confirmation = "a" * 5 }
   it { should be_invalid }
 end
 
end
