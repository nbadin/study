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

      def search(array, query)
        index_counter = []
        if array.empty? || array.size == 1 && array[0] != query
          index_counter.push(-1)
        else
          first = 0
          last = array.size - 1
          middle = array.size / 2
          if array[middle] == query
            index_counter.push(middle)
          elsif query < array[middle]
            index_counter.push(search(array[first, middle], query))
          elsif query > array[middle]
            index_counter.push(middle, search(array[middle, last], query))
          end
        end
        result = index_counter.last == -1 ? -1 : index_counter.sum
        result
      end
    end
  end
end
