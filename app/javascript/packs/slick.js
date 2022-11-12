$(function() {
  $('.slider').slick({
    prevArrow: '<i class="fa-solid fa-chevron-left"></i>',
    nextArrow: '<i class="fa-solid fa-chevron-right"></i>',
    asNavFor:'.thumb',
    //variableWidth: true,
  });
  $('.thumb').slick({
    arrows: false,
    asNavFor:'.slider',
    focusOnSelect: true,
    slidesToShow:3,
    slidesToScroll:1
  });
});