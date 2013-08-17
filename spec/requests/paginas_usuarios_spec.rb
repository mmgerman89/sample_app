require 'spec_helper'

describe "Paginas de usuarios" do
  subject { page }
  
  describe "pagina de registro" do
    before { visit registro_path }
    
    it { should have_selector 'h1', text: 'Registro' }
    it { should have_selector 'title', text: titulo_completo('Registro') }
  end
end
