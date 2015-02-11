require 'test_helper'

class AvaliacaoCurriculosControllerTest < ActionController::TestCase
  setup do
    @avaliacao_curriculo = avaliacao_curriculos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:avaliacao_curriculos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create avaliacao_curriculo" do
    assert_difference('AvaliacaoCurriculo.count') do
      post :create, avaliacao_curriculo: { inscricao_id: @avaliacao_curriculo.inscricao_id, nota_experiencia_docente: @avaliacao_curriculo.nota_experiencia_docente, nota_experiencia_pdi: @avaliacao_curriculo.nota_experiencia_pdi, nota_experiencia_profissional: @avaliacao_curriculo.nota_experiencia_profissional, nota_historicos: @avaliacao_curriculo.nota_historicos, nota_producao_cientifica: @avaliacao_curriculo.nota_producao_cientifica, user_id: @avaliacao_curriculo.user_id }
    end

    assert_redirected_to avaliacao_curriculo_path(assigns(:avaliacao_curriculo))
  end

  test "should show avaliacao_curriculo" do
    get :show, id: @avaliacao_curriculo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @avaliacao_curriculo
    assert_response :success
  end

  test "should update avaliacao_curriculo" do
    patch :update, id: @avaliacao_curriculo, avaliacao_curriculo: { inscricao_id: @avaliacao_curriculo.inscricao_id, nota_experiencia_docente: @avaliacao_curriculo.nota_experiencia_docente, nota_experiencia_pdi: @avaliacao_curriculo.nota_experiencia_pdi, nota_experiencia_profissional: @avaliacao_curriculo.nota_experiencia_profissional, nota_historicos: @avaliacao_curriculo.nota_historicos, nota_producao_cientifica: @avaliacao_curriculo.nota_producao_cientifica, user_id: @avaliacao_curriculo.user_id }
    assert_redirected_to avaliacao_curriculo_path(assigns(:avaliacao_curriculo))
  end

  test "should destroy avaliacao_curriculo" do
    assert_difference('AvaliacaoCurriculo.count', -1) do
      delete :destroy, id: @avaliacao_curriculo
    end

    assert_redirected_to avaliacao_curriculos_path
  end
end
