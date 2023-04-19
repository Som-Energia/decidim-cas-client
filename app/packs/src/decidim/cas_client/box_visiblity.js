window.changeVisibilityLoginBox = () => {
  var element = document.querySelector('.login__box');
  var display = element.style.display == 'block' ? 'none' : 'block';
  element.style.display = display;
};