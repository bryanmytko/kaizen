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
//= require_tree .
//
//
$(document).ready(function(){

  var login_tab = $('.home-form-container li.login-tab');
  var login_form = $('.home-form-container div.login');

  var signup_tab = $('.home-form-container li.signup-tab');
  var signup_form = $('.home-form-container div.signup');

  login_tab.click(toggle_home_form);
  signup_tab.click(toggle_home_form);

  var toggle_home_form = function(){
    signup_form.toggle();
    login_form.toggle();
  };
});
