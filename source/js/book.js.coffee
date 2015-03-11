$(document).ready ->
  $('.toggle-sidebar').click ->
    $('.book').toggleClass('sidebar-open')
    if $('.book').hasClass('sidebar-open')
      $(this).css('left', $('.sidebar').width() + 'px')
    else
      $(this).css('left', '0px')
