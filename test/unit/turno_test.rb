require 'test_helper'

class TurnoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Turno.new.valid?
  end
end
