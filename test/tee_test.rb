require 'minitest/autorun'
require 'minitest/rg'
require_relative "test_helper"

class TeeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Tee::VERSION
  end

  def test_three_files
    msg = "Anybody there?\n"
    $stderr.reopen('/tmp/sample3.log')
    File.open('/tmp/sample1.log', 'w') do |sample1|
      file = Tee::File.new(sample1, STDERR, '/tmp/sample2.log')
      file.write(msg)
    end
    assert_equal msg, File.read('/tmp/sample1.log'),
      "failure on pre-opened file descriptor"
    assert_equal msg, File.read('/tmp/sample2.log'),
      "failure on auto-opened file descriptor"
    assert_equal msg, File.read('/tmp/sample3.log'),
      "failure on (redirected) STDERR"
  ensure
    File::delete('/tmp/sample1.log', '/tmp/sample2.log', '/tmp/sample3.log')
  end
end
