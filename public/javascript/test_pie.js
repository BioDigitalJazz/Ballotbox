// Ting: experiment

var ctx = document.getElementById("myChart").getContext("2d");

var chart_colors = ["rgba(61, 201, 179, 1)", "#8C8080", "#242830", "yellow", "maroon", "pink", "purple", "orange"];
var data = [];
var index;

for (index = 0; index < gon.survey_options.length; index++) {
    data[index] = {
                    label: gon.survey_options[index], 
                    value: gon.option_votes[index],
                    color: chart_colors[index]
                  };
    // alert(gon.survey_feedbacks[index][:votes)
};

var legendStr = "<ul style=\"list-style-type: none;\" class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"color:<%=segments[i].fillColor%>;font-size:20px;font-weight:bold;\"><%if(segments[i].label){%><%=segments[i].label%><%}%></span></li><%}%></ul>"

var myNewChart = new Chart(ctx).Pie(data, { legendTemplate : legendStr });
var legend = myNewChart.generateLegend();

document.getElementById("legend").innerHTML = legend