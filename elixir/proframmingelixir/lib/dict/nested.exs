defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct Owner: %{}, details: "", severity: 1
end