var bios = function(){
  var visible;
  var div;
  var trigger;
  var key = document.location.pathname + "-bio-visibility";
  var getVisibility = function(){
    var isVisible = localStorage.getItem(key);
    return isVisible && isVisible == "false" ? false : true;
  }
  var toggleVisbility = function(){
    visible = !visible;
    localStorage[key] = visible ? "true" : "false";
    updateLabel();
  }
  var updateLabel = function() {
    var label = visible ? "Less" : "More";
    trigger.html(label);
  }
  var init = function(){
    visible = getVisibility();
    div = $(".bios");
    trigger = $(".collapse-expand");
    if(!visible) {
      div.hide();
    }
    updateLabel();
    trigger.click(toggle);
  }
  var toggle = function(){
    if(visible) {
      div.slideUp();
    } else {
      div.slideDown();
    }
    toggleVisbility();
  }
  return {
    init : init,
  }
}();


$(document).ready(function() {
  bios.init();

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
  $(".mute").click(function(){ $("body").removeClass('patriotic'); });
})
