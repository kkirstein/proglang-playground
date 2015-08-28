# vim: ft=elixir sw=2 ts=2
#
# state_machine_behavior.ex
# generic state machine behavior
#

defmodule StateMachine.Behavior do
  @doc """
  Fire updates the context to the new state and activates
  the associated functions from event.calls
  """
  def fire(context, event) do
    %{context | state: event[:to]}
    |> activate(event)
  end

  @doc """
  Alternative api to fire an event, with lookup of the
  next state by event_name and the provided states description
  """
  def fire(states, context, event_name) do
    event = states[context.state][event_name]
    fire(context, event)
  end

  @doc """
  Call the associated functions with updated context respectively
  """
  def activate(context, event) do
    Enum.reduce(event[:calls] || [], context, &(&1.(&2)))
  end

end

