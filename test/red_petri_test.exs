defmodule RedPetriTest do
  use ExUnit.Case

  alias Petri
  alias Petri.Mapa


  # -------------------------
  # Tests para preset
  # -------------------------

  test "preset de una transición" do
    f = Petri.ex1l()

    assert Petri.preset(f, :a) == MapSet.new([:p0])
  end


  test "preset de e" do
    f = Petri.ex1l()

    assert Petri.preset(f, :e) == MapSet.new([:p3, :p4])
  end


  # -------------------------
  # Tests para postset
  # -------------------------

  test "postset de una transición" do
    f = Petri.ex1l()

    assert Petri.postset(f, :e) == MapSet.new([:p5])
  end


  # -------------------------
  # Tests para enabled?
  # -------------------------

  test "transicion habilitada" do
    f = Petri.ex1l()
    m = MapSet.new([:p0])

    assert Petri.enabled?(f, :a, m)
  end


  test "transicion no habilitada" do
    f = Petri.ex1l()
    m = MapSet.new([:p1])

    refute Petri.enabled?(f, :a, m)
  end


  # -------------------------
  # Tests para fire
  # -------------------------

  test "fire cambia el marcado correctamente" do
    f = Petri.ex1l()
    m = MapSet.new([:p0])

    m2 = Petri.fire(f, :a, m)

    assert m2 == MapSet.new([:p1, :p2])
  end


  test "fire no cambia marcado si no esta habilitado" do
    f = Petri.ex1l()
    m = MapSet.new([:p1])

    m2 = Petri.fire(f, :a, m)

    assert m2 == m
  end


  # -------------------------
  # Tests para enablement
  # -------------------------

  test "enablement detecta transiciones habilitadas" do
    f = Petri.ex1l()
    m = MapSet.new([:p1, :p2])

    enabled = Petri.enablement(f, m)

    assert enabled == MapSet.new([:b, :c, :d])
  end


  test "enablement con un solo habilitado" do
    f = Petri.ex1l()
    m = MapSet.new([:p1, :p4])

    enabled = Petri.enablement(f, m)

    assert enabled == MapSet.new([:b])
  end


  # =========================
  # Tests para Mapa
  # =========================

  test "fire en representacion mapa" do
    net = Mapa.example_red()
    m = MapSet.new([:p0])

    m2 = Mapa.fire(net, :a, m)

    assert m2 == MapSet.new([:p1, :p2])
  end


  test "enablement en representacion mapa" do
    net = Mapa.example_red()
    m = MapSet.new([:p1, :p2])

    enabled = Mapa.enablement(net, m)

    assert enabled == MapSet.new([:b, :c, :d])
  end

end
