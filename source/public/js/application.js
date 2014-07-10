$(document).ready(function() {
  bindEvents();

  function bindEvents() {
    $(document).on('click', '.add_fav', function(e) {
      e.preventDefault()
      var addurl = this.action
      addFav(e.target, addurl)
   })
  }

function addFav(session_id, addurl) {
  var ajaxrequest = $.ajax({
    url: addurl,
    type: 'get',
  })
}

});
