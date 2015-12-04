# Problem 3

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the composite 600851475143 ?

# This solution was taken and modified from https://github.com/JordiPolo/euler_on_elixir

defmodule Euler.Problem2 do

  def solve do
    600851475143
      |> find_factors
      |> Enum.max
      |> IO.inspect
  end


  # |> in Elixir just means take the result of the expression above
  #    and pass it as the first argument to the following function
  #
  #   find_factors(600851475143)
  #
  #   becomes:
  #
  #   600851475143
  #     |> find_factors
  #
  # This helps avoid the large number parentheses in other functional languages.
  # which isn't that helpful for a single function, but in this case
  # it avoids having to write the following as:
  #
  #  IO.inspect(Enum.max(find_factors(600851475143)))


  def find_factors(composite) do
    factorization(composite, 2, [])
  end


  # defp means a private method in Elixir.

  # also notice there are 3 methods here all with the same name "factorization",
  # that all take the same arguments: (composite, divisor, factors)

  # Each argument list is followed by the word "when" and a expression.
  #
  # This is some of the magic of elixir, it will pattern match on the
  # arguments, and run the function definition that matches.
  ##


  # When the divisor is greater than the composite
  # then we know the number has no more factors and we are done!
  defp factorization(composite, divisor, factors) when divisor > composite do
    factors
  end


  # If the composite divided by the divisor is 0, that means the divisor is a factor.
  #
  # So we need to divide our composite by the divisor and then
  # return the same divisor again to see if the composite is still divisible by said number.
  #
  # We then need a list composed of the divisor as the head, and the
  # previous factors as the tail with the syntax: [ head | tail ]
  # so we keep growing our factors list
  defp factorization(composite, divisor, factors) when rem(composite, divisor) == 0 do
    factorization(div(composite, divisor), divisor, [divisor | factors])
  end


  # If the composite divided by the divisor is NOT 0, that means the divisor
  # is NOT a factor.
  #
  # So we just add 1 to divisor and keep it moving.
  defp factorization(composite, divisor, factors) when rem(composite, divisor) != 0 do
    factorization(composite, divisor + 1, factors)
  end

end

Euler.Problem2.solve
