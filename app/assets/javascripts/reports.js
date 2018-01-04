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
        setProductRevenueCallback();
        setServiceRevenueCallback();
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

      function setProductRevenueCallback(){
        if ($('#product_revenue_chart').length){
          google.charts.setOnLoadCallback(drawProductRevenueReport);
        }
      }

      function setServiceRevenueCallback(){
        if ($('#service_revenue_chart').length){
          google.charts.setOnLoadCallback(drawServiceRevenueReport);
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

      function drawProductRevenueReport() {
        product_revenue_report();
      }

      function drawServiceRevenueReport() {
        service_revenue_report();
      }

      function top_report() {
        hideLoading('top');
        $.getJSON("http://localhost:3000/admin/top_ten", {saloon_id: $('.google_chart').data('saloon')}, function(data){
          drawTop(data)
        });
      }

      function revenue_report() {
        hideLoading('top');
        $.getJSON("http://localhost:3000/admin/total_revenue", {saloon_id: $('.google_chart').data('saloon')}, function(data){
          drawRevenue(data)
        });
      }

      function day_revenue_report() {
        hideLoading('top');
        $.getJSON("http://localhost:3000/admin/revenue_day", {saloon_id: $('.google_chart').data('saloon'), day: $('.google_chart').data('day')}, function(data){
          drawDayRevenue(data)
        });
      }

      function day_product_revenue_report() {
        hideLoading('top');
        $.getJSON("http://localhost:3000/admin/revenue_day_product", {saloon_id: $('.google_chart').data('saloon'), day: $('.google_chart').data('day'), product: $('.google_chart').data('product')}, function(data){
          drawDayProductRevenue(data)
        });
      }

      function product_revenue_report() {
        hideLoading('top');
        $.getJSON("http://localhost:3000/admin/revenue_by_product", {saloon_id: $('.google_chart').data('saloon'), product: $('.google_chart').data('product')}, function(data){
          drawProductRevenue(data)
        });
      }

      function service_revenue_report() {
        hideLoading('top');
        $.getJSON("http://localhost:3000/admin/total_services_revenue", {saloon_id: $('.google_chart').data('saloon')}, function(data){
          drawServiceRevenue(data)
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
        nclients = Object.keys(data).length

        var options = {
          title: 'Top 10 Clientes',
          backgroundColor: { fill:'transparent' },
          tooltip: {
            text: 'percentage'
          },
          slices: {
            0: {color: '#3366CC'},
            1: {color: '#DC3912'},
            2: {color: '#0C2948'},
            3: {color: '#1C2947'},
            4: {color: '#2C2946'},
            5: {color: '#3C2945'},
            6: {color: '#4C2944'},
            7: {color: '#5C2943'},
            8: {color: '#6C2942'},
            9: {color: '#7C2941'},
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
          backgroundColor: { fill:'transparent' },
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
            ['Total: ' + data.total + ' R$', 0]
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
          title: 'Lucro por Dia',
          sliceVisibilityThreshold: 0,
          backgroundColor: { fill:'transparent' },
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
          title: 'Lucro por Produto por Dia',
          sliceVisibilityThreshold: 0,
          backgroundColor: { fill:'transparent' },
          pieSliceText: 'value',
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

      function drawProductRevenue(data) {

        var options = {
          title: 'Lucro por Produto',
          sliceVisibilityThreshold: 0,
          backgroundColor: { fill:'transparent' },
          pieSliceText: 'value',
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

        var chart = new google.visualization.PieChart(document.getElementById('product_revenue_chart'));
        chart.draw(data1, options);
      }

      function drawServiceRevenue(data) {

        var options = {
          title: 'Lucro por Serviços',
          sliceVisibilityThreshold: 0,
          backgroundColor: { fill:'transparent' },
          pieSliceText: 'value',
          tooltip: {
            text: 'percentage'
          },
          slices: {
            0: {color: '#3366CC'},
            1: {color: '#DC3912'},
          }
        };

        var data1 = new google.visualization.DataTable();
        data1.addColumn('string', 'Total');
        data1.addColumn('number', 'Valor');
          data1.addRows([
            ['Vendas',data.total],
            ['Quantidade: ' + data.quantity , 0]
            ]);

        if (no_data(data)){
          data1.addRows([
          ['Nenhum Usuário registrado nesse período.',1]
          ])
        }

        var chart = new google.visualization.PieChart(document.getElementById('service_revenue_chart'));
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
