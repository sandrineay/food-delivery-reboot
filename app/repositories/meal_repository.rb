require_relative "../models/meal"
require_relative "base_repository"

class MealRepository < BaseRepository
  # def initialize(csv_file)
  #   @csv_file = csv_file
  #   @meals = []
  #   load_csv
  # end

  # def all
  #   @meals
  # end

  # def add(meal)
  #   next_id = @meals.last.id + 1
  #   meal.id = next_id
  #   @meals << meal
  #   save_csv
  # end

  private

  def save_csv
    CSV.open(@csv_file, "w") do |csv|
      csv << ["id", "name", "price"]
      @elements.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @elements << Meal.new(row)
    end
  end
end

# csv_file   = File.join(__dir__, '../../data/meals.csv')

# p MealRepository.new(csv_file)

