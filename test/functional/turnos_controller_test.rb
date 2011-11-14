require 'test_helper'

class TurnosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Turno.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Turno.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Turno.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to turno_url(assigns(:turno))
  end

  def test_edit
    get :edit, :id => Turno.first
    assert_template 'edit'
  end

  def test_update_invalid
    Turno.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Turno.first
    assert_template 'edit'
  end

  def test_update_valid
    Turno.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Turno.first
    assert_redirected_to turno_url(assigns(:turno))
  end

  def test_destroy
    turno = Turno.first
    delete :destroy, :id => turno
    assert_redirected_to turnos_url
    assert !Turno.exists?(turno.id)
  end
end
