module ApplicationHelper
  # Devuelve el titulo completo de la pagina actual
  def titulo_completo (titulo_pagina)
    titulo_base = "Tamos"
    if titulo_pagina.empty?
      titulo_base
    else
      "#{titulo_base} | #{titulo_pagina}"
    end
  end
end
