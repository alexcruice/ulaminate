require "test_helper"

class UlaminateExecutableTest < Minitest::Test
  def setup
    FileUtils.rm(Dir.glob("ulam_spiral_*"))
  end

  def teardown
    FileUtils.rm(Dir.glob("ulam_spiral_*"))
  end

  def test_no_flags_creates_default_png
    assert_equal false, FileTest.exist?("ulam_spiral_7.png")
    assert_equal "ulam_spiral_7.png\n", %x{bundle exec ulaminate}
    assert_equal true, FileTest.exist?("ulam_spiral_7.png")
    assert_equal 79, FileTest.size("ulam_spiral_7.png")
    assert_equal true, FileUtils.compare_file("test/fixtures/ulam_spiral_7.png", "ulam_spiral_7.png")
  end

  def test_help_flag_prints_usage
    expected_help_output =  <<OUTPUT
Usage: ulaminate [options]
    -h, --help                       Prints this help
        --size SIZE                  The size of the side of the spiral
OUTPUT

    assert_equal expected_help_output, %x{bundle exec "ulaminate --help"}
  end

  def test_size_flag_creates_desired_png
    assert_equal false, FileTest.exist?("ulam_spiral_100.png")
    assert_equal "ulam_spiral_100.png\n", %x{bundle exec ulaminate --size 100}
    assert_equal true, FileTest.exist?("ulam_spiral_100.png")
    assert_equal 1283, FileTest.size("ulam_spiral_100.png")
    assert_equal true, FileUtils.compare_file("test/fixtures/ulam_spiral_100.png", "ulam_spiral_100.png")
  end
end
