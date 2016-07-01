require 'yaml'
require_relative './board_map'

class MineSweeper
  BOARDS_FILE = 'boards.yml'

  def self.boards
    @boards ||= begin
      file_path = File.expand_path("../../#{BOARDS_FILE}", __FILE__)
      board_sources = YAML.load_file(file_path)
      board_sources.each_with_object({}) do |board_source, memo|
        board_size  = board_source["size"]
        board_mines = board_source["mines"]
        board_type  = board_source["type"]

        memo[board_type] = BoardMap.new(board_size, board_mines)
      end
    end
  end

  def initialize(board_type)
    unless self.class.boards.key?(board_type)
      raise ArgumentError, "Undefined board type='#{board_type}'"
    end

    @board = self.class.boards[board_type]
  end

  def render(buffer)
    rendered_board = board.to_s
    buffer.write(rendered_board)
  end

  private

  attr_reader :board
end
