defmodule Helpers.RenderHelper do
  defmacro __using__(_params) do
    quote do
      def render(%{error: %Ecto.Changeset{} = changeset}) do
        %{
          error:
            Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
              Enum.reduce(opts, msg, fn {key, value}, acc ->
                String.replace(acc, "%{#{key}}", to_string(value))
              end)
            end)
        }
        |> Jason.encode!()
      end

      def render(value) do
        value
        |> Jason.encode!()
      end
    end
  end
end
