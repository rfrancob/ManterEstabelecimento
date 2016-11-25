package es.com.indra.struts.jp.dao;

import java.util.List;

import es.com.indra.struts.jp.domain.Estabelecimento;


public interface EstabelecimentoDAO {

	public void saveOrUpdateEstabelecimento(Estabelecimento estabelecimento);
	public List<Estabelecimento> listEstabelecimento();
	public Estabelecimento listEstabelecimentoById(Long estabelecimentoId);
	public void deleteEstabelecimento(Long estabelecimentoId);
}
