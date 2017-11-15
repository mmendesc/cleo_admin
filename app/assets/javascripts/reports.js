$(document).on('turbolinks:load',function() {

  if($(".google_chart").length){

    initialize();

    function initialize() {
        google.charts.load('43', {'packages': ['bar', 'line', 'corechart']});
        setCallback();
      }

      function setCallback(){
        setTopCallback();
        setRevenueCallback();
        setDayRevenueCallback();
        setDayProductRevenueCallback();
      }

      function setTopCallback(){
        if ($('#top_ten_chart').length){
          google.charts.setOnLoadCallback(drawTopReport);
        }
      }

      function setRevenueCallback(){
        if ($('#revenue_chart').length){
          google.charts.setOnLoadCallback(drawRevenueReport);
        }
      }

      function setDayRevenueCallback(){
        if ($('#day_revenue_chart').length){
          google.charts.setOnLoadCallback(drawDayRevenueReport);
        }
      }

      function setDayProductRevenueCallback(){
        if ($('#day_product_revenue_chart').length){
          google.charts.setOnLoadCallback(drawDayProductRevenueReport);
        }
      }

      function drawTopReport() {
        top_report();
      }

      function drawRevenueReport() {
        revenue_report();
      }

      function drawDayRevenueReport() {
        day_revenue_report();
      }

      function drawDayProductRevenueReport() {
        day_product_revenue_report();
      }

      function top_report() {
        hideLoading('top');
        $.getJSON("http://localhost:3000/admin/top_ten", {saloon_id: 1}, function(data){
          drawTop(data)
        });
      }

      function revenue_report() {
        hideLoading('top');
        $.getJSON("http://localhost:3000/admin/total_revenue", {saloon_id: 1}, function(data){
          drawRevenue(data)
        });
      }

      function day_revenue_report() {
        hideLoading('top');
        $.getJSON("http://localhost:3000/admin/revenue_day", {saloon_id: 1, day: "14/11/2017"}, function(data){
          drawDayRevenue(data)
        });
      }

      function day_product_revenue_report() {
        hideLoading('top');
        $.getJSON("http://localhost:3000/admin/revenue_day_product", {saloon_id: 1, day: "13/11/2017", product: 'pRoduto1'}, function(data){
          drawDayProductRevenue(data)
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

        var chart = new google.visualization.PieChart(document.getElementById('top_ten_chart'));
        chart.draw(data1, options);
      }

      function drawRevenue(data) {

        var options = {
          title: 'Lucro',
          sliceVisibilityThreshold: 0,
          tooltip: {
            text: 'percentage'
          },
          slices: {
            0: {color: '#3366CC'},
            1: {color: '#DC3912'},
            2: {color: '#2C3A12'}
          }
        };

        var data1 = new google.visualization.DataTable();
        data1.addColumn('string', 'Sexo');
        data1.addColumn('number', 'Quantidade');
          data1.addRows([
            ['Vendas',data.sales],
            ['Serviços', data.services],
            ['Total: ' + data.total , 0]
            ]);

        if (no_data(data)){
          data1.addRows([
          ['Nenhum Usuário registrado nesse período.',1]
          ])
        }

        var chart = new google.visualization.PieChart(document.getElementById('revenue_chart'));
        chart.draw(data1, options);
      }

      function drawDayRevenue(data) {

        var options = {
          title: 'Lucro',
          sliceVisibilityThreshold: 0,
          tooltip: {
            text: 'percentage'
          },
          slices: {
            0: {color: '#3366CC'},
            1: {color: '#DC3912'},
            2: {color: '#2C3A12'}
          }
        };

        var data1 = new google.visualization.DataTable();
        data1.addColumn('string', 'Sexo');
        data1.addColumn('number', 'Quantidade');
          data1.addRows([
            ['Vendas',data.sales],
            ['Serviços', data.services],
            ['Total: ' + data.total , 0]
            ]);

        if (no_data(data)){
          data1.addRows([
          ['Nenhum Usuário registrado nesse período.',1]
          ])
        }

        var chart = new google.visualization.PieChart(document.getElementById('day_revenue_chart'));
        chart.draw(data1, options);
      }

      function drawDayProductRevenue(data) {

        var options = {
          title: 'Lucro',
          sliceVisibilityThreshold: 0,
          tooltip: {
            text: 'percentage'
          },
          slices: {
            0: {color: '#3366CC'},
            1: {color: '#DC3912'},
          }
        };

        var data1 = new google.visualization.DataTable();
        data1.addColumn('string', 'Sexo');
        data1.addColumn('number', 'Quantidade');
          data1.addRows([
            ['Vendas',data.total],
            ['Quantidade: ' + data.quantity , 0]
            ]);

        if (no_data(data)){
          data1.addRows([
          ['Nenhum Usuário registrado nesse período.',1]
          ])
        }

        var chart = new google.visualization.PieChart(document.getElementById('day_product_revenue_chart'));
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
