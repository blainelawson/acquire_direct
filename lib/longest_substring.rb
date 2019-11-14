def longest_substring(str)
    result = { substr: "", length: 0 }
    length = 0
    substr = ""

    i = 0        # index
    i_count = 0  # iteration count
    while i <= (str.length - 1) do
        if !substr.include?(str[i]) 
            substr = substr + str[i]
            length += 1
            if length > result[:length] 
                result[:length] = length 
                result[:substr] = substr
            end

            i += 1 # proceeds to next index
        else
            substr = ""
            length = 0
            i_count += 1 
            i = i_count  # resets index to next starting point
        end

    end
    result[:length]
end
