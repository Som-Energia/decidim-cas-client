$(function(){
  bindCasClientRoutes();
});

function bindCasClientRoutes(){
  var locale = $(document.documentElement).attr("lang") || "es";

  $(document).on("click","a[href*='/users/sign_in'], a[href*='/users/sign_up']", function(e){
    e.preventDefault();
    window.location.href = '/users/cas/sign_in?locale='+locale;
  });
  $(document).on("click","a[href*='/users/sign_out']", function(e){
    e.preventDefault();
    window.location.href = '/users/cas/sign_out?locale='+locale;
  });
}
