require "bitset"
require "ulaminate/exceptions"

class PrimeSieve
  # Frozen array of prime numbers up to the pre-calculation limit.
  #
  # @return [Array<Integer>]
  attr_reader :primes

  # Create a new PrimeSieve.
  #
  # @param precalculation_limit [#to_i] calculate primality lookup, and
  # generate prime numbers up to this value
  # @raise [Ulaminate::TypeError] if precalculation_limit is not a positive
  # integer
  def initialize(precalculation_limit = 10**7)
    @precalculation_limit = precalculation_limit.to_i
    @precalculation_limit > 0 or
      raise Ulaminate::TypeError, "#{@precalculation_limit} must be positive"

    @is_prime = ~Bitset.new(@precalculation_limit + 1)
    @is_prime.clear(0, 1)
    @primes = []

    2.upto(@precalculation_limit) do |i|
      next unless @is_prime[i]

      (i**2..@precalculation_limit).step(i) do |j|
        @is_prime[j] = false
      end

      primes << i
    end

    @primes.freeze
  end

  # Determines whether the given number is prime.
  #
  # @param number [#to_i]
  # @return [Boolean] whether number is prime
  # @raise [Ulaminate::TypeError] if number is not a positive integer
  def prime?(number)
    n = number.to_i
    n > 0 or raise Ulaminate::TypeError, "#{n} must be positive"

    return @is_prime[n] if n <= @precalculation_limit
    primes.all? { |prime| n % prime != 0 }
  end
end
