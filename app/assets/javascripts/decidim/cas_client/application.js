$(function(){
  bindCasClientRoutes();
});

function bindCasClientRoutes(){
  var locale = $(document.documentElement).attr("lang") || "es";

  $(document).on("click","a[href*='/users/sign_in'], a[href*='/users/sign_up']", function(e){
    e.preventDefault();
    window.location.href = '/users/cas/sign_in?locale='+locale;
  });
  $("a[href*='/users/sign_out']").attr('href', '/users/cas/sign_out?locale='+locale);
}
