package es.com.indra.struts.jp.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import es.com.indra.struts.jp.dao.EstabelecimentoDAO;
import es.com.indra.struts.jp.dao.EstabelecimentoDAOImpl;
import es.com.indra.struts.jp.domain.Estabelecimento;


public class EstabelecimentoAction extends ActionSupport implements ModelDriven<Estabelecimento> {

	private static final long serialVersionUID = -6659925652584240539L;

	private Estabelecimento estabelecimento = new Estabelecimento();
	private List<Estabelecimento> estabelecimentoList = new ArrayList<Estabelecimento>();
	private EstabelecimentoDAO estabelecimentoDAO = new EstabelecimentoDAOImpl();
	
	@Override
	public Estabelecimento getModel() {
		return estabelecimento;
	}
	
	/**
	 * To save or update estabelecimento.
	 * @return String
	 */
	public String saveOrUpdate()
	{	
		estabelecimentoDAO.saveOrUpdateEstabelecimento(estabelecimento);
		return SUCCESS;
	}
	
	/**
	 * To list all estabelecimentos.
	 * @return String
	 */
	public String list()
	{
		estabelecimentoList = estabelecimentoDAO.listEstabelecimento();
		return SUCCESS;
	}
	
	/**
	 * To delete a estabelecimento.
	 * @return String
	 */
	public String delete()
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		estabelecimentoDAO.deleteEstabelecimento(Long.parseLong(request.getParameter("id")));
		return SUCCESS;
	}
	
	/**
	 * To list a single estabelecimento by Id.
	 * @return String
	 */
	public String edit()
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		estabelecimento = estabelecimentoDAO.listEstabelecimentoById(Long.parseLong(request.getParameter("id")));
		return SUCCESS;
	}
	
	public Estabelecimento getEstabelecimento() {
		return estabelecimento;
	}

	public void setEstabelecimento(Estabelecimento estabelecimento) {
		this.estabelecimento = estabelecimento;
	}

	public List<Estabelecimento> getEstabelecimentoList() {
		return estabelecimentoList;
	}

	public void setEstabelecimentoList(List<Estabelecimento> estabelecimentoList) {
		this.estabelecimentoList = estabelecimentoList;
	}

}
