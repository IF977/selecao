require 'test_helper'

class LinhaPesquisasControllerTest < ActionController::TestCase
  setup do
    @linha_pesquisa = linha_pesquisas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:linha_pesquisas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create linha_pesquisa" do
    assert_difference('LinhaPesquisa.count') do
      post :create, linha_pesquisa: { descricao: @linha_pesquisa.descricao }
    end

    assert_redirected_to linha_pesquisa_path(assigns(:linha_pesquisa))
  end

  test "should show linha_pesquisa" do
    get :show, id: @linha_pesquisa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @linha_pesquisa
    assert_response :success
  end

  test "should update linha_pesquisa" do
    patch :update, id: @linha_pesquisa, linha_pesquisa: { descricao: @linha_pesquisa.descricao }
    assert_redirected_to linha_pesquisa_path(assigns(:linha_pesquisa))
  end

  test "should destroy linha_pesquisa" do
    assert_difference('LinhaPesquisa.count', -1) do
      delete :destroy, id: @linha_pesquisa
    end

    assert_redirected_to linha_pesquisas_path
  end
end
