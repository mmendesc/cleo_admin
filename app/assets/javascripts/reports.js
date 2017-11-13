$(document).on('turbolinks:load',function() {

  if($("#top_report").length){

    initialize();

    function initialize() {
        google.charts.load('43', {'packages': ['bar', 'line', 'corechart']});
        setCallback();
      }

      function setCallback(){
        setTopCallback();
      }

      function setTopCallback(){
        if ($('#top_report').length){
          google.charts.setOnLoadCallback(drawTopReport);
        }
      }

      function drawTopReport() {
        top_report();
      }

      function top_report() {
        hideLoading('top');
        $.getJSON("http://localhost:3000/admin/top_ten", {saloon_id: 1}, function(data){
          var testh = data;
          drawTop(data)
        });
      }

          // load
      function hideLoading(wrapper) {
        return function() {
          $('#' + wrapper).find('.loader').remove();
        }
      }

      // draw
      function drawTop(data) {

        var options = {
          title: 'Cliente',
          tooltip: {
            text: 'percentage'
          },
          slices: {
            0: {color: '#3366CC'},
            1: {color: '#DC3912'}
          }
        };

        var data1 = new google.visualization.DataTable();
        data1.addColumn('string', 'Sexo');
        data1.addColumn('number', 'Quantidade');
        $.each(data, function(key,value){
          data1.addRow([key,value])
        });

        if (no_data(data)){
          data1.addRows([
          ['Nenhum Usuário registrado nesse período.',1]
          ])
        }

        var chart = new google.visualization.PieChart(document.getElementById('top_report'));
        chart.draw(data1, options);
      }

      function no_data(data){
        var result = false
        for (var i in data) {
          if (data[i] != 0) {
              result = true;
              break;
          }
        }
        if (result) {
          return false
        } else {
          return true
        }

      }

  }
});
