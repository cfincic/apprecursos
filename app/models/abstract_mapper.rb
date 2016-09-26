class AbstractMapper

  def mappear(entidad, registro)
    raise NotImplementedError, 'Debe implementarse el método mappear'
  end

end
