defmodule ReportsGenerator do
  def build(filename) do
    filename
    |> ReportsGenerator.Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  def fetch_higher_cost(report), do: Enum.max_by(report, fn {_key, value} -> value end)

  defp sum_values([id, _food_name, price], report), do: Map.put(report, id, report[id] + price)

  defp report_acc, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
end
