require 'test_helper'

class InscricaosControllerTest < ActionController::TestCase
  setup do
    @inscricao = inscricaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inscricaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inscricao" do
    assert_difference('Inscricao.count') do
      post :create, inscricao: { carga_horaria_graduacao: @inscricao.carga_horaria_graduacao, conceito_capes: @inscricao.conceito_capes, graduacao_exterior: @inscricao.graduacao_exterior, media_graduacao: @inscricao.media_graduacao, media_mestrado: @inscricao.media_mestrado, processo_seletivos_linha_pesquisa_id: @inscricao.processo_seletivos_linha_pesquisa_id, tem_pos_graduacao: @inscricao.tem_pos_graduacao, tempo_curso_mestrado: @inscricao.tempo_curso_mestrado, users_id: @inscricao.users_id }
    end

    assert_redirected_to inscricao_path(assigns(:inscricao))
  end

  test "should show inscricao" do
    get :show, id: @inscricao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inscricao
    assert_response :success
  end

  test "should update inscricao" do
    patch :update, id: @inscricao, inscricao: { carga_horaria_graduacao: @inscricao.carga_horaria_graduacao, conceito_capes: @inscricao.conceito_capes, graduacao_exterior: @inscricao.graduacao_exterior, media_graduacao: @inscricao.media_graduacao, media_mestrado: @inscricao.media_mestrado, processo_seletivos_linha_pesquisa_id: @inscricao.processo_seletivos_linha_pesquisa_id, tem_pos_graduacao: @inscricao.tem_pos_graduacao, tempo_curso_mestrado: @inscricao.tempo_curso_mestrado, users_id: @inscricao.users_id }
    assert_redirected_to inscricao_path(assigns(:inscricao))
  end

  test "should destroy inscricao" do
    assert_difference('Inscricao.count', -1) do
      delete :destroy, id: @inscricao
    end

    assert_redirected_to inscricaos_path
  end
end
