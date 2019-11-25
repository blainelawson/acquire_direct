require "most_water"
require "most_water_dos"

describe "most_water" do
    context "given an array of container heights" do
        it "returns the most amount of water held possible between two of those heights" do
            test_1 = [1,8,6,2,5,4,8,3,7]
            test_2 = [2,20,3,33,8,10,9,6,15]
            expect(most_water(test_1)).to equal(49)
            expect(most_water(test_2)).to equal(105)
        end
    end
end

describe "most_water_dos" do
    context "given an array of container heights" do
        it "returns the most amount of water held possible between two of those heights" do
            test_1 = [1,8,6,2,5,4,8,3,7]
            test_2 = [2,20,3,33,8,10,9,6,15]
            expect(most_water(test_1)).to equal(49)
            expect(most_water(test_2)).to equal(105)
        end
    end
end