window.setTimeout(function() { $(".alert").alert('close'); }, 3000);

$('.data').mask('39/19/9999');
$('.cep').mask('99999-999');
$('.fixtelefone').mask('(99) 9999-9999');
$('.telefone').mask('(99) 99999-999?9');
$('.cnpj').mask('99.999.999/9999-99');
$('.cpf').mask('999.999.999-99');
$('.money').mask('000.000.000.000.000,00');
$('.money2').mask("#.##0,00", {reverse: true});
$('.percent').mask('##0,00%', {reverse: true});
