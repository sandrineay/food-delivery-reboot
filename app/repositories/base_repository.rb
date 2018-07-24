require "csv"

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    load_csv
  end

  def all
    @elements
  end

  def add(element)
    next_id = @elements.empty? ? 1 : @elements.last.id + 1
    element.id = next_id
    @elements << element
    save_csv
  end
end
