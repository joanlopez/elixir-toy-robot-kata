defmodule ToyRobot do
@table_min_x 0
@table_min_y 0

@table_max_x 4
@table_max_y 4

  @doc """
  Places the robot to the default position

  Examples:

    iex> ToyRobot.place
    {:ok, %ToyRobot.Position{facing: :north, x: 0, y: 0}}
  """
  def place do
    {:ok, %ToyRobot.Position{}}
  end

  @doc """
  Places the robot on the given position but prevents it to be placed outside of the table and facing invalid direction.

  Examples:

    iex> ToyRobot.place(1, 2, :south)
    {:ok, %ToyRobot.Position{facing: :south, x: 1, y: 2}}

    iex> ToyRobot.place(-1, -1, :north)
    {:failure, "Invalid position"}

    iex> ToyRobot.place(0, 0, :north_east)
    {:failure, "Invalid facing direction"}
  """
  def place(x, y, _facing) when x < @table_min_x or y < @table_min_y or x > @table_max_y or y > @table_max_y do
    {:failure, "Invalid position"}
  end

  def place(_x, _y, facing) when facing not in [:north, :east, :south, :west] do
    {:failure, "Invalid facing direction"}
  end

  def place(x, y, facing) do
    {:ok, %ToyRobot.Position{x: x, y: y, facing: facing}}
  end

  @doc """
  Provides the report of the robot's current position

  Examples:

    iex> {:ok, robot} = ToyRobot.place(2, 3, :west)
    iex> ToyRobot.report(robot)
    {2, 3, :west}
  """
  def report(%ToyRobot.Position{x: x, y: y, facing: facing} = _robot) do
    {x, y, facing}
  end

  @doc """
  Rotates the robot to the right
  """
  def right(%ToyRobot.Position{facing: facing} = robot) do
    directions_to_the_right = %{north: :east, east: :south, south: :west, west: :north}

    %ToyRobot.Position{robot | facing: directions_to_the_right[facing]}
  end

  @doc """
  Rotates the robot to the left
  """
  def left(%ToyRobot.Position{facing: facing} = robot) do
    directions_to_the_left = %{north: :west, west: :south, south: :east, east: :north}
    %ToyRobot.Position{robot | facing: directions_to_the_left[facing]}
  end

  @doc """
  Moves the robot to the north, but prevents it to fall
  """
  def move(%ToyRobot.Position{x: _, y: y, facing: :north} = robot) when y < @table_max_y do
    %ToyRobot.Position{robot | y: y+1}
  end

  @doc """
  Moves the robot to the south, but prevents it to fall
  """
  def move(%ToyRobot.Position{x: _, y: y, facing: :south} = robot) when y > @table_min_y do
    %ToyRobot.Position{robot | y: y-1}
  end

  @doc """
  Moves the robot to the east, but prevents it to fall
  """
  def move(%ToyRobot.Position{x: x, y: _, facing: :east} = robot) when x < @table_max_x do
    %ToyRobot.Position{robot | x: x+1}
  end

  @doc """
  Moves the robot to the west, but prevents it to fall
  """
  def move(%ToyRobot.Position{x: x, y: _, facing: :west} = robot) when x > @table_min_x do
    %ToyRobot.Position{robot | x: x-1}
  end

  @doc """
  Does not change the position of the robot.
  This function used as fallback if the robot cannot move outside the table
  """
  def move(robot), do: robot
end
