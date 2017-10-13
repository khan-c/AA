require 'lrucache'
require 'rspec'

describe LRUCache do
  subject(:johnny_cache) { LRUCache.new(4) }

  describe '#initialize' do
    it 'creates an empty cache array' do
      expect(johnny_cache.cache).to eq([])
    end

    it 'sets the size to the passed in argument' do
      expect(johnny_cache.size).to eq(4)
    end
  end

  describe '#count' do
    it 'returns the number of elements currently in cache' do
      expect(johnny_cache.count).to eq(0)
    end
  end

  describe '#add' do
    before(:each) do
      johnny_cache.add("I walk the line")
      johnny_cache.add(5)
    end

    it 'adds elements if the cache is empty' do
      expect(johnny_cache.count).to eq(2)
    end

    it '"refreshes" elements that are already included in the cache' do
      johnny_cache.add([1,2,3])
      johnny_cache.add(5)
      expect(johnny_cache.count).to eq(3)
      expect(johnny_cache.cache.last).to eq(5)
    end

    it 'removes the oldest element if cache is already full' do
      johnny_cache.add([1,2,3])
      johnny_cache.add(5)
      johnny_cache.add(-5)
      johnny_cache.add({a: 1, b: 2, c: 3})
      expect(johnny_cache.cache).not_to include("I walk the line")
      expect(johnny_cache.cache.first).to eq([1,2,3])
    end
  end

  describe '#show' do
    it 'prints the existing cache elements' do
      johnny_cache.add("I walk the line")
      johnny_cache.add(5)
      johnny_cache.add([1,2,3])
      johnny_cache.add(5)
      johnny_cache.add(-5)
      johnny_cache.add({a: 1, b: 2, c: 3})
      johnny_cache.add([1,2,3,4])
      johnny_cache.add("I walk the line")
      johnny_cache.add(:ring_of_fire)
      johnny_cache.add("I walk the line")
      johnny_cache.add({a: 1, b: 2, c: 3})
      expect { johnny_cache.show }.to output('[[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]').to_stdout
    end
  end
end
