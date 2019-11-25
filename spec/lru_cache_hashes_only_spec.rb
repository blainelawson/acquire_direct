require "lru_cache_hashes_only"
require "pry"

require "complexity_assert"

describe "LruCache" do
    cache = LruCacheHashesOnly.new(2)

    context "when put(key, value) is passed a key and value" do
        it "should set the value when key is present" do
            cache.put(2,2)
            cache.put(2,3)

            expect(cache.get(2)).to eq(3)
        end

        it "should insert new key and value when key is not present" do
            cache.put(3,3)

            expect(cache.get(3)).to eq(3)
        end
    end

    context "when get() is passed a key parameter" do
        it "returns the corresponding value if the key exists" do
            cache.put(1,1)
            cache.put(2,2)

            expect(cache.get(1)).to eq(1)
        end

        it "returns -1 if the key does not exist" do
            expect(cache.get(3)).to eq(-1)
        end
    end

    context "when the cache has reached capacity" do
        it "should invalidate least recently used item" do
            cache = LruCacheHashesOnly.new(2)

            cache.put(1,1)
            cache.put(2,2)
            cache.get(1)
            cache.put(3,3) # evicts key 2

            expect(cache.get(2)).to eq(-1)

            cache.get(2) 
            cache.put(4,4) # evicts key 1

            expect(cache.get(1)).to eq(-1)
        end
    end 
end

class ConstantSearch

    def generate_args(size)
        # binding.pry
        [Array.new(size) {{rand(1..size) => rand(1..100)}}, rand(1..size)]
    end

    def run(array, searched)
        # binding.pry
        cache = LruCacheHashesOnly.new(10)
        cache.get(1)
        cache.put(5,5)
        cache.put(1,1)
        cache.put(2,2)
        cache.get(2)
        cache.put(3,3)
    end
end

describe "Linear search" do 
    it "performs linearly" do
        expect(ConstantSearch.new).to be_constant()
    end
end

