module Exercise
  module Arrays
    class << self
      def find_max(collection)
        max_value = collection[0]
        for item in collection
          max_value = item if item > max_value
        end
        max_value
      end

      def replace(array)
        max_value =  find_max(array)
        array.map do |el|
          if el.positive?
            max_value
          else
            el
          end
        end
      end

      def search(array, query, first = 0, last = array.size - 1)
        return -1 if array.empty?
        
        middle_index = (first + last) / 2.0
        middle_element = array[middle_index.round]
         puts first, last, middle_index
      
        if middle_element == query
          return middle_index.round
        elsif first == last
          return -1
        elsif query > middle_element
          return search(array, query, middle_index.round(half: :up), last)
        else
          return search(array, query, first, middle_index.round(half: :down))
        end
      end
    end
  end
end
