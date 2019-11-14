def most_water (walls_array)
    return 0 if walls_array.nil? || walls_array.empty?
    
    most_water_amt = 0

    walls_array.each_with_index do |y_1, i|
        # index_progress used for comparing indicies in original array and remaining array
        # to establish distance between columns (x_length)
        index_progress = i            
        remaining_array = walls_array.slice(i + 1, walls_array.length)

        remaining_array.each do |y_2| 
            index_progress += 1
            x_length = index_progress - i

            # sets the lesser length of the two columns to be compared as y_length
            y_1 > y_2 ? y_length = y_2 : y_length = y_1

            water_amt = y_length * x_length

            most_water_amt = water_amt if most_water_amt < water_amt
        end
    end

    most_water_amt
end

