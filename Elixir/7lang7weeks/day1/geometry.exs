# geometry.exs
# Elixir script to demonstrate its module system
#
# vim: ft=elixir sw=2 ts=2
#
# taken from the book
# Seven More Languages in Seven Days
# http://pragprog.com/book/7lang/seven-more-languages-in-seven-weeks
# "Day 1"
#


defmodule Rectangle do
	def area({h, w}), do: h * w

	def perimeter({h, w}) do
		2 * (h + w)
	end
end

defmodule Square do
	def area({w}), do: Rectangle.area({w, w})

	def area({w, h}) when w == h do
		Rectangle.area({w, w})
	end

	# another pattern matching approach:
	# def area({w, w}), do: Rectangle.area({w, w})

	def perimeter({w}), do: Rectangle.perimeter({w, w})

	def perimeter({w, h}) when w == h do
		Rectangle.perimeter({w, w})
	end
end

defmodule Line do
  def length({p1, p2}) do
    {x1, y1} = p1
    {x2, y2} = p2
    :math.sqrt( :math.pow(x2-x1, 2) + :math.pow(y2-y1, 2) )
  end
end

defmodule Circle do
  def area(c) do
    {_, radius} = c
    :math.pi * radius*radius
  end

  def perimeter(c) do
    {_, radius} = c
    2 * :math.pi * radius
  end
end

defmodule Polygon do
  def perimeter(polygon) do
    [first | _] = polygon  # add first point at the end for closed polygon shape
    peri_aux(0, polygon ++ [first])
  end

  defp peri_aux(acc, [p1, p2 | tail]) do
    peri_aux(acc + Line.length({p1, p2}), [p2 | tail])
  end
  defp peri_aux(acc, [_ | []]), do: acc

end

defmodule Triangle do
  def area(tri) do
    # TODO
  end

  def perimeter(tri) do
    {p1, p2, p3} = tri
    Line.length {p1, p2} + Line.length {p2, p3} + Line.length {p3, p1}
  end
end

# demonstrate module usage
r = {3, 4}
IO.puts "The area of rectangle #{inspect r} is #{Rectangle.area r}"
IO.puts ""

s = {4}
IO.puts "The area of square #{inspect s} is #{Square.area s}"
IO.puts ""

# this will throw an error, as Square.are matches only single element tuples:
#IO.puts "The area of rectangle #{inspect r} is #{Square.area r}"

p1 = {1, 2}
IO.puts "A point consists of a pair of x-y coordinates, like #{inspect p1}"
p2 = {2, 3}
IO.puts "The distance between #{inspect p1} and #{inspect p2} is #{Line.length {p1, p2}}"
IO.puts ""

c = {p1, 13}
IO.puts "A circle consists of a tuple with center point and a radius, like #{inspect c}"
IO.puts "The area and perimeter of #{inspect c} is #{Circle.area c} and #{Circle.perimeter c}, respectively"
IO.puts ""


p3 = {4, 7}
triangle = {p1, p2, p3}
IO.puts "A triangle is given by a tuple of 3 points, e.g., #{inspect triangle}"
IO.puts ""


p4 = {3, -3}
p5 = {-2, -1}
polygon = [p1, p2, p3, p4, p5]
IO.puts "A polygon is described by a list of points, like #{inspect polygon}"
IO.puts "Its perimeter is #{Polygon.perimeter polygon}"
IO.puts ""

