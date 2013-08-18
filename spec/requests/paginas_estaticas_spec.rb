require 'spec_helper'

describe "Paginas Estaticas" do
  let(:titulo_base) { "Tamos" }
  subject { page }
  
  shared_examples_for "todas las paginas estaticas" do
    it { should have_selector 'h1',    text: contenido  }
    it { should have_selector 'title', text: titulo_completo(titulo_pagina) }
  end
  
  describe "pagina de inicio" do
    before { visit root_path }
    
    let(:contenido) { 'Bienvenido' }
    let(:titulo_pagina) { '' }
    
    it_should_behave_like "todas las paginas estaticas"
    it { should_not have_selector 'title', text: '| Inicio' }
    
  end
  
  describe "pagina de ayuda" do
    before { visit ayuda_path }
    
    let(:contenido) { 'Ayuda' }
    let(:titulo_pagina) { 'Ayuda' }
    
    it_should_behave_like "todas las paginas estaticas"

  end
  
  describe "pagina acerca de" do
    before { visit acerca_path }
    
    let(:contenido) { 'Acerca de Tamos' }
    let(:titulo_pagina) { 'Acerca' }
    
    it_should_behave_like "todas las paginas estaticas"

  end
  
  describe "pagina de contacto" do
    before { visit contacto_path }
    
    let(:contenido) { 'Contacto' }
    let(:titulo_pagina) { 'Contacto' }
    
    it_should_behave_like "todas las paginas estaticas"
    
  end
end
