require_relative '../../primes/c_primes'
require 'test/unit'

class TestCPrimes < Test::Unit::TestCase
  def test_prime?
    primes_list.each do |prime|
      assert_equal(true, CPrimes.prime?(prime))
    end
  end

  def test_primes_list
    size = primes_array.size
    assert_equal(primes_array, CPrimes.list(size))
  end

  private

  def primes_list
    @primes_list ||= File.open('./primes/primes-list.txt').each_with_object([]) do |line, array|
      array << line.to_i
      array
    end
  end

  def primes_array
    @primes_array ||= primes_list.each_with_object([]) do |prime, array|
      array << prime
      array
    end
  end
end
