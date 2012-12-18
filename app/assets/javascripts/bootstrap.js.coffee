jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()


  # Hide contents
  $('.task_content_container').hide()
  $('.new_task_container').hide()

  # Resize contents
  $('.task_container').height('auto ')

  # Expand contents
  #  Expand All tasks
  $('.expand_all_btn').click ->
    $('.task_content_container').slideToggle()

  #  Expand a task
  $('.task_header').click ->
    $(this).parent().toggleClass('task_container_expanded')
    $(this).siblings('.task_content_container').slideToggle()
    #$(this).parent().toggleClass('box-shadow')

  $('.new_task_btn').click ->
    $('.new_task_container').slideToggle()

  $('.cancel_new_task').click ->
    $('.new_task_container').slideUp()

  #Autocomplete task name
  $('#task_name').autocomplete
    source: $('#task_name').data('autocomplete-source')