$ ->
  $('.edit-task-link').click (e) ->
    e.preventDefault();
    $(this).hide();
    task_id = $(this).data('taskId')
    $('form#edit-task-' + task_id).show();

