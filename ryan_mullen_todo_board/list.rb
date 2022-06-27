require_relative "item.rb"

class List
    attr_reader :items
    attr_accessor :label
    def initialize(label)
        @label = label
        @items = Array.new
    end

    def add_item(title, deadline, description = nil)
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            true
        else
            false
        end
    end

    def size
        @items.length
    end

    def valid_index?(n)
        if n < 0 || n > size
            false
        else
            true
        end
    end

    def swap(idx1, idx2)
        if valid_index?(idx1) && valid_index?(idx2)
            @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
            true
        else
            false
        end
    end

    def [](index)
        if valid_index?(index)
            @items[index]
        else
            nil
        end
    end

    def priority
        @items[0]
    end

    def print
        puts
        puts "------------------------------"
        puts "        #{self.label}         "
        puts "------------------------------"
        puts "Index".ljust(4) + " | " + "Item".ljust(14) + "| " + "Deadline".ljust(10)
        puts "------------------------------"
        @items.each_with_index do |item, i|
            puts " #{i}    |  #{item.title}    |    #{item.deadline}"
        end
        puts "------------------------------"
    end

    def print_full_item(index)
        puts "------------------------------"
        @items.each do |item|
            puts item.title.to_s + "     " + item.deadline.to_s
            puts item.description.to_s
        end
        puts "------------------------------"
    end

    def print_priority
        puts @item[0]
    end

    def up(idx, n=1)
        return false if !valid_index?(idx)
        while n > 0 && idx != 0
            swap(idx, idx - 1)
            idx -= 1
            n -= 1
        end
        true
    end

    def down(idx, n=1)
        return false if !valid_index?(idx)
        while n > 0 && idx != @items.length - 1
            swap(idx, idx + 1)
            idx += 1
            n -= 1
        end
        true
    end
        

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

end