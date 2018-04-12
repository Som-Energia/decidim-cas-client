$(function(){
  var locale = $(document.documentElement).attr("lang") || "es";
  $("a[href*='/users/sign_in']").attr('href', '/users/cas/sign_in?locale='+locale);
  $("a[href*='/users/sign_up']").attr('href', '/users/cas/sign_in?locale='+locale);
  $("a[href*='/users/sign_out']").attr('href', '/users/cas/sign_out?locale='+locale);
});
