require 'test_helper'

class AvaliacaoPreProjetosControllerTest < ActionController::TestCase
  setup do
    @avaliacao_pre_projeto = avaliacao_pre_projetos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:avaliacao_pre_projetos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create avaliacao_pre_projeto" do
    assert_difference('AvaliacaoPreProjeto.count') do
      post :create, avaliacao_pre_projeto: { aderencia: @avaliacao_pre_projeto.aderencia, alinhamento: @avaliacao_pre_projeto.alinhamento, autonomia: @avaliacao_pre_projeto.autonomia, contextualizacao: @avaliacao_pre_projeto.contextualizacao, inscricao_id: @avaliacao_pre_projeto.inscricao_id, redacao: @avaliacao_pre_projeto.redacao, user_id: @avaliacao_pre_projeto.user_id }
    end

    assert_redirected_to avaliacao_pre_projeto_path(assigns(:avaliacao_pre_projeto))
  end

  test "should show avaliacao_pre_projeto" do
    get :show, id: @avaliacao_pre_projeto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @avaliacao_pre_projeto
    assert_response :success
  end

  test "should update avaliacao_pre_projeto" do
    patch :update, id: @avaliacao_pre_projeto, avaliacao_pre_projeto: { aderencia: @avaliacao_pre_projeto.aderencia, alinhamento: @avaliacao_pre_projeto.alinhamento, autonomia: @avaliacao_pre_projeto.autonomia, contextualizacao: @avaliacao_pre_projeto.contextualizacao, inscricao_id: @avaliacao_pre_projeto.inscricao_id, redacao: @avaliacao_pre_projeto.redacao, user_id: @avaliacao_pre_projeto.user_id }
    assert_redirected_to avaliacao_pre_projeto_path(assigns(:avaliacao_pre_projeto))
  end

  test "should destroy avaliacao_pre_projeto" do
    assert_difference('AvaliacaoPreProjeto.count', -1) do
      delete :destroy, id: @avaliacao_pre_projeto
    end

    assert_redirected_to avaliacao_pre_projetos_path
  end
end
