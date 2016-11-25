$('#button').click(function() {
  var doc = new jsPDF('landscape', 'pt', 'a4');
  doc.addHTML($('#manterEstabelecimento'), function() {
    doc.save("teste.pdf");
  });
});
