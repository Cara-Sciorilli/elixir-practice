defmodule Practice.Factor do
  def loopPrime(num, i) do
    case i * i <= num do
      true ->
        if rem(num, i) == 0 || rem(num,i+2) == 0 do
          false
        else
          loopPrime(num, i+6)
        end
      false -> true
    end
  end

  def isPrime(num) do
    cond do
      num == 2 || num == 3 -> true
      rem(num, 2) == 0 || rem(num, 3) == 0 -> false
      true ->
        loopPrime(num, 5)
    end
  end

  def factorRec(num, nextNum) do
    cond do
      isPrime(num) -> [num]
      rem(num, nextNum) == 0 && isPrime(nextNum) ->
        newNum = div(num, nextNum)
        factorRec(newNum, newNum-1)++[nextNum]
      true ->
        factorRec(num, nextNum-1)
    end
  end

  def factor(x) do
    factorRec(x, x-1)
  end
end
