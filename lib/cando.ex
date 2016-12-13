defprotocol Cando do
   @doc "Calculates the size (and not the length!) of a data structure"
  def can(entity, action, params)
end
