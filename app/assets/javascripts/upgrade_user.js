$(document).ready(function(){
  $("body").on("click", ".upgrade_user", function(){
    event.preventDefault();
    target =  $(event.target)
    url =target.attr("href");
    var request = $.ajax({
      url: url,
      method: "PATCH"
    });

    request.done(function(response){
      // debugger;
      var new_content =  "<td>"+response.username+"</td> <td>" + response.permission_level + "</td><td></td>"
      target.closest("tr").html(new_content);
    });
  });
});