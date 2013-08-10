require 'spec_helper'

describe "Paginas Estaticas" do
  
  describe "Pagina de Inicio" do
    it "debe contener 'Inicio'" do
      visit '/paginas_estaticas/inicio'
      page.should have_selector('h1', :text => 'Inicio')
    end
    
    it "debe tener el titulo 'Inicio'" do
      visit '/paginas_estaticas/inicio'
      page.should have_selector('title', :text => "Tamos | Inicio")
    end
  end
  
  describe "Pagina de Ayuda" do
    it "debe contener 'Ayuda'" do
      visit '/paginas_estaticas/ayuda'
      page.should have_selector('h1', :text => 'Ayuda')
    end
    
    it "debe tener el titulo 'Ayuda'" do
      visit '/paginas_estaticas/ayuda'
      page.should have_selector('title', :text => "Tamos | Ayuda")
    end
  end
  
  describe "Pagina Acerca de" do
    it "debe contener 'Acerca de nosotros'" do
      visit '/paginas_estaticas/acerca'
      page.should have_selector('h1', :text => 'Acerca de nosotros')
    end
    
    it "debe tener el titulo 'Acerca'" do
      visit '/paginas_estaticas/acerca'
      page.should have_selector('title', :text => "Tamos | Acerca")
    end
  end
  
  describe "Pagina de Contacto" do
    it "debe contener 'Contacto'" do
      visit '/paginas_estaticas/contacto'
      page.should have_selector('h1', :text => 'Contacto')
    end
    
    it "debe tener el titulo 'Contacto'" do
      visit '/paginas_estaticas/contacto'
      page.should have_selector('title', :text => "Tamos | Contacto")
    end
  end
end
