#<<>>
#Codigo 1, lista de arcos
#<<>>

defmodule Petri do

  def ex1l do
    [
      [:p0, :a],
      [:a, :p1],
      [:a, :p2],
      [:p1, :b],
      [:p1, :d],
      [:p2, :c],
      [:p2, :d],
      [:b, :p3],
      [:d, :p3],
      [:c, :p4],
      [:d, :p4],
      [:p3, :e],
      [:p4, :e],
      [:e, :p5]
    ]
  end


  # preset
  def preset(f, n) do
    f
    |> Enum.filter(fn [_a,b] -> b == n end)
    |> Enum.map(fn [a,_b] -> a end)
    |> MapSet.new()
  end


  # postset
  def postset(f, n) do
    f
    |> Enum.filter(fn [a,_b] -> a == n end)
    |> Enum.map(fn [_a,b] -> b end)
    |> MapSet.new()
  end


  # transicion habilitada
  def enabled?(f,t,m) do
    Petri.preset(f,t)
    |> MapSet.subset?(m)
  end


  # disparo de transicion
  def fire(f,t,m) do
    if enabled?(f,t,m) do
      m
      |> MapSet.difference(preset(f,t))
      |> MapSet.union(postset(f,t))
    else
      m
    end
  end


  # obtener transiciones
  def transitions(f) do
    f
    |> Enum.map(fn [a,b] -> [a,b] end)
    |> List.flatten()
    |> Enum.filter(fn x ->
      Enum.any?(f, fn [_p,t] -> t == x end)
    end)
    |> MapSet.new()
  end


  # implementacion de enablement
  def enablement(f, m) do
    transitions(f)
    |> Enum.filter(fn t -> enabled?(f, t, m) end)
    |> MapSet.new()
  end

end

 #<<>>
 #Codigo 2, mapa
 #<<>>

defmodule Petri.Mapa do
  @moduledoc "Representacion optimizada usando un mapa de pre/post condiciones"

  def example_red do
    %{
      :a => %{pre: [:p0], post: [:p1, :p2]},
      :b => %{pre: [:p1], post: [:p3]},
      :c => %{pre: [:p2], post: [:p4]},
      :d => %{pre: [:p1, :p2], post: [:p3, :p4]},
      :e => %{pre: [:p3, :p4], post: [:p5]}
    }
  end


  # disparar transicion
  def fire(network, transition, marking) do
    %{pre: pre, post: post} = network[transition]
    pre_set = MapSet.new(pre)

    if MapSet.subset?(pre_set, marking) do
      marking
      |> MapSet.difference(pre_set)
      |> MapSet.union(MapSet.new(post))
    else
      marking
    end
  end


  # enablement optimizado
  def enablement(network, marking) do
    network
    |> Map.keys()
    |> Enum.filter(fn t ->
      %{pre: pre} = network[t]
      MapSet.subset?(MapSet.new(pre), marking)
    end)
    |> MapSet.new()
  end

end
