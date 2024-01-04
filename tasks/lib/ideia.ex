# atividade-em-dupla-crud-e-tarefas

defmodule Tarefas do
  def soma(x, y) do
    Task.async(fn -> x + y end)
  end

  def subtracao(x, y) do
    Task.async(fn -> x - y end)
  end

  def multiplicacao(x, y) do
    Task.async(fn -> x * y end)
  end

  def divisao(x, y) do
    Task.async(fn -> x / y end)
  end
end

# Cria uma nova tarefa para somar dois números
tarefa_soma = Tarefas.soma(1, 2)

# Cria uma nova tarefa para subtrair dois números
tarefa_subtracao = Tarefas.subtracao(10, 5)

# Cria uma nova tarefa para multiplicar dois números
tarefa_multiplicacao = Tarefas.multiplicacao(3, 4)

# Cria uma nova tarefa para dividir dois números
tarefa_divisao = Tarefas.divisao(12, 3)

# Espera todas as tarefas serem concluídas
Task.await([tarefa_soma, tarefa_subtracao, tarefa_multiplicacao, tarefa_divisao])