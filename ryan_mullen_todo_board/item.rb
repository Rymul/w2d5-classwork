class Item
    attr_accessor :title, :description
    attr_reader :deadline

    def self.valid_date?(str)
        date_arr = str.split("-")
        return false if date_arr[0].length != 4
        return false if date_arr[1].length != 2
        return false if date_arr[2].length != 2
        return false if date_arr.length != 3
        return false if !(1..12).include?(date_arr[1].to_i)
        return false if !(1..31).include?(date_arr[2].to_i)
        true
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        if !Item.valid_date?(deadline)
            raise "Invalid date"
        end
        @description = description
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            dealine = new_deadline
        else
            raise "Invalid date"
        end
    end
end