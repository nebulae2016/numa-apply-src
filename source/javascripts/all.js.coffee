#= require 'jquery'
#= require 'bootstrap/transition'
#= require 'bootstrap/dropdown.js'
#= require 'bootstrap/affix.js'
#= require 'bootstrap/collapse.js'
#= require 'jquery.countdown'

# ---
# jQuery to collapse the navbar on scroll
# ---

$(window).scroll ->
  if $('.navbar').offset().top > 65
    $('.navbar-fixed-top').addClass 'top-nav-collapse'
  else
    $('.navbar-fixed-top').removeClass 'top-nav-collapse'
  return

# ---
# this smoothscrolls the page
# ---

$ ->
  $('a[href*=#]:not([href=#])').click ->
    if location.pathname.replace(/^\//, '') == @pathname.replace(/^\//, '') and location.hostname == @hostname
      target = $(@hash)
      target = if target.length then target else $('[name=' + @hash.slice(1) + ']')
      if target.length
        $('html,body').animate { scrollTop: target.offset().top-50 }, 200
        return false
    return
  return
# ---

$(document).ready ->
  $('#play-video').on 'click', (ev) ->
    $('#videocontainer iframe')[0].src += '&autoplay=1'
    ev.preventDefault()
    $(this).addClass('hide')
    return
  return

# ---
# generated by js2coffee 2.2.0

$ ->
  $('ul.inc li').click ->
      acc = $(this).attr('class')
      if $('.point').hasClass(acc)
        $('.le-mapcontainer').toggleClass(acc)
      else
        alert('wowi')
    return
  return
$ ->
  $('.navbar-collapse ul li a').click ->
    $('.navbar-toggle:visible').click()
    return

  $('.showmore').click ->
    # $(this).toggleClass('extend')
    $(this).parent().toggleClass('extend')
  return
return
