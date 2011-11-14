require 'test_helper'

class RegistroTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Registro.new.valid?
  end
end
