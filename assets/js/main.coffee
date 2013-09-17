$ ->
  impress().init()
  impress().goto( document.querySelector(".active"), 500 ) # force a window resize to prevent rendering issues on phones
  $(".day").click ->
    $(this).children(".description").slideToggle 200
  
  $('.dropdown-toggle').dropdown()
  
  window.App = {} 
  App.quiz = []
  
  App.get_answer = ->
    result =
      a: 0
      b: 0
      c: 0
    for i in App.quiz
      switch i
        when 'a'
          result.a += 1
        when 'b'
          result.b += 1
        when 'c'
          result.c += 1
    
    max = -Infinity
    x = undefined
    choice = undefined
    for x of result
      if result[x] > max
        max = result[x]
        choice = x
    window.location.hash = "#result-" + choice