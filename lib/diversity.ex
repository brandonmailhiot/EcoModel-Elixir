defmodule Diversity do
  defp overZero(list) do
    Enum.filter(list, fn(x) -> x > 0 end)
  end

  def richness(species) do
    length(overZero(species))
  end

  def bergerParker(species) do
    Enum.max(species) / Enum.sum(species)
  end

  def brillouin(species) do
    n = Enum.sum(species)

    sumLog = Enum.map(
      species,
      fn(x) -> Math.log(Math.factorial(x)) end
    ) |> Enum.sum

    (Math.log(Math.factorial(n) - sumLog)) / n
  end

  def margalef(species) do
    n = Enum.sum(species)
    (richness(species) - 1) / Math.log(n)
  end

  def menhinick(species) do
    n = Enum.sum(species)
    richness(species) / Math.sqrt(n)
  end

  def shannon(species) do
    n = Enum.sum(species)

    Enum.map(
      species,
      fn(x) -> -1 * (x / n) * Math.log(x / n) end
    ) |> Enum.sum
  end

  def simpson(species) do
    n = Enum.sum(species)

    Enum.map(
      species,
      fn(x) -> Math.pow(x / n, 2) end
    ) |> Enum.sum
  end

  def simpsonDiversity(species) do
    1 - simpson(species)
  end

  def simpsonDominance(species) do
    1 / simpson(species)
  end
end
