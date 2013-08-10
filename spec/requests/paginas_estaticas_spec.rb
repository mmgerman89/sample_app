require 'spec_helper'

describe "Paginas estaticas" do
  describe "Pagina de Inicio" do
    it "debe contener 'Sample App'" do
      visit '/paginas_estaticas/inicio'
      page.should have_content('Sample App')
    end
  end
end
