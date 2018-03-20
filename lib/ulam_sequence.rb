require "prime_sieve"

class UlamSequence
  include Enumerable

  attr_reader :max, :size

  def initialize(size)
    @size = size.to_i
    @max = @size**2
    @sieve = PrimeSieve.new(@max)
  end

  def each
    return to_enum { size } unless block_given?

    points = Enumerator.new do |yielder|
      walk_cycle = [
        lambda { |x, y| [x + 1, y] }, # east
        lambda { |x, y| [x, y - 1] }, # north
        lambda { |x, y| [x - 1, y] }, # west
        lambda { |x, y| [x, y + 1] }, # south
      ].cycle

      x, y = origin
      i = 1
      advance_point = walk_cycle.next

      loop do
        ((i + 1) / 2).times do
          yielder << [x, y]
          x, y = advance_point.call(x, y)
        end

        advance_point = walk_cycle.next
        i += 1
      end
    end

    1.upto(max) do |n|
      x, y = points.next
      yield [x, y, n, sieve.prime?(n)]
    end
  end

  def origin
    [
      (size - 1) / 2,
      size / 2,
    ]
  end

  private

  attr_reader :sieve
end
