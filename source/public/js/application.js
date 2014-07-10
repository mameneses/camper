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
