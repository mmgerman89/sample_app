require 'spec_helper'

describe "Paginas Estaticas" do
  
  describe "Pagina de Inicio" do
    it "debe contener 'Inicio'" do
      visit '/paginas_estaticas/inicio'
      page.should have_content('Inicio')
    end
  end
  
  describe "Pagina de Ayuda" do
    it "debe contener 'Ayuda'" do
      visit '/paginas_estaticas/ayuda'
      page.should have_content('Ayuda')
    end
  end
  
  describe "Pagina Acerca de" do
    it "debe contener 'Acerca de nosotros'" do
      visit '/paginas_estaticas/acerca'
      page.should have_content('Acerca de nosotros')
    end
  end
  
  describe "Pagina de Contacto" do
    it "debe contener 'Contacto'" do
      visit '/paginas_estaticas/contacto'
      page.should have_content('Contacto')
    end
  end
end
