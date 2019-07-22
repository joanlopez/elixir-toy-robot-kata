defmodule ToyRobot do
  def place do
    %ToyRobot.Position{}
  end

  def place(x, y, facing) do
    %ToyRobot.Position{x: x, y: y, facing: facing}
  end

  def report(%ToyRobot.Position{x: x, y: y, facing: facing} = _robot) do
    {x, y, facing}
  end

  def right(%ToyRobot.Position{facing: facing} = robot) do
    directions_to_the_right = %{north: :east, east: :south, south: :west, west: :north}

    %ToyRobot.Position{robot | facing: directions_to_the_right[facing]}
  end

  def left(%ToyRobot.Position{facing: facing} = robot) do
    directions_to_the_left = %{north: :west, west: :south, south: :east, east: :north}
    %ToyRobot.Position{robot | facing: directions_to_the_left[facing]}
  end

  def move(%ToyRobot.Position{x: _, y: y, facing: :north} = robot) do
    %ToyRobot.Position{robot | y: y+1}
  end

  def move(%ToyRobot.Position{x: _, y: y, facing: :south} = robot) do
    %ToyRobot.Position{robot | y: y-1}
  end

  def move(%ToyRobot.Position{x: x, y: _, facing: :east} = robot) do
    %ToyRobot.Position{robot | x: x+1}
  end

  def move(%ToyRobot.Position{x: x, y: _, facing: :west} = robot) do
    %ToyRobot.Position{robot | x: x-1}
  end
end
