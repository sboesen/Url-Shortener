<% if @redirection.new_record? %>
$('.messages').html("<br /><br /><h3>Invalid url.</h3>");
$('.messages').show();
<% else %>
console.log("didn't fail to create")
var html = "<br /><br />"
html += '<h3>Shortened:</h3><input type="text" value="<%= @root_url.to_s + @redirection.path %>">' + "</input><br /><br /><br /><br />"
$('.messages').html(html);
$('.messages input').focus();
$('.messages').slideDown(500);
<% end %>