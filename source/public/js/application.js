$(document).ready(function() {
  bindEvents();

  function bindEvents() {
    $(document).on('click', '.add_fav', function(e) {
      e.preventDefault()
      addFav(e.target, this)
   })
  }

function addFav(title, todourl) {
  var ajaxrequest = $.ajax({
    url: todourl,
    type: 'post',
    data: title
  })
  ajaxrequest.success(newTodo)
}

function newTodo(data) {
  $('.todo_list').append(data.html)
}

});
