require 'pry'

class LruCache
    attr_accessor :put, :entries, :lru
    attr_reader :get, :cap

    @@all = []

    def initialize(cap = 2)
        @cap = cap
        @entries = {}
        @lru = []

        @@all << self
    end

    def put(k, v)
        if !self.entries.keys.include?(k)
            self.entries.delete(self.lru.pop) if (self.entries.length + 1) > self.cap
            
            self.entries[k] = v

            update_lru(k)
        end
    end

    def get(k)
        if self.entries.keys.include?(k)
            update_lru(k)
            return self.entries[k]
        else
            return -1
        end
    end

    def self.all
        @@all
    end

    private

    def update_lru(k)
        self.lru.unshift(self.lru.delete(k) || k)
    end
end

cache = LruCache.new(2)
cache.put(1,1)
cache.put(2,2)
cache.get(1)
cache.put(3,3)
cache.get(2)
cache.put(4,4)
cache.get(1)
cache.get(3)
cache.get(4)