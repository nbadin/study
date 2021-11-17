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

        middle_index = (first + last) / 2
        middle_element = array[middle_index]
        if middle_element == query
          middle_index
        elsif first == last
          -1
        elsif query > middle_element
          search(array, query, middle_index + 1, last)
        else
          search(array, query, first, middle_index - 1)
        end
      end
    end
  end
end
