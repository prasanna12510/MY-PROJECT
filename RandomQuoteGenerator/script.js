/*jslint browser: true plusplus: true*/
/*global $, jQuery, alert, console*/

$(document).ready(function () {
  "use strict";
  var tweetQuote,
    $quote = $('#quote'),
    $author = $('#author'),
    $tweet = $("#tweet"),
    $generate = $('#generate'),
    $currentQuote = $('.currentQuote'),
    quoteArr = [];
  
  function quoteArrUpdate(data) {
    quoteArr.push(data);
    
    if (quoteArr.length > 5) {
      quoteArr.shift();
    }
    
    $('.quoteHistory p').remove();
    var i = 0;
    for (i; i < quoteArr.length; i++) {
      $('.quoteHistory').prepend('<p>' + quoteArr[i] + '</p>');
    }
  }
  
  function tweetFixer(text) {
    if (text.length > 115) {
      text = text.slice(0, 115 - 3);
      text += "...";
    }
    tweetQuote = encodeURIComponent(text);
    $tweet.attr("href", "https://twitter.com/intent/tweet?text=" + tweetQuote + " - http://wulkan.me");
  }
  
  
  function getQuote() {
    
    $.ajax({
      jsonp: "jsonp",
      dataType: "jsonp",
      url: 'http://api.forismatic.com/api/1.0/',
      contentType: 'application/jsonp',
      data: {
        lang: "en",
        method: "getQuote",
        format: "jsonp"
      },
      success: function (data) {
        
        // Adds a fade in/out effect on the quote text
        $currentQuote.fadeOut(150, function () {
          $quote.text(data.quoteText);
        
        // Displays 'Unknown' as the author if it's empty.
          if (data.quoteAuthor === "") {
            $author.text('~ Unknown ~');
          } else {
            $author.text('~ ' + data.quoteAuthor + ' ~');
          }
        }).fadeIn(150);
        
        // Encode URI to allow special characters.
        tweetFixer(data.quoteText);
        
        // Update quote array history
        quoteArrUpdate(data.quoteText);
        
      },
      error: function (data) {
        $quote.text("Error Loading Quote");
        $author.text('~ Sorry ~');
      }
    });
  }
  
  
  $generate.click(function () {
    getQuote().fadeIn('slow');
  });
});