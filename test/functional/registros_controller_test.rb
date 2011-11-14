require 'test_helper'

class RegistrosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Registro.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Registro.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Registro.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to registro_url(assigns(:registro))
  end

  def test_edit
    get :edit, :id => Registro.first
    assert_template 'edit'
  end

  def test_update_invalid
    Registro.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Registro.first
    assert_template 'edit'
  end

  def test_update_valid
    Registro.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Registro.first
    assert_redirected_to registro_url(assigns(:registro))
  end

  def test_destroy
    registro = Registro.first
    delete :destroy, :id => registro
    assert_redirected_to registros_url
    assert !Registro.exists?(registro.id)
  end
end
