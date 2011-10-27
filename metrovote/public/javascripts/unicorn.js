$(document).ready(function() {
  $("#facebook-fetch").click(function(e){
    e.preventDefault();
    var fb = $("#candidate_facebook").val();
    $.getJSON('/candidates/facebook', {'fb': fb}, function(data) {
      var website = data.website.match(/.*/)[0];
      v = /twitter.com\/(\w{1,15})/gi;
      matches = v.exec(data.website);
      var twitter;
      if(matches != null && matches.length > 1) {
        twitter = matches[1];
      }
      $("#candidate_name").val(data.name);
      $("#candidate_bio").val(data.bio);
      $("#candidate_photo").val(data.picture);
      $("#candidate_website").val(website);
      //$("#candidate_email").val();
      $("#candidate_twitter").val(twitter);
    });
  });
})
