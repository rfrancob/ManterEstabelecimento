
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Estabelecimento</title>
<link rel="stylesheet" type="text/css"
	href="frontend/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="frontend/bootstrap/css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css"
	href="frontend/bootstrap/css/ie10-viewport-bug-workaround.css" />
<link rel="stylesheet" type="text/css"
	href="frontend/bootstrap/css/dashboard.css" />
<script src="js/javascriptCep.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jspdf.min.js"></script>
<script src="js/html2canvas.js"></script>

<s:head />
<style type="text/css">
</style>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Manter Estabelecimento</a>
		</div>
	</div>
	</nav>

	<div class="container">
		<div>
			<h1 class="page-header">Estabelecimento</h1>
			<form action="saveOrUpdateEstabelecimento">
				<s:push value="estabelecimento">
					<s:hidden name="id" />
					<div class="form-group col-md-12 container">
						<label for="codigo">Código: </label><input name="codigo"
							type="text" class="form-control" id="codigo"
							placeholder="Digite um código">
					</div>

					<div class="form-group col-md-12 container">
						<label for="descricao">Descrição: </label><input name="descricao"
							type="text" class="form-control" id="descricao"
							placeholder="Qual é a descrição?">
					</div>

					<div class="form-group col-md-12 container">
						<label>Situação:</label> <select class="form-control"
							name="situacao" id="situacao">
							<option>Escolha uma Situação</option>
							<option>Ativo</option>
							<option>Inativo</option>
						</select>
					</div>

					<div class="form-group col-md-12 container">
						<div>
							<label for="cep">CEP:</label> <input type="text"
								onblur="pesquisacep(this.value);"
								onblur="ValidaCep(this.value);" name="cep" class="form-control"
								id="cep" placeholder="digite um CEP">
						</div>
					</div>

					<div class="form-group col-md-12 container">
						<label for="rua">Logradouro: </label><input name="rua" type="text"
							class="form-control" id="rua" placeholder="Nome da rua">
					</div>

					<div class="form-group col-md-12 container">
						<label for="bairro">Bairro: </label><input name="bairro"
							type="text" class="form-control" id="bairro"
							placeholder="Nome do Bairro">
					</div>

					<div class="form-group col-md-12 container">
						<label for="cidade">Cidade: </label><input name="cidade"
							type="text" class="form-control" id="cidade"
							placeholder="Nome da Cidade">
					</div>

					<div class="form-group col-md-12 container">
						<label for="uf">Estado: </label><input name="uf" type="text"
							class="form-control" id="uf" placeholder="Nome do Estado">
					</div>


					<div class="form-group col-md-12 container">
						<label for="ibge">IBGE: </label><input name="ibge" type="text"
							class="form-control" id="ibge" placeholder="IBGE">
					</div>

					<div class="container">
						<button onclick="saveOrUpdateEstabelecimento"
							class="btn btn-success pull-right">Salvar</button>
					</div>
				</s:push>
			</form>
		</div>
	</div>


	<div id="manterEstabelecimento" class="container"
		style="background-color: #fff">
		<h1 class="page-header">Manter Estabelecimento</h1>
		<s:if test="estabelecimentoList.size() > 0">
			<div id="tabelaManterEstabelecimento">

				<table class="table table-striped">
					<tr>
						<th>Código</th>
						<th>Situação</th>
						<th>Descrição</th>
						<th>Cep</th>
						<th>Logradouro</th>
						<th>Bairro</th>
						<th>Estado</th>
						<th>IBGE</th>
						<!--<th>Editar</th>-->
						<th>Deletar</th>
					</tr>
					<s:iterator value="estabelecimentoList"
						status="estabelecimentoStatus">
						<tr
							class="<s:if test="#estabelecimentoStatus.odd == true ">odd</s:if><s:else>even</s:else>">
							<td><s:property value="codigo" /></td>
							<td><s:property value="situacao" /></td>
							<td><s:property value="descricao" /></td>
							<td><s:property value="cep" /></td>
							<td><s:property value="rua" /></td>
							<td><s:property value="bairro" /></td>
							<td><s:property value="uf" /></td>
							<td><s:property value="ibge" /></td>

							<!--<td><s:url id="editURL" action="editEstabelecimento">
									<s:param name="id" value="%{id}"></s:param>
								</s:url> <s:a href="%{editURL}">Editar</s:a></td>-->

							<td><s:url id="deleteURL" action="deleteEstabelecimento">
									<s:param name="id" value="%{id}"></s:param>
								</s:url> <s:a href="%{deleteURL}">Deletar</s:a></td>
						</tr>
					</s:iterator>
				</table>

			</div>

		</s:if>
	</div>

	<div class="container">
		<button id="PDF" type="button" class="btn btn-danger pull-right"
			style="margin-right: 10px">Gerar PDF</button>
		<button id="EXCEL" type="button" class="btn btn-success pull-right"
			style="margin-right: 10px">Exportar par Excel</button>
	</div>
	<script>
		$('#PDF').click(function() {
			var doc = new jsPDF('landscape', 'pt', 'a4');
			doc.addHTML($('#manterEstabelecimento'), function() {
				doc.save("teste.pdf");
			});
		});
	</script>

	<script>
		$("#EXCEL").click(
				function(e) {
					window.open('data:application/vnd.ms-excel,'
							+ $('#tabelaManterEstabelecimento').html());
					e.preventDefault();
				});
	</script>

</body>
</html>
