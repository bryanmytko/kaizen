// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//
$(document).ready(function(){
  Tipped.create(".unit", function(el){
    var date = $(el).data().date;
    var complete = $(el).data().complete;

    if(complete === true){
      var status = '<span class="ok">✓</span>';
    }
    else {
      var status = '<span class="x">X</span>';
    }

    formatted_date = new Date(date);
    return status + " " + formatted_date.toLocaleDateString();
  });
});
