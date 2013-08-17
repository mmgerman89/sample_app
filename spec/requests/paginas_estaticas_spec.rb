require 'spec_helper'

describe "Paginas Estaticas" do
  
  let(:titulo_base) { "Tamos" }
  
  describe "Pagina de Inicio" do
    it "debe contener 'Inicio'" do
      visit root_path
      page.should have_selector('h1', :text => 'Bienvenido')
    end
    
    it "debe tener el titulo 'Inicio'" do
      visit root_path
      page.should have_selector('title', :text => "#{titulo_base} | Inicio")
    end
  end
  
  describe "Pagina de Ayuda" do
    it "debe contener 'Ayuda'" do
      visit ayuda_path
      page.should have_selector('h1', :text => 'Ayuda')
    end
    
    it "debe tener el titulo 'Ayuda'" do
      visit ayuda_path
      page.should have_selector('title', :text => "#{titulo_base} | Ayuda")
    end
  end
  
  describe "Pagina Acerca de" do
    it "debe contener 'Acerca de nosotros'" do
      visit acerca_path
      page.should have_selector('h1', :text => 'Acerca de nosotros')
    end
    
    it "debe tener el titulo 'Acerca'" do
      visit acerca_path
      page.should have_selector('title', :text => "#{titulo_base} | Acerca")
    end
  end
  
  describe "Pagina de Contacto" do
    it "debe contener 'Contacto'" do
      visit contacto_path
      page.should have_selector('h1', :text => 'Contacto')
    end
    
    it "debe tener el titulo 'Contacto'" do
      visit contacto_path
      page.should have_selector('title', :text => "#{titulo_base} | Contacto")
    end
  end
end
