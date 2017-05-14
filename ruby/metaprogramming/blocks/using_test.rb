require 'test/unit'
require_relative 'with'

class TestWith < Test::Unit::TestCase
  class Resource
    def dispose
      @disposed = true
    end

    def disposed?
      @disposed
    end
  end

  def test_dispose_of_resources
    r = Resource.new
    with(r) {}
    assert r.disposed?
  end

  def test_dispose_of_resources_in_case_of_exception
    r = Resource.new
    assert_raises(Exception) {
      with(r) {
        raise Exception
      }
    }
    assert r.disposed?
  end
end