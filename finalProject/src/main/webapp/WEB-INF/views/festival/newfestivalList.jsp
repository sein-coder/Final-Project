<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<style>
/*!
 * Bootstrap Reboot v4.1.0 (https://getbootstrap.com/)
 * Copyright 2011-2018 The Bootstrap Authors
 * Copyright 2011-2018 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * Forked from Normalize.css, licensed MIT (https://github.com/necolas/normalize.css/blob/master/LICENSE.md)
 */
*,
*::before,
*::after {
  -webkit-box-sizing: border-box;
  box-sizing: border-box; }

html {
  font-family: sans-serif;
  line-height: 1.15;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -ms-overflow-style: scrollbar;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0); }

@-ms-viewport {
  width: device-width; }

article, aside, dialog, figcaption, figure, footer, header, hgroup, main, nav, section {
  display: block; }

body {
  margin: 0;
  font-family: "Work Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #212529;
  text-align: left;
  background-color: #fff; }

[tabindex="-1"]:focus {
  outline: 0 !important; }

hr {
  -webkit-box-sizing: content-box;
  box-sizing: content-box;
  height: 0;
  overflow: visible; }

h1, h2, h3, h4, h5, h6 {
  margin-top: 0;
  margin-bottom: 0.5rem; }

p {
  margin-top: 0;
  margin-bottom: 1rem; }

abbr[title],
abbr[data-original-title] {
  text-decoration: underline;
  -webkit-text-decoration: underline dotted;
  text-decoration: underline dotted;
  cursor: help;
  border-bottom: 0; }

address {
  margin-bottom: 1rem;
  font-style: normal;
  line-height: inherit; }

ol,
ul,
dl {
  margin-top: 0;
  margin-bottom: 1rem; }

ol ol,
ul ul,
ol ul,
ul ol {
  margin-bottom: 0; }

dt {
  font-weight: 700; }

dd {
  margin-bottom: .5rem;
  margin-left: 0; }

blockquote {
  margin: 0 0 1rem; }

dfn {
  font-style: italic; }

b,
strong {
  font-weight: bolder; }

small {
  font-size: 80%; }

sub,
sup {
  position: relative;
  font-size: 75%;
  line-height: 0;
  vertical-align: baseline; }

sub {
  bottom: -.25em; }

sup {
  top: -.5em; }

a {
  color: #f38181;
  text-decoration: none;
  background-color: transparent;
  -webkit-text-decoration-skip: objects; }
  a:hover {
    color: #34c0e7;
    text-decoration: underline; }

a:not([href]):not([tabindex]) {
  color: inherit;
  text-decoration: none; }
  a:not([href]):not([tabindex]):hover, a:not([href]):not([tabindex]):focus {
    color: inherit;
    text-decoration: none; }
  a:not([href]):not([tabindex]):focus {
    outline: 0; }

pre,
code,
kbd,
samp {
  font-family: monospace, monospace;
  font-size: 1em; }

pre {
  margin-top: 0;
  margin-bottom: 1rem;
  overflow: auto;
  -ms-overflow-style: scrollbar; }

figure {
  margin: 0 0 1rem; }

img {
  vertical-align: middle;
  border-style: none; }

svg:not(:root) {
  overflow: hidden; }

table {
  border-collapse: collapse; }

caption {
  padding-top: 0.75rem;
  padding-bottom: 0.75rem;
  color: #6c757d;
  text-align: left;
  caption-side: bottom; }

th {
  text-align: inherit; }

label {
  display: inline-block;
  margin-bottom: 0.5rem; }

button {
  border-radius: 0; }

button:focus {
  outline: 1px dotted;
  outline: 5px auto -webkit-focus-ring-color; }

input,
button,
select,
optgroup,
textarea {
  margin: 0;
  font-family: inherit;
  font-size: inherit;
  line-height: inherit; }

button,
input {
  overflow: visible; }

button,
select {
  text-transform: none; }

button,
html [type="button"],
[type="reset"],
[type="submit"] {
  -webkit-appearance: button; }

button::-moz-focus-inner,
[type="button"]::-moz-focus-inner,
[type="reset"]::-moz-focus-inner,
[type="submit"]::-moz-focus-inner {
  padding: 0;
  border-style: none; }

input[type="radio"],
input[type="checkbox"] {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  padding: 0; }

input[type="date"],
input[type="time"],
input[type="datetime-local"],
input[type="month"] {
  -webkit-appearance: listbox; }

textarea {
  overflow: auto;
  resize: vertical; }

fieldset {
  min-width: 0;
  padding: 0;
  margin: 0;
  border: 0; }

legend {
  display: block;
  width: 100%;
  max-width: 100%;
  padding: 0;
  margin-bottom: .5rem;
  font-size: 1.5rem;
  line-height: inherit;
  color: inherit;
  white-space: normal; }

progress {
  vertical-align: baseline; }

[type="number"]::-webkit-inner-spin-button,
[type="number"]::-webkit-outer-spin-button {
  height: auto; }

[type="search"] {
  outline-offset: -2px;
  -webkit-appearance: none; }

[type="search"]::-webkit-search-cancel-button,
[type="search"]::-webkit-search-decoration {
  -webkit-appearance: none; }

::-webkit-file-upload-button {
  font: inherit;
  -webkit-appearance: button; }

output {
  display: inline-block; }

summary {
  display: list-item;
  cursor: pointer; }

template {
  display: none; }

[hidden] {
  display: none !important; }


/*  */
@font-face{font-family:Icons;src:url(../fonts/open-iconic/open-iconic.eot);src:url(../fonts/open-iconic/open-iconic.eot?#iconic-sm) format('embedded-opentype'),url(../fonts/open-iconic/open-iconic.woff) format('woff'),url(../fonts/open-iconic/open-iconic.ttf) format('truetype'),url(../fonts/open-iconic/open-iconic.otf) format('opentype'),url(../fonts/open-iconic/open-iconic.svg#iconic-sm) format('svg');font-weight:400;font-style:normal}.oi{position:relative;top:1px;display:inline-block;speak:none;font-family:Icons;font-style:normal;font-weight:400;line-height:1;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}.oi:empty:before{width:1em;text-align:center;box-sizing:content-box}.oi.oi-align-center:before{text-align:center}.oi.oi-align-left:before{text-align:left}.oi.oi-align-right:before{text-align:right}.oi.oi-flip-horizontal:before{-webkit-transform:scale(-1,1);-ms-transform:scale(-1,1);transform:scale(-1,1)}.oi.oi-flip-vertical:before{-webkit-transform:scale(1,-1);-ms-transform:scale(-1,1);transform:scale(1,-1)}.oi.oi-flip-horizontal-vertical:before{-webkit-transform:scale(-1,-1);-ms-transform:scale(-1,1);transform:scale(-1,-1)}.oi-account-login:before{content:'\e000'}.oi-account-logout:before{content:'\e001'}.oi-action-redo:before{content:'\e002'}.oi-action-undo:before{content:'\e003'}.oi-align-center:before{content:'\e004'}.oi-align-left:before{content:'\e005'}.oi-align-right:before{content:'\e006'}.oi-aperture:before{content:'\e007'}.oi-arrow-bottom:before{content:'\e008'}.oi-arrow-circle-bottom:before{content:'\e009'}.oi-arrow-circle-left:before{content:'\e00a'}.oi-arrow-circle-right:before{content:'\e00b'}.oi-arrow-circle-top:before{content:'\e00c'}.oi-arrow-left:before{content:'\e00d'}.oi-arrow-right:before{content:'\e00e'}.oi-arrow-thick-bottom:before{content:'\e00f'}.oi-arrow-thick-left:before{content:'\e010'}.oi-arrow-thick-right:before{content:'\e011'}.oi-arrow-thick-top:before{content:'\e012'}.oi-arrow-top:before{content:'\e013'}.oi-audio-spectrum:before{content:'\e014'}.oi-audio:before{content:'\e015'}.oi-badge:before{content:'\e016'}.oi-ban:before{content:'\e017'}.oi-bar-chart:before{content:'\e018'}.oi-basket:before{content:'\e019'}.oi-battery-empty:before{content:'\e01a'}.oi-battery-full:before{content:'\e01b'}.oi-beaker:before{content:'\e01c'}.oi-bell:before{content:'\e01d'}.oi-bluetooth:before{content:'\e01e'}.oi-bold:before{content:'\e01f'}.oi-bolt:before{content:'\e020'}.oi-book:before{content:'\e021'}.oi-bookmark:before{content:'\e022'}.oi-box:before{content:'\e023'}.oi-briefcase:before{content:'\e024'}.oi-british-pound:before{content:'\e025'}.oi-browser:before{content:'\e026'}.oi-brush:before{content:'\e027'}.oi-bug:before{content:'\e028'}.oi-bullhorn:before{content:'\e029'}.oi-calculator:before{content:'\e02a'}.oi-calendar:before{content:'\e02b'}.oi-camera-slr:before{content:'\e02c'}.oi-caret-bottom:before{content:'\e02d'}.oi-caret-left:before{content:'\e02e'}.oi-caret-right:before{content:'\e02f'}.oi-caret-top:before{content:'\e030'}.oi-cart:before{content:'\e031'}.oi-chat:before{content:'\e032'}.oi-check:before{content:'\e033'}.oi-chevron-bottom:before{content:'\e034'}.oi-chevron-left:before{content:'\e035'}.oi-chevron-right:before{content:'\e036'}.oi-chevron-top:before{content:'\e037'}.oi-circle-check:before{content:'\e038'}.oi-circle-x:before{content:'\e039'}.oi-clipboard:before{content:'\e03a'}.oi-clock:before{content:'\e03b'}.oi-cloud-download:before{content:'\e03c'}.oi-cloud-upload:before{content:'\e03d'}.oi-cloud:before{content:'\e03e'}.oi-cloudy:before{content:'\e03f'}.oi-code:before{content:'\e040'}.oi-cog:before{content:'\e041'}.oi-collapse-down:before{content:'\e042'}.oi-collapse-left:before{content:'\e043'}.oi-collapse-right:before{content:'\e044'}.oi-collapse-up:before{content:'\e045'}.oi-command:before{content:'\e046'}.oi-comment-square:before{content:'\e047'}.oi-compass:before{content:'\e048'}.oi-contrast:before{content:'\e049'}.oi-copywriting:before{content:'\e04a'}.oi-credit-card:before{content:'\e04b'}.oi-crop:before{content:'\e04c'}.oi-dashboard:before{content:'\e04d'}.oi-data-transfer-download:before{content:'\e04e'}.oi-data-transfer-upload:before{content:'\e04f'}.oi-delete:before{content:'\e050'}.oi-dial:before{content:'\e051'}.oi-document:before{content:'\e052'}.oi-dollar:before{content:'\e053'}.oi-double-quote-sans-left:before{content:'\e054'}.oi-double-quote-sans-right:before{content:'\e055'}.oi-double-quote-serif-left:before{content:'\e056'}.oi-double-quote-serif-right:before{content:'\e057'}.oi-droplet:before{content:'\e058'}.oi-eject:before{content:'\e059'}.oi-elevator:before{content:'\e05a'}.oi-ellipses:before{content:'\e05b'}.oi-envelope-closed:before{content:'\e05c'}.oi-envelope-open:before{content:'\e05d'}.oi-euro:before{content:'\e05e'}.oi-excerpt:before{content:'\e05f'}.oi-expand-down:before{content:'\e060'}.oi-expand-left:before{content:'\e061'}.oi-expand-right:before{content:'\e062'}.oi-expand-up:before{content:'\e063'}.oi-external-link:before{content:'\e064'}.oi-eye:before{content:'\e065'}.oi-eyedropper:before{content:'\e066'}.oi-file:before{content:'\e067'}.oi-fire:before{content:'\e068'}.oi-flag:before{content:'\e069'}.oi-flash:before{content:'\e06a'}.oi-folder:before{content:'\e06b'}.oi-fork:before{content:'\e06c'}.oi-fullscreen-enter:before{content:'\e06d'}.oi-fullscreen-exit:before{content:'\e06e'}.oi-globe:before{content:'\e06f'}.oi-graph:before{content:'\e070'}.oi-grid-four-up:before{content:'\e071'}.oi-grid-three-up:before{content:'\e072'}.oi-grid-two-up:before{content:'\e073'}.oi-hard-drive:before{content:'\e074'}.oi-header:before{content:'\e075'}.oi-headphones:before{content:'\e076'}.oi-heart:before{content:'\e077'}.oi-home:before{content:'\e078'}.oi-image:before{content:'\e079'}.oi-inbox:before{content:'\e07a'}.oi-infinity:before{content:'\e07b'}.oi-info:before{content:'\e07c'}.oi-italic:before{content:'\e07d'}.oi-justify-center:before{content:'\e07e'}.oi-justify-left:before{content:'\e07f'}.oi-justify-right:before{content:'\e080'}.oi-key:before{content:'\e081'}.oi-laptop:before{content:'\e082'}.oi-layers:before{content:'\e083'}.oi-lightbulb:before{content:'\e084'}.oi-link-broken:before{content:'\e085'}.oi-link-intact:before{content:'\e086'}.oi-list-rich:before{content:'\e087'}.oi-list:before{content:'\e088'}.oi-location:before{content:'\e089'}.oi-lock-locked:before{content:'\e08a'}.oi-lock-unlocked:before{content:'\e08b'}.oi-loop-circular:before{content:'\e08c'}.oi-loop-square:before{content:'\e08d'}.oi-loop:before{content:'\e08e'}.oi-magnifying-glass:before{content:'\e08f'}.oi-map-marker:before{content:'\e090'}.oi-map:before{content:'\e091'}.oi-media-pause:before{content:'\e092'}.oi-media-play:before{content:'\e093'}.oi-media-record:before{content:'\e094'}.oi-media-skip-backward:before{content:'\e095'}.oi-media-skip-forward:before{content:'\e096'}.oi-media-step-backward:before{content:'\e097'}.oi-media-step-forward:before{content:'\e098'}.oi-media-stop:before{content:'\e099'}.oi-medical-cross:before{content:'\e09a'}.oi-menu:before{content:'\e09b'}.oi-microphone:before{content:'\e09c'}.oi-minus:before{content:'\e09d'}.oi-monitor:before{content:'\e09e'}.oi-moon:before{content:'\e09f'}.oi-move:before{content:'\e0a0'}.oi-musical-note:before{content:'\e0a1'}.oi-paperclip:before{content:'\e0a2'}.oi-pencil:before{content:'\e0a3'}.oi-people:before{content:'\e0a4'}.oi-person:before{content:'\e0a5'}.oi-phone:before{content:'\e0a6'}.oi-pie-chart:before{content:'\e0a7'}.oi-pin:before{content:'\e0a8'}.oi-play-circle:before{content:'\e0a9'}.oi-plus:before{content:'\e0aa'}.oi-power-standby:before{content:'\e0ab'}.oi-print:before{content:'\e0ac'}.oi-project:before{content:'\e0ad'}.oi-pulse:before{content:'\e0ae'}.oi-puzzle-piece:before{content:'\e0af'}.oi-question-mark:before{content:'\e0b0'}.oi-rain:before{content:'\e0b1'}.oi-random:before{content:'\e0b2'}.oi-reload:before{content:'\e0b3'}.oi-resize-both:before{content:'\e0b4'}.oi-resize-height:before{content:'\e0b5'}.oi-resize-width:before{content:'\e0b6'}.oi-rss-alt:before{content:'\e0b7'}.oi-rss:before{content:'\e0b8'}.oi-script:before{content:'\e0b9'}.oi-share-boxed:before{content:'\e0ba'}.oi-share:before{content:'\e0bb'}.oi-shield:before{content:'\e0bc'}.oi-signal:before{content:'\e0bd'}.oi-signpost:before{content:'\e0be'}.oi-sort-ascending:before{content:'\e0bf'}.oi-sort-descending:before{content:'\e0c0'}.oi-spreadsheet:before{content:'\e0c1'}.oi-star:before{content:'\e0c2'}.oi-sun:before{content:'\e0c3'}.oi-tablet:before{content:'\e0c4'}.oi-tag:before{content:'\e0c5'}.oi-tags:before{content:'\e0c6'}.oi-target:before{content:'\e0c7'}.oi-task:before{content:'\e0c8'}.oi-terminal:before{content:'\e0c9'}.oi-text:before{content:'\e0ca'}.oi-thumb-down:before{content:'\e0cb'}.oi-thumb-up:before{content:'\e0cc'}.oi-timer:before{content:'\e0cd'}.oi-transfer:before{content:'\e0ce'}.oi-trash:before{content:'\e0cf'}.oi-underline:before{content:'\e0d0'}.oi-vertical-align-bottom:before{content:'\e0d1'}.oi-vertical-align-center:before{content:'\e0d2'}.oi-vertical-align-top:before{content:'\e0d3'}.oi-video:before{content:'\e0d4'}.oi-volume-high:before{content:'\e0d5'}.oi-volume-low:before{content:'\e0d6'}.oi-volume-off:before{content:'\e0d7'}.oi-warning:before{content:'\e0d8'}.oi-wifi:before{content:'\e0d9'}.oi-wrench:before{content:'\e0da'}.oi-x:before{content:'\e0db'}.oi-yen:before{content:'\e0dc'}.oi-zoom-in:before{content:'\e0dd'}.oi-zoom-out:before{content:'\e0de'}



</style>

<section>
	<div class="container">
		
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Andrea - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight">
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li class="colorlib-active"><a href="index.html">Home</a></li>
					<li><a href="fashion.html">Fashion</a></li>
					<li><a href="travel.html">Travel</a></li>
					<li><a href="about.html">About</a></li>
					<li><a href="contact.html">Contact</a></li>
				</ul>
			</nav>

			
		</aside> <!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">
	    	<div class="container">
	    		<div class="row d-flex">
	    			<div class="col-xl-8 py-5 px-md-5">
	    				<div class="row pt-md-4">
			    			
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="single.html" class="img img-2" style="background-image: url(images/image_10.jpg);"></a>
										<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">You Can't Blame Gravity for Falling in Love</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span><i class="icon-calendar mr-2"></i>June 28, 2019</span>
				              		<span><a href="single.html"><i class="icon-folder-o mr-2"></i>Travel</a></span>
				              		<span><i class="icon-comment2 mr-2"></i>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				              <p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
				            </div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="single.html" class="img img-2" style="background-image: url(images/image_11.jpg);"></a>
										<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">You Can't Blame Gravity for Falling in Love</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span><i class="icon-calendar mr-2"></i>June 28, 2019</span>
				              		<span><a href="single.html"><i class="icon-folder-o mr-2"></i>Travel</a></span>
				              		<span><i class="icon-comment2 mr-2"></i>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				              <p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
				            </div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a href="single.html" class="img img-2" style="background-image: url(images/image_12.jpg);"></a>
										<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">You Can't Blame Gravity for Falling in Love</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span><i class="icon-calendar mr-2"></i>June 28, 2019</span>
				              		<span><a href="single.html"><i class="icon-folder-o mr-2"></i>Travel</a></span>
				              		<span><i class="icon-comment2 mr-2"></i>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				              <p><a href="#" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
				            </div>
									</div>
								</div>
			    		</div><!-- END-->
			    		<div class="row">
			          <div class="col">
			            <div class="block-20">
			              <ul>
			                <li><a href="#">&lt;</a></li>
			                <li class="active"><span>1</span></li>
			                <li><a href="#">2</a></li>
			                <li><a href="#">3</a></li>
			                <li><a href="#">4</a></li>
			                <li><a href="#">5</a></li>
			                <li><a href="#">&gt;</a></li>
			              </ul>
			            </div>
			          </div>
			        </div>
			    	</div>
	    			<div class="col-xl-4 sidebar ftco-animate bg-light pt-5">
	            <div class="sidebar-box pt-md-4">
	              <form action="#" class="search-form">
	                <div class="form-group">
	                  <span class="icon icon-search"></span>
	                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
	                </div>
	              </form>
	            </div>
	            

	            <div class="sidebar-box ftco-animate">
	              <h3 class="sidebar-heading">Popular</h3>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">축제 제목1</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> June 28, 2019</a></div>
	                    <div><a href="#"><span class="icon-person"></span> 조회수</a></div>
	                    
	                  </div>
	                </div>
	              </div>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">축제 제목2</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> June 28, 2019</a></div>
	                    <div><a href="#"><span class="icon-person"></span> 조회수 </a></div>
	             
	                  </div>
	                </div>
	              </div>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">축제 제목3</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> June 28, 2019</a></div>
	                    <div><a href="#"><span class="icon-person"></span>조회수</a></div>
	                   
	                  </div>
	                </div>
	              </div>
	            </div>

	            <div class="sidebar-box ftco-animate">
	              <h3 class="sidebar-heading">Tag Cloud</h3>
	              <ul class="tagcloud">
	                <a href="#" class="tag-cloud-link">animals</a>
	                <a href="#" class="tag-cloud-link">human</a>
	                <a href="#" class="tag-cloud-link">people</a>
	                <a href="#" class="tag-cloud-link">cat</a>
	                <a href="#" class="tag-cloud-link">dog</a>
	                <a href="#" class="tag-cloud-link">nature</a>
	                <a href="#" class="tag-cloud-link">leaves</a>
	                <a href="#" class="tag-cloud-link">food</a>
	              </ul>
	            </div>

	            <div class="sidebar-box ftco-animate">
	              <h3 class="sidebar-heading">Paragraph</h3>
	              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut.</p>
	            </div>
	          </div><!-- END COL -->
	    		</div>
	    	</div>
	    </section>
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  </body>
</html>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />