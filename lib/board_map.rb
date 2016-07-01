class BoardMap
  MINE_CHAR  = '*'
  EMPTY_CHAR = '.'

  def initialize(size, mines)
    @size  = size
    @mines = mines
  end

  def to_s
    buffer = ""

    size.times do |y|
      size.times do |x|
        buffer << cell_value(x, y)
      end
      buffer << "\n"
    end

    buffer
  end

  private

  attr_reader :size, :mines

  def cell_value(x, y)
    if mine?(x, y)
      return MINE_CHAR
    end

    count = count_neighbourhood_mines(x, y)

    if count.zero?
      return EMPTY_CHAR
    end

    count.to_s
  end

  def count_neighbourhood_mines(x, y)
    count = 0

    neighbourhood_coordinates(x, y).each do |neighbourhood_x, neighbourhood_y|
      if mine?(neighbourhood_x, neighbourhood_y)
        count += 1
      end
    end

    count
  end

  def neighbourhood_coordinates(x, y)
    [
      [x + 1, y    ],
      [x - 1, y    ],
      [x    , y + 1],
      [x    , y - 1],
      [x + 1, y - 1],
      [x + 1, y + 1],
      [x - 1, y - 1],
      [x - 1, y + 1]
    ]
  end

  def mine?(x, y)
    mines.any? { |mine| mine == [x, y] }
  end
end
