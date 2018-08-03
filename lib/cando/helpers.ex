defmodule Cando.Helpers do

  defmacro can(entity, [do: action, to: target]) do
    quote do
      entity = unquote(entity)
      action = unquote(action)
      target = unquote(target)
      if is_nil(entity) do
        false
      else
        Cando.can(entity, action, target)
      end
    end
  end


  defmacro ensure(entity, [can: action, to: target]) do
    quote do
      entity = unquote(entity)
      action = unquote(action)
      target = unquote(target)
      if is_nil(entity), do: raise Cando.Denied

      if can(entity, do: action, to: target) do
        true
      else
        raise Cando.Denied
      end
    end
  end
end
