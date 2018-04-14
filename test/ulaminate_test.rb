require "test_helper"

class UlaminateTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ulaminate::VERSION
  end

  def test_ulam_sequence_returns_enumerator
    assert_kind_of(Enumerator, Ulaminate.ulam_sequence(1))
  end
end
