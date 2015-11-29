# Problem 1
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

defmodule Euler.Problem1 do
  def solve do
    Enum.filter(999..0, fn(x) -> (rem(x, 3) == 0 || rem(x, 5) == 0) end)
    |> Enum.sum
  end
end

IO.puts "\n\e[35mProblem 1 Solution:"
IO.puts "#{Euler.Problem1.solve}\e[0m"
