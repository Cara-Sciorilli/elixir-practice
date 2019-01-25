defmodule Practice.Factor do
  def factor(x) do
    factorRec(x, 2, [])
  end

  def factorRec(x, n, acc) do
    cond do
      x > n ->
        if rem(x, n) == 0 do
          factorRec(div(x, n), 2, acc ++ [n])
        else
          factorRec(x, n+1, acc)
        end
      x == n -> acc ++ [n]
      true -> []
    end
  end
end
