defmodule Tasks do

  def principal do
    #pontos_fixos = [{1, 2}, {3, 4}, {5, 6}]
    loop()
  end

  def loop() do

    #pontos_fixos = [{1, 2}, {3, 4}, {5, 6}]

    IO.puts "Sistema Final"
    IO.puts "============="
    IO.puts "1. Rotacionar"
    IO.puts "2. Translação"
    IO.puts "3. Reflexão"
    IO.puts "4. Escala"
    IO.puts "5. Sair"

    IO.puts "Entre com sua opção: "
    opcao = IO.gets("") |> String.trim |> String.to_integer()

    case opcao do
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

  def rot() do # Rotação, usa trigonometria para rotacionar os pontos

    pontos_fixos = [{1, 2}, {3, 4}, {5, 6}]

    IO.puts "digite o angulo de rotação"
    angulo = IO.gets("") |> String.trim |> String.to_integer()

    pontos = Enum.map(pontos_fixos, fn ponto ->
      Task.async(fn ->
        {x, y} = ponto
        {x * :math.cos(angulo) - y * :math.sin(angulo),
         x * :math.sin(angulo) + y * :math.cos(angulo)}
      end)
    end) |> Enum.map(&Task.await/1)
    IO.inspect pontos
    loop() 

  end

  def trans() do #  Translação soma os valores a cada ponto 
    pontos_fixos = [{1, 2}, {3, 4}, {5, 6}]
    IO.puts "Digite os valores para somar"
    {dx, dy} = IO.gets("") |> String.trim |> String.to_integer()

    pontos = Enum.map(pontos_fixos, fn ponto ->
      Task.async(fn ->
        {x, y} = ponto
        {x + dx, y + dy}
      end)
    end) |> Enum.map(&Task.await/1) 
    IO.inspect pontos
    loop()
  end

  def ref() do # Reflexão, inverte o sinal da coordenada x ou y.
    pontos_fixos = [{1, 2}, {3, 4}, {5, 6}]
    IO.puts "digite o eixo x ou y"
    eixo = IO.gets("") |> String.trim |> String.to_integer()

    resultado = Enum.map(pontos_fixos, fn ponto ->
      Task.async(fn ->
        {x, y} = ponto
        case eixo do
          "x" -> {x, -y}
          "y" -> {-x, y}
        end
      end)
    end) |> Enum.map(&Task.await/1) 
    IO.inspect resultado
    loop()
  end

  def escala() do # Escala, aumenta o poligono multiplicando as coordenadas por valores.
    pontos_fixos = [{1, 2}, {3, 4}, {5, 6}]
    IO.puts "digite os valores a multiplicar"
    {sx, sy} = IO.gets("") |> String.trim |> String.to_integer()

    resultado = Enum.map(pontos_fixos, fn ponto ->
      Task.async(fn ->
        {x, y} = ponto
        {x * sx, y * sy}
      end)
    end) |> Enum.map(&Task.await/1) 
    IO.inspect resultado
    loop()
  end

  def sair do
    IO.puts "Sistema encerrado."
    :ok
  end


end

Tasks.principal()