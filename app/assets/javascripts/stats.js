$(function () {


    $.getJSON('/api/page_edits/' + subdomain + '?callback=?', function (data) {

        // Create the chart
        $('#container').highcharts('StockChart', {
            rangeSelector: {

                buttons: [{
                    type: 'day',
                    count: 3,
                    text: '3d'
                }, {
                    type: 'week',
                    count: 1,
                    text: '1w'
                }, {
                    type: 'month',
                    count: 1,
                    text: '1m'
                }, {
                    type: 'month',
                    count: 6,
                    text: '6m'
                }, {
                    type: 'year',
                    count: 1,
                    text: '1y'
                }, {
                    type: 'all',
                    text: 'All'
                }],
                selected: 3
            },

            yAxis: {
                title: {
                    text: 'Page Edits'
                }
            },

            title: {
                text: 'Number of Page Edited in the Last Hour'
            },

            subtitle: {
                text: 'subtitle'
            },

            series: [{
                name: 'Page edits',
                data: data
            }]
        });
    });
});
