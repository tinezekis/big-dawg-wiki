












// $(document).ready(function() {
// //Controller***********
// widget = new MarkdownWidget($("#user-generated-content"), $("#preview"));


// //MODEL**************
// // function MarkdownModel(){
//   // this.markdownHash = {
//   //   '_': function(string) {
//   //     return "<i>" + string.replace(/_/g, "") + "</i>"
//   //   },

//   // };
// // }

// function MarkdownWidget(input, output) {
//   this.$input = input;
//   this.$output = output;
// }

// MarkdownWidget.prototype.markdownParcer = function(input) {
//   var index = 0;
//   // this.$output.text("");
//   input = input.replace(/\*{2}/g, function(){
//     index++;
//     return (index % 2 === 1 ) ? "<strong>" : "</strong>" ;
//   });
//   var index = 0;
//   input = input.replace(/\*{1}/g, function(){
//     index++;
//     return (index % 2 === 1 ) ? "<em>" : "</em>" ;
//   });
//   var index = 0;
//   input = input.replace(/\_{1}/g, function(){
//     index++;
//     return (index % 2 === 1 ) ? "<em>" : "</em>" ;
//   });
//   var index = 0;
//   input = input.replace(/\n{1}/g, "<br>");
//   $(this.$output).append(input);

//   // widget.convertDoubles(this.$input.val());
//   // widget.convertSingles(this.$input.val());
//   // var strings = input.trim().replace(/\n/g, "<br>")
//   //for loop that goes through the whole textarea and strings[i] check string for mark down
//   //then if marked down  markdown hash(string[0])
//   // take converted hash(string)
//   // If **....**, replace first ** with <strong> and second ** with </strong>
//   // If *.....*, replace first * with <em> and second * with </em>

//   // If _....._, replace first _ with <em> and second _ with </em>

//   }

// MarkdownWidget.prototype.convert = function(input) {
//   $(this.$output).append(input);
//   console.log($(this.$output));
// };
//  MarkdownWidget.prototype.convertSingles = function(input) {
//   console.log($(this.$output));

// };



//   // console.log(input.match(/_/g).length);
//   // widget.convertUnderscores(input);
//   // If \n, replace \n with <br>

//   // Display content of textarea


// MarkdownWidget.prototype.updateInput = function() {
//   this.$output.text("");
//   widget.markdownParcer(this.$input.val());
// }

// MarkdownWidget.prototype.convertUnderscores = function(string) {
//   var underscores = string.match(/_/g);
//   // var count = underscores.length;
//   // if (count % 2 === 1) {
//   //   // pop last _ off of regex array
//   // }
//   // convert
//   // each if index of regex array is even, replace with <em>
//   // each if index of regex array is odd, replace with </em>

// }

// $("#source").on("keyup", function() {
//   widget.updateInput();
//   });
// });