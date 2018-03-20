require "test_helper"
require "ulam_sequence"

class UlamSequenceSize1Test < Minitest::Test
  attr_reader :sequence

  def setup
    @sequence = UlamSequence.new(1)
  end

  def test_size
    assert_equal 1, sequence.size
  end

  def test_max
    assert_equal 1, sequence.max
  end

  def test_origin
    assert_equal [0, 0], sequence.origin
  end

  def test_each
    enumerator = sequence.each
    assert_equal [0, 0, 1, false], enumerator.next
    assert_raises(StopIteration) { enumerator.next }
  end
end

class UlamSequenceSize2Test < Minitest::Test
  attr_reader :sequence

  def setup
    @sequence = UlamSequence.new(2)
  end

  def test_size
    assert_equal 2, sequence.size
  end

  def test_max
    assert_equal 4, sequence.max
  end

  def test_origin
    assert_equal [0, 1], sequence.origin
  end

  def test_each
    enumerator = sequence.each
    assert_equal [0, 1, 1, false], enumerator.next
    assert_equal [1, 1, 2, true], enumerator.next
    assert_equal [1, 0, 3, true], enumerator.next
    assert_equal [0, 0, 4, false], enumerator.next
    assert_raises(StopIteration) { enumerator.next }
  end
end

class UlamSequenceSize5Test < Minitest::Test
  attr_reader :sequence

  def setup
    @sequence = UlamSequence.new(5)
  end

  def test_size
    assert_equal 5, sequence.size
  end

  def test_max
    assert_equal 25, sequence.max
  end

  def test_origin
    assert_equal [2, 2], sequence.origin
  end

  def test_each
    enumerator = sequence.each
    assert_equal [2, 2, 1, false], enumerator.next
    assert_equal [3, 2, 2, true], enumerator.next
    assert_equal [3, 1, 3, true], enumerator.next
    assert_equal [2, 1, 4, false], enumerator.next
    assert_equal [1, 1, 5, true], enumerator.next
    assert_equal [1, 2, 6, false], enumerator.next
    assert_equal [1, 3, 7, true], enumerator.next
    assert_equal [2, 3, 8, false], enumerator.next
    assert_equal [3, 3, 9, false], enumerator.next
    assert_equal [4, 3, 10, false], enumerator.next
    assert_equal [4, 2, 11, true], enumerator.next
    assert_equal [4, 1, 12, false], enumerator.next
    assert_equal [4, 0, 13, true], enumerator.next
    assert_equal [3, 0, 14, false], enumerator.next
    assert_equal [2, 0, 15, false], enumerator.next
    assert_equal [1, 0, 16, false], enumerator.next
    assert_equal [0, 0, 17, true], enumerator.next
    assert_equal [0, 1, 18, false], enumerator.next
    assert_equal [0, 2, 19, true], enumerator.next
    assert_equal [0, 3, 20, false], enumerator.next
    assert_equal [0, 4, 21, false], enumerator.next
    assert_equal [1, 4, 22, false], enumerator.next
    assert_equal [2, 4, 23, true], enumerator.next
    assert_equal [3, 4, 24, false], enumerator.next
    assert_equal [4, 4, 25, false], enumerator.next
    assert_raises(StopIteration) { enumerator.next }
  end
end
