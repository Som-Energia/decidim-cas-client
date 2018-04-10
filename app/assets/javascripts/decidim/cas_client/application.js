$(function(){
  var locale = $(document.documentElement).attr("lang") || "es";
  $(".sign-in-link").attr('href', '/users/cas/sign_in?locale='+locale);
  $(".sign-out-link").attr('href', '/users/cas/sign_out?locale='+locale);
});
