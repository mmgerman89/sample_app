require 'spec_helper'

describe "Paginas Estaticas" do
  let(:titulo_base) { "Tamos" }
  subject { page }
  
  describe "pagina de inicio" do
    before { visit root_path }
    
    it { should have_selector 'h1', text: 'Bienvenido' }
    it { should have_selector 'title', text: titulo_completo('') }
    it { should_not have_selector 'title', text: '| Inicio' }
    
  end
  
  describe "pagina de ayuda" do
    before { visit ayuda_path }
    
    it { should have_selector 'h1', text: 'Ayuda' }
    it { should have_selector 'title', text: titulo_completo('Ayuda') }

  end
  
  describe "pagina acerca de" do
    before { visit acerca_path }
    
    it { should have_selector 'h1', text: 'Acerca de Tamos' }
    it { should have_selector 'title', text: titulo_completo('Acerca') }

  end
  
  describe "pagina de contacto" do
    before { visit contacto_path }
    
    it { should have_selector 'h1', text: 'Contacto' }
    it { should have_selector 'title', text: titulo_completo('Contacto') }
    
  end
end
