$(document).ready(function() {
  var widget = new MarkdownWidget($("#user-generated-content"), $("#preview-markdown"));
  $("#user-generated-content").on("keyup", function(event) {
    $("#preview-markdown").html('')
    var markdown_content = widget.markdownParcer($("#user-generated-content").val());
    $("#preview-markdown").append(markdown_content);
  });
});

function MarkdownWidget(input, output) {
  this.$input = input;
  this.$output = output;
};

MarkdownWidget.prototype.markdownParcer = function(input) {
  var output = input;
  // Get bold function
  var index = output.indexOf("*");
  var counter = 1;
  while (index !== -1) {
    if (counter % 2 === 1) {
      output = output.replace("*", "<strong>");
    } else {
      output = output.replace("*", "</strong>");
    }
    counter += 1;
    index = output.indexOf("*");
  }
  // Get italics function
  index = output.indexOf("_");
  counter = 1;
  while (index !== -1) {
    if (counter % 2 === 1) {
      output = output.replace("_", "<em>");
    } else {
      output = output.replace("_", "</em>");
    }
    counter += 1;
    index = output.indexOf("_");
  }

  var title = output.match(/\#.+\n/);
  counter = 1;
  while (title) {
    var start_index = output.indexOf("#");
    var length = title[0].length;
    var end_index = start_index + length - 1;
    output = replaceAt(end_index, "</h3>", output);
    output = replaceAt(start_index, "<h3>", output);
    counter += 1;
    title = output.match(/\#.+\n/);
    return output;
  }

  index = output.indexOf("\n");
  while (index !== -1) {
    output = output.replace("\n", "<br>");
    index = output.indexOf("\n");
  }
  return output;
};

function replaceAt(index, replacement, str) {
  return str[0, index] + replacement + str[(index+1), -1];
};
