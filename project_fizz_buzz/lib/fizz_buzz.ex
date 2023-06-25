defmodule FizzBuzz do
  def build0(file_name) do
    case File.read(file_name) do
      {:ok, result} -> result
      {:error, reason} -> reason
    end
  end

  def build1(file_name) do
    file = File.read(file_name)
    handle_file_read(file)
  end

  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp convert_and_evaluate_numbers(elem) do
    String.to_integer(elem)
    |> evaluate_numbers()
  end

  #def handle_file_read({:ok, result}), do: result
  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&String.trim/1)
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}

    # result
    # |> String.split(",")
    # |> Enum.map(&String.trim/1)
    # |> Enum.map(&String.to_integer/1)

    # list = String.split(result, ",")
    # Enum.map(list, fn number -> number |> String.trim() |> String.to_integer() end)
    # Enum.map(list, &String.to_integer/1)
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  # Guards
  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
