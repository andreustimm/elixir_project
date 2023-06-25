reduce = Enum.reduce([1, 2, 3], 0, fn x, acc -> x + acc end)

IO.puts(reduce)