module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return self if self.empty?
        block.call(self.first) 
        MyArray.new(self[1..]).my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = self.reduce(MyArray.new) do | acc, el |
          acc << (yield el)
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = self.my_reduce(MyArray.new) do | acc, el |
          acc << el unless el.nil?
          acc
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
