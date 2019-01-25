defmodule Practice.Calc do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def calc(expr) do
    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.
    list =
    expr
    |> String.split(~r/\s+/)
    |> tag_tokens()
    |> mult_and_div()
    |> add_and_sub()

    list[:num]
  end

  def tag_tokens(input) do
    Enum.map(input, fn(x) -> tag_token(x) end)
  end

  def tag_token(token) do
    cond do
      Enum.member?(["+", "-", "*", "/"], token) -> {:op, token}
      true ->
        {:num, parse_float(token)}
    end
  end

  def mult_and_div([{:num, num1}, {:op, "*"}, {:num, num2} | rest]) do
      [{:num, num1 * num2}] ++ mult_and_div(rest)
  end 

  def mult_and_div([{:num, num1}, {:op, "/"}, {:num, num2} | rest]) do
      [{:num, num1 / num2}] ++ mult_and_div(rest)
  end

  def mult_and_div([first | rest]) do
      [first] ++ mult_and_div(rest)
  end

  def mult_and_div([]) do
      []
  end

  def add_and_sub([{:num, num1}, {:op, "+"}, {:num, num2} | rest]) do
      [{:num, num1 + num2}] ++ add_and_sub(rest)
  end

  def add_and_sub([{:num, num1}, {:op, "-"}, {:num, num2} | rest]) do
      [{:num, num1 - num2}] ++ add_and_sub(rest)
  end

  def add_and_sub([first | rest]) do
      [first] ++ add_and_sub(rest)
  end

  def add_and_sub([]) do
      []
  end
end
