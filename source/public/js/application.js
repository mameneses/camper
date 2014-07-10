$(document).ready(function() {
  bindEvents();

  function bindEvents() {
    $(document).on('submit', '.add_fav', function(e) {
      e.preventDefault()
      var addurl = this.action
      var park_id = this.park_num.value
      addFav(park_id, addurl)
      // debugger
   })
      $(document).on('click', '.remove', function(e) {
      e.preventDefault()
      deleteTodo(e.target)
   })
  }

function deleteTodo(target){
    var target = target
    var urlDelete = target.href
    var ajaxrequest = $.ajax({
      url: urlDelete,
      type: 'post'
    })
    ajaxrequest.success(takeout)
  }

function takeout(data) {
  $("div[name='" + data['park_id'] + "']").remove()
}

function addFav(park_id, addurl){
  var ajaxrequest = $.ajax({
    url: addurl,
    type: 'post',
    data: {park_num: park_id}
  })
  ajaxrequest.success(chngAddButton)
}

function chngAddButton(data) {
  $("input[value='" + data['park_id'] +"']").siblings().first().val("Favorited!")
}

});
