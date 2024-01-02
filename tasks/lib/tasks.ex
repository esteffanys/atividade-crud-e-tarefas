defmodule Tasks do

  def rot(angulo) do # Rotação, usa trigonometria para rotacionar os pontos
    pontos_fixos = [{1, 2}, {3, 4}, {5, 6}]

    Enum.map(pontos_fixos, fn ponto ->
      Task.async(fn ->
        {x, y} = ponto
        {x * :math.cos(angulo) - y * :math.sin(angulo),
         x * :math.sin(angulo) + y * :math.cos(angulo)}
      end)
    end) |> Enum.map(&Task.await/1) 
  end

  def trans(dx, dy) do #  Translação soma os valores a cada ponto 
    pontos_fixos = [{1, 2}, {3, 4}, {5, 6}]

    Enum.map(pontos_fixos, fn ponto ->
      Task.async(fn ->
        {x, y} = ponto
        {x + dx, y + dy}
      end)
    end) |> Enum.map(&Task.await/1) 
  end

  def ref(eixo) do # Reflexão, inverte o sinal da coordenada x ou y.
    pontos_fixos = [{1, 2}, {3, 4}, {5, 6}]

    Enum.map(pontos_fixos, fn ponto ->
      Task.async(fn ->
        {x, y} = ponto
        case eixo do
          "x" -> {x, -y}
          "y" -> {-x, y}
        end
      end)
    end) |> Enum.map(&Task.await/1) 
  end

  def escala(sx, sy) do # Escala, aumenta o poligono multiplicando as coordenadas por valores.
    pontos_fixos = [{1, 2}, {3, 4}, {5, 6}]

    Enum.map(pontos_fixos, fn ponto ->
      Task.async(fn ->
        {x, y} = ponto
        {x * sx, y * sy}
      end)
    end) |> Enum.map(&Task.await/1) 
  end
end