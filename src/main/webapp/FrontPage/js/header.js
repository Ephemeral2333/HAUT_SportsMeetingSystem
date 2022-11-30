$(function () {
    $('.firstli').mouseenter(function () {
        $(this).addClass('current');
        $(this).children('.sub-ul').show();
    }).mouseleave(function () {
        $(this).removeClass('current');
        $(this).children('.sub-ul').hide();
    })
    $('.nav ul li .firstli .sub-ul li').mouseenter(function () {
        $(this).addClass('subcurrent');
    }).mouseleave(function () {
        $(this).removeClass('subcurrent')
    })
});