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
    var label = visible ? "Hide Bios <img src='/images/chevUp.png' />" : "Show Bios <img src='/images/chevDown.png' />";
   /* if(visible) {
      trigger.removeClass("collapsed");
      trigger.addClass("expanded");
    } else {
      trigger.addClass("collapsed");
      trigger.removeClass("expanded");
    } */
    var className = visible ? "expanded" : "collapsed";
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

var setContactInfo = function(url) {
  inputs = $("input#candidate_email,input#candidate_phone");
  inputs.attr('disabled', true);
  $.getJSON('/candidates/contact-info.json', {'url':url}, function(data) {
    $("input#candidate_email").val(data.email);
    $("input#candidate_phone").val(data.phone);
    inputs.removeAttr("disabled");
  })
}


$(document).ready(function() {
  bios.init();

  inputs = $("#candidate_name, #candidate_bio, #candidate_photo, #candidate_website, #candidate_twitter, #candidate_email");
  $("#facebook-fetch").click(function(e){
    inputs.attr("disabled", true);
    e.preventDefault();
    var fb = $("#candidate_facebook").val();
    $.getJSON('/candidates/facebook', {'fb': fb}, function(data) {
      var twitter, website;
      if(data.website) {
        website_matches = data.website.match(/.*/);
        if(website_matches) {
          website = data.website.match(/.*/)[0];
          v = /twitter.com\/(\w{1,15})/gi;
          matches = v.exec(data.website);
          if(matches != null && matches.length > 1) {
            twitter = matches[1];
          }
        }
      }
      $("#candidate_name").val(data.name);
      $("#candidate_bio").val(data.bio);
      $("#candidate_photo").val(data.picture);
      $("#candidate_website").val(website);
      $("#candidate_twitter").val(twitter);
      inputs.removeAttr("disabled");
      if(website && website != "")
      {
        setContactInfo(website);
      }
    });
  });
  $(".mute").click(function(){ $("body").removeClass('patriotic'); });
})
