module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for el in self do
          yield el
        end
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        for el in self do
          result << (yield el)
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        self.my_each do | el |
          result << el unless el.nil?
        end
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc=nil)
        if acc.nil?
          acc = self.first
          self[1..].my_each do | el |
            acc = yield acc, el
          end
        else
          self.my_each do | el |
            acc = yield acc, el
          end
        end
        acc
      end
    end
  end
end
