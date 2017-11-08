defmodule Evaluator do
  @moduledoc """
  Documentation for Evaluator.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Evaluator.hello
      :world

  """
  def eval(list_of_expressions) do
    { result, _final_binding } =
      Enum.reduce(list_of_expressions,
        { _result = [], _binding = binding() },
        &evaluate_with_binding/2)
  end

  def evaluate_with_binding(expression, { result, binding }) do
    { next_result, new_binding } = Code.eval_string(expression, binding)
    { [ "value> #{next_result}", "code> #{expression}" | result ], new_binding }
  end
end
