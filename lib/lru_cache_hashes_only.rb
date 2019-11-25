require 'pry'

class LruCacheHashesOnly
    attr_accessor :put, :entries, :lru
    attr_reader :get, :cap

    @@all = []

    def initialize(cap = 2)
        @cap = cap
        @entries = {}

        @@all << self
    end

    def put(k, v)
        update_lru(k, v)
    end

    def get(k)
        if self.entries.has_key?(k)
            return update_lru(k, self.entries[k])
        else
            return -1
        end
    end

    def self.all
        @@all
    end

    private

    def update_lru(k, v)
        if !self.entries.has_key?(k) && (self.entries.length + 1) > self.cap
            self.entries.delete(self.entries.first[0])
        else
            self.entries.delete(k)  
        end
            self.entries[k] = v 
    end
end

cache = LruCacheHashesOnly.new(2)
cache.put(1,1)
cache.put(2,2)
cache.get(1)
cache.put(3,3)
cache.get(2)
cache.put(4,4)
cache.get(1)
cache.get(3)
cache.get(4)