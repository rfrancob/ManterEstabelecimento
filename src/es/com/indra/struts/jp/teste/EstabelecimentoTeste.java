/**
 * 
 */
package es.com.indra.struts.jp.teste;

import org.junit.Test;

import es.com.indra.struts.jp.domain.*;
import junit.framework.TestCase;

/**
 * @author rfrancob
 *
 */
public class EstabelecimentoTeste extends TestCase {

	@Test
	public void testEstabelecimento(){
		Estabelecimento e1 = new Estabelecimento();
		Long id1;
		id1 = (long) 01;
		assertEquals(id1, e1.getId());
		assertEquals("teste", e1.getCodigo());
		assertEquals("ativo", e1.getSituacao());
		assertEquals("teste", e1.getDescricao());
		assertEquals("74663520", e1.getCep());
		assertEquals("Avenida Pedro Paulo de Souza", e1.getRua());
		assertEquals("Setor Goiânia 2", e1.getBairro());
		assertEquals("GO", e1.getUf());
		assertEquals("5208707", e1.getIbge());
	}
	
	@Test
	public void testSetId(){
		Estabelecimento e2 = new Estabelecimento();
		Long id2;
		id2 = (long) 02;
		e2.setId(id2);
		assertEquals(id2, e2.getId());
	}
	
	@Test
	public void testSetCodigo(){
		Estabelecimento e3 = new Estabelecimento();
		e3.setCodigo("Teste2");
		assertEquals("Teste2", e3.getCodigo());
	}
	
	@Test
	public void testSetDescricao(){
		Estabelecimento e4 = new Estabelecimento();
		e4.setDescricao("Indracompany");
		assertEquals("Indracompany", e4.getDescricao());
	}
	
	@Test
	public void testSetCep(){
		Estabelecimento e5 = new Estabelecimento();
		e5.setCep("74663520");
		assertEquals("74663520", e5.getCep());
	}
	
	@Test
	public void testSetRua(){
		Estabelecimento e6 = new Estabelecimento();
		e6.setRua("Av. Pedro Paulo de Souza");
		assertEquals("Av. Pedro Paulo de Souza", e6.getRua());
	}
	
	@Test
	public void testSetBairro(){
		Estabelecimento e7 = new Estabelecimento();
		e7.setBairro("Setor Goiânia II");
		assertEquals("Setor Goiânia II", e7.getBairro());
	}
	
	@Test
	public void testSetUf(){
		Estabelecimento e8 = new Estabelecimento();
		e8.setBairro("Go");
		assertEquals("Go", e8.getBairro());
	}
	
	@Test
	public void testSetIbge(){
		Estabelecimento e9 = new Estabelecimento();
		e9.setIbge("Go");
		assertEquals("Go", e9.getIbge());
	}
}
