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

var setContactInfo = function() {
  var url = $("#candidate_website").val();
  var inputs = $("input#candidate_email,input#candidate_phone");
  inputs.attr('disabled', true);
  $.getJSON('/candidates/contact-info.json', {'url':url}, function(data) {
    $("input#candidate_email").val(data.email);
    $("input#candidate_phone").val(data.phone);
    $("input#candidate_twitter").val(data.twitter);
    $("input#candidate_facebook").val(data.facebook);
    inputs.removeAttr("disabled");
    loadInfoFromFacebook(data.facebook);
  })
}

var loadInfoFromFacebook = function(facebook) {
  inputs = $("#candidate_name, #candidate_bio, #candidate_photo, #candidate_email");
  inputs.attr("disabled", true);
  //var fb = $("#candidate_facebook").val();
  var fb = $("#candidate_facebook").val();
  $.getJSON('/candidates/facebook', {'fb': fb}, function(data) {
    //var twitter, website;
    //if(data.website) {
      //website_matches = data.website.match(/.*/);
      //if(website_matches) {
        //website = data.website.match(/.*/)[0];
        //v = /twitter.com\/(\w{1,15})/gi;
        //matches = v.exec(data.website);
        //if(matches != null && matches.length > 1) {
          //twitter = matches[1];
        //}
      //}
    //}
    $("#candidate_name").val(data.name);
    $("#candidate_bio").val(data.bio);
    $("#candidate_photo").val(data.picture);
    //$("#candidate_website").val(website);
    //$("#candidate_twitter").val(twitter);
    inputs.removeAttr("disabled");
    /*if(website && website != "")
    {
      setContactInfo(website);
    }*/
  });
}



$(document).ready(function() {
  bios.init();

  //$("#candidate_website").blur(function(){setContactInfo($(this).val());});
  $("#website-fetch").click(function(e){
    e.preventDefault();
    setContactInfo();
  });

  $(".mute").click(function(){ $("body").removeClass('patriotic'); });
})
