// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//  require turbolinks

//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails

//= require ./js/plugins/moment.min.js
//= require ./js/core/popper.min.js

//= require ./js/core/bootstrap-material-design.min.js
//= require ./js/plugins/jquery.bootstrap-wizard.js
//= require ./js/plugins/bootstrap-selectpicker.js
//= require ./js/plugins/bootstrap-datetimepicker.min.js
//= require ./js/plugins/bootstrap-tagsinput.js
//= require ./js/plugins/jasny-bootstrap.min.js
//= require ./js/plugins/bootstrap-notify.js


//= require_tree .







// popup modalwindow
window.onload = function() {
  var popup = document.getElementById('js-popup');
  if(!popup) return;
  popup.classList.add('is-show');

  var blackBg = document.getElementById('js-black-bg');
  var closeBtn = document.getElementById('js-close-btn');

  closePopUp(blackBg);
  closePopUp(closeBtn);

  function closePopUp(elem) {
    if(!elem) return;
    elem.addEventListener('click', function() {
      popup.classList.remove('is-show');
    })
  }
}

$('a[href^="#"]').click(function() {
  // スクロールの速度
  var speed = 1000; // ミリ秒で記述
  var href = $(this).attr("href");
  var target = $(href == "#" || href == "" ? 'html' : href);
  var position = target.offset().top;
  $('body,html').animate({
    scrollTop: position
  }, speed, 'swing');
  return false;
});

