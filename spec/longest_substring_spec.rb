require "longest_substring"

describe "longest_substring" do
    context "given a string" do
        it "finds the length of the longest sbustring without repeating characters" do
            test_1 = "abcabcbb"
            test_2 = "bbbbb"
            test_3 = "pwwkew"
            
            expect(longest_substring(test_1)).to eq(3)
            expect(longest_substring(test_2)).to eq(1)
            expect(longest_substring(test_3)).to eq(3)
        end
    end
end
