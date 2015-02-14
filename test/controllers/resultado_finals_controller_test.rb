require 'test_helper'

class ResultadoFinalsControllerTest < ActionController::TestCase
  setup do
    @resultado_final = resultado_finals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resultado_finals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resultado_final" do
    assert_difference('ResultadoFinal.count') do
      post :create, resultado_final: { inscricao_id: @resultado_final.inscricao_id, nota_final: @resultado_final.nota_final }
    end

    assert_redirected_to resultado_final_path(assigns(:resultado_final))
  end

  test "should show resultado_final" do
    get :show, id: @resultado_final
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resultado_final
    assert_response :success
  end

  test "should update resultado_final" do
    patch :update, id: @resultado_final, resultado_final: { inscricao_id: @resultado_final.inscricao_id, nota_final: @resultado_final.nota_final }
    assert_redirected_to resultado_final_path(assigns(:resultado_final))
  end

  test "should destroy resultado_final" do
    assert_difference('ResultadoFinal.count', -1) do
      delete :destroy, id: @resultado_final
    end

    assert_redirected_to resultado_finals_path
  end
end
