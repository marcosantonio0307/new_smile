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


function activeTab(element){
	var tabs = document.getElementsByClassName('tabs');
	var containers = document.getElementsByClassName('container-procedure')
	for (i = 0; i < 8; i++) {
		tabs[i].style.background = '#fff';
		containers[i].style.display = 'none'
	};
	var tab = document.getElementById(element)
	var container = document.getElementById(tab.id + '-box')
	tab.style.background = '#F78181'
	container.style.display = 'block'
}