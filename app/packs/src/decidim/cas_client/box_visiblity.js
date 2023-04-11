const changeVisibilityLoginBox = () => {
  var element = $('.login__box');
  var display = element.css('display') == 'block' ? 'none' : 'block';
  element.css('display', display);
};
