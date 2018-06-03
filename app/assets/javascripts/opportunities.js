$(document).ready(function() {
	$('#input-opportunities-search').keypress(function (e) {
	  if (e.which == 13) {
	    $('#submit-opportunities-search').trigger( "click" );
	  }
	});
	
	$('#submit-opportunities-search').click(function(){
		$('#submit-opportunities-search').attr("disabled", true);
		$(".spinner").show();
		$.ajax({
			type: "GET",
  		url: "/opportunities/find",
  		data: {
  			"opportunities_query": {
  				"title": $('#input-opportunities-search').val(),
  				"location": null
  			}
  		},
  		success: function(data) {
  			$('#submit-opportunities-search').attr("disabled", false);
  			$(".spinner").hide();
  			$('#search-results').html("<br><h3>Results:</h3><hr>");
  			
  			appendResults(data);
  		},
  		error: function(xhr) {
        alert(xhr.responseText);
        $('#submit-opportunities-search').attr("disabled", false);
  			$(".spinner").hide();
      }
		});
	});
});

function appendResults(data) {
	if (data['count'] != 0) {
		var i = 0;
  	for(var i in data['results']) {
			var panelBody = "<div class='panel-body'><div class='row'>";
			
			panelBody += "<div class='col-md-10'><p><b> Title: </b>" + data['results'][i]['title'] + "</p>";
			if (data['results'][i]['description']) {
				panelBody += "<p><b> Description: </b>" + data['results'][i]['description'] + "</p>";
			}
			var visaSponsorship = data['results'][i]['visa_sponsorship'] == true ? 'Yes' : 'No'
			var apartmentSponsership = data['results'][i]['apartment_sponsership'] == true ? 'Yes' : 'No'
			panelBody += "<p><b> Apartment Sponsership: </b>" + apartmentSponsership + "</p>";
			panelBody += "<p><b> Visa Sponsorship: </b>" + visaSponsorship + "</p></div>";
			panelBody += "</div></div>";
			
			$('#search-results').append(
				"<br><div class='panel panel-default'><div class='panel-heading'>" + 
				"<p><b>Title: </b>" + data['results'][i]['title'] + "</p>" +
				"</div>" + panelBody + "</div>"
			);	
		}
	} else {
		$('#search-results').append("<p>No matching results</p>");
	}
}

