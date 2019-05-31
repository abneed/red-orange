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
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require Chart.bundle
//= require chartkick

$(document).ready(function() {
  $('[data-js-hide-link]').click(function(event){
    alert('You clicked the Hide link');
    event.preventDefault(); 
  });
});
var xml = "<rss version='2.0'><channel><title>RSS Title</title></channel></rss>",
  xmlDoc = $.parseXML( xml ),
  $xml = $( xmlDoc ),
  $title = $xml.find( "title" );
 
// Append "RSS Title" to #someElement
$( "#someElement" ).append( $title.text() );
 
// Change the title to "XML Title"
$title.text( "XML Title" );
 
// Append "XML Title" to #anotherElement
$( "#anotherElement" ).append( $title.text() );