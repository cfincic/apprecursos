class Hijo < ActiveRecord::Base
  belongs_to :agente

  belongs_to :tipo_doc1, :class_name => "TipoDocumento"
  belongs_to :tipo_doc2, :class_name => "TipoDocumento"
end