module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array.filter do |film|
          film["rating_kinopoisk"].to_f.positive? && film["country"].to_s.split(',').size > 1
        end
        raiting_sum = filtered_films.reduce(0) { |acc, film| acc + film["rating_kinopoisk"].to_f }
        raiting_sum / filtered_films.count
      end

      def chars_count(films, threshold)
        filtered_films = films.filter { |film| film["rating_kinopoisk"].to_f >= threshold.to_f }
        count_of_char = filtered_films.map{ |film| film["name"] }
          .reduce(0) { |acc, name| acc + name.count('и') }
      end
    end
  end
end
