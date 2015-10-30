# vim: ft=elixir sw=2 ts=2
#
# state_machine.ex
# macro definition to generate a machine
#

defmodule StateMachine do

  defmacro __using__(_) do
    quote do
      import StateMachine
      @states []
      @before_compile StateMachine
    end
  end

  @doc """
  Add state definition to @states attribute
  """
  defmacro state(name, events) do
    quote do
      @states [{unquote(name), unquote(events)} | @states]
    end
  end

  @doc """
  Add defs for state keyword list and callback functions
  to AST
  """
  defmacro __before_compile__(env) do
    states = Module.get_attribute(env.module, :states)
    events = states
              |> Keyword.values
              |> List.flatten
              |> Keyword.keys
              |> Enum.uniq

    quote do
      def state_machine do
        unquote(states)
      end

      unquote(event_callbacks(events))
    end
  end

  @doc """
  Add callback defs for all events
  """
  defp event_callbacks(names) do
    Enum.map names, &event_callback/1
  end

  @doc """
  Add callback def for given event name and
  """
  defp event_callback(name) do
    callback = name
    quote do
      def unquote(name)(context) do
        StateMachine.Behavior.fire(state_machine, context, unquote(callback))
      end
    end
  end

end

