class ResultadoFinalsController < ApplicationController
  before_action :set_resultado_final, only: [:show, :edit, :update, :destroy]
  before_action :load_avaliacao_preprojeto, only: :create
  load_and_authorize_resource

  respond_to :html

  def index
    @resultado_finals = ResultadoFinal.all
    respond_with(@resultado_finals)
  end

  def show
    respond_with(@resultado_final)
  end

  def new
    @resultado_final = ResultadoFinal.new
    respond_with(@resultado_final)
  end

  def edit
  end

  def create
    @resultado_final = ResultadoFinal.new(resultado_final_params)
    @resultado_final.save
    respond_with(@resultado_final)
  end

  def update
    @resultado_final.update(resultado_final_params)
    respond_with(@resultado_final)
  end

  def destroy
    @resultado_final.destroy
    respond_with(@resultado_final)
  end

  def finalizar
    @processo_seletivo = ProcessoSeletivo.find(params[:ps])
    nomes_conflitos = ''
    @processo_seletivo.processo_seletivos_linha_pesquisas.each do |pslp|
      pslp.inscricaos.each do |i|
        avaliacao_pre_projeto = AvaliacaoPreProjeto.find_by 'inscricao_id ', i.id
        avaliacoes_curriculo = []
        AvaliacaoCurriculo.where(['inscricao_id = ?', i.id]).find_each do |avaliacao|
          avaliacoes_curriculo.push(avaliacao)
        end
        conflitos = verificar_conflitos(avaliacoes_curriculo)
        if conflitos != ''
          nomes_conflitos = nomes_conflitos + conflitos
        end
      end #fim each inscricao
    end #fim each processo_seletivo_linha_pesquisa

    if nomes_conflitos == ''
      resultados_finais = []
      nomes_conflitos = ''
      @processo_seletivo.processo_seletivos_linha_pesquisas.each do |pslp|
        pslp.inscricaos.each do |i|
          avaliacao_pre_projeto = AvaliacaoPreProjeto.find_by 'inscricao_id ', i.id
          avaliacoes_curriculo = []
          AvaliacaoCurriculo.where(['inscricao_id = ?', i.id]).find_each do |avaliacao|
            avaliacoes_curriculo.push(avaliacao)
          end

          #calcular nota final
          resultado_final = ResultadoFinal.new
          resultado_final.inscricao_id = i.id

          nota_pre_projeto = (avaliacao_pre_projeto.aderencia * 0.2) + 
              (avaliacao_pre_projeto.alinhamento * 0.3) +
              (avaliacao_pre_projeto.contextualizacao * 0.1) +
              (avaliacao_pre_projeto.redacao * 0.1) +
              (avaliacao_pre_projeto.consistencia * 0.1) +
              (avaliacao_pre_projeto.autonomia * 0.2) 
          ac = avaliacoes_curriculo[0]
          if(@processo_seletivo.descricao == 'Mestrado')
            nota_curriculo = ((ac.nota_historicos * 5.5) +
                (ac.nota_producao_cientifica * 2) +
                (ac.nota_experiencia_docente) +
                (ac.nota_experiencia_pdi) + 
                (ac.nota_experiencia_profissional * 0.5))/10
            if nota_curriculo < 3.5 || nota_pre_projeto < 8
              resultado_final.aprovado = false 
            else
              resultado_final.aprovado = true
            end
          else  #doutorado
            resultado_final.aprovado = true
            nota_curriculo = ((ac.nota_historicos * 5.5) +
                (ac.nota_producao_cientifica * 3) +
                (ac.nota_experiencia_docente * 0.5) +
                (ac.nota_experiencia_pdi * 0.5) + 
                (ac.nota_experiencia_profissional * 0.5))/10
          end
          if nota_pre_projeto < 8
            resultado_final.aprovado = false 
          else
            resultado_final.aprovado = true
          end
          resultado_final.nota_final = (nota_pre_projeto * 0.4) + (nota_curriculo * 0.6)

          resultados_finais.push(resultado_final)
        end
      end
      resultados_finais.each do |rf|
        rf.save!
      end
      respond_with resultados_finais, :notice => "Processo seletivo finalizado com sucesso."
    else
      redirect_to "/processo_seletivos_abertos", :alert => "Não foi possível finalizar o Processo seletivo.
      Foram encontradas avaliações conflitantes para os seguintes candidatos: " + nomes_conflitos
    end
  end

  def verificar_conflitos(avaliacoes_curriculo)
    nomes_conflitos = ''
    avaliacoes_curriculo.each do |ac|
      #verifica se há conflito de notas com as outras avaliações
      avaliacoes_curriculo.each do |ac2|
        if ac.inscricao_id == ac2.inscricao_id
          if ac.nota_historicos != ac2.nota_historicos ||
                ac.nota_producao_cientifica != ac2.nota_producao_cientifica ||
                ac.nota_experiencia_docente != ac2.nota_experiencia_docente ||
                ac.nota_experiencia_pdi != ac2.nota_experiencia_pdi
                ac.nota_experiencia_profissional != ac2.nota_experiencia_profissional
            nomes_conflitos = nomes_conflitos + ac.inscricao.user.pessoa.nome + ', '
          end #fim if    
        end # if inscricao_id
      end #fim each avaliacao_curriculo2
    end #fim each avaliacao_curriculo
    if nomes_conflitos != ''
      nomes_conflitos = nomes_conflitos.split(",")
      nc = []
      nomes_conflitos.each do |conflito|
        #remover repetidos  
        if ! nc.include? conflito
          nc.push(conflito)
        end
      end
      nomes_conflitos = ''
      nc.each do |n|
        nomes_conflitos = nomes_conflitos + n + ", "
      end
      nomes_conflitos = nomes_conflitos[0, nomes_conflitos.length - 2]
    end
    return nomes_conflitos
  end

  # def exibir_classificacao
  #   @exibir_classificacao = []
  #   #ResultadoFinal.search(params[:ps])
  #   #ps = ProcessoSeletivo.find(params[:ps])
  #   ResultadoFinal.where('pslp.processo_seletivo_id in (select ps.id 
  #     from inscricaos i join processo_seletivos_linha_pesquisas pslp on i.processo_seletivos_linha_pesquisa_id = pslp.id 
  #     where pslp.processo_seletivo_id = ' + params[:ps] + ')').find_each do |rf|
  #     @exibir_classificacao.push(rf)
  #   end
  #   respond_with @exibir_classificacao
  # end

  private
    def set_resultado_final
      @resultado_final = ResultadoFinal.find(params[:id])
    end

    def resultado_final_params
      params.require(:resultado_final).permit(:inscricao_id, :nota_final)
    end
    def load_resultado_final
      @resultado_final = ResultadoFinal.new(resultado_final_params)
    end
end
