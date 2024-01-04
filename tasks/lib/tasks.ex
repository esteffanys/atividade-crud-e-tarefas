defmodule Transformacoes do
  def principal, do: loop()

  def loop do
    IO.puts """
    Sistema de transformações
    Os pontos do seu polígono são: {1, 2}, {3, 4}, {5, 6}
    =============
    1. Rotacionar
    2. Translação
    3. Reflexão
    4. Escala
    5. Sair
    """

    IO.puts "Entre com sua opção: "
    case IO.gets("") |> String.trim |> String.to_integer() do
      1 -> rot()
      2 -> trans()
      3 -> ref()
      4 -> escala()
      5 -> sair()
      _ ->
        IO.puts "Opção inválida"
        loop()
    end
  end

  defp pontos_fixos, do: [{1, 2}, {3, 4}, {5, 6}]

  defp rot do
    IO.puts "Digite o angulo de rotação"
    angulo = IO.gets("") |> String.trim |> String.to_integer()
    pontos = pontos_fixos() |> Enum.map(&rotacionar(&1, angulo))
    IO.inspect pontos
    loop()
  end

  defp rotacionar({x, y}, angulo) do
    {
      x * :math.cos(angulo) - y * :math.sin(angulo),
      x * :math.sin(angulo) + y * :math.cos(angulo)
    }
  end

  defp trans do
    IO.puts "Digite o valor do x"
    dx = IO.gets("") |> String.trim |> String.to_integer()

    IO.puts "Digite o valor do y"
    dy = IO.gets("") |> String.trim |> String.to_integer()

    pontos = pontos_fixos() |> Enum.map(&transladar(&1, dx, dy))
    IO.inspect pontos
    loop()
  end

 

  defp ref do
    IO.puts "Digite o eixo x ou y"
    eixo = IO.gets("") |> String.trim()

    pontos = pontos_fixos() |> Enum.map(&refletir(&1, eixo))
    IO.inspect pontos
    loop()
  end

  defp refletir({x, y}, "x"), do: {x, -y}
  defp refletir({x, y}, "y"), do: {-x, y}

  defp escala do
    IO.puts "Digite o valor do x"
    sx = IO.gets("") |> String.trim |> String.to_integer()

    IO.puts "Digite o valor do y"
    sy = IO.gets("") |> String.trim |> String.to_integer()

    pontos = pontos_fixos() |> Enum.map(&escalar(&1, sx, sy))
    IO.inspect pontos
    loop()
  end

  defp escalar({x, y}, sx, sy), do: {x * sx, y * sy}

  defp sair do
    IO.puts "Sistema encerrado."
    :ok
  end
end

Transformacoes.principal()
