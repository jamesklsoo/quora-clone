$(document).ready(function() {
  $('.signup-button').click(function() {
    $('.signup').fadeToggle('slow');
  });

  $('.login-button').click(function() {
    $('.login').fadeToggle('slow');
  });

  $('.cancel-button').click(function() {
    $('.signup').hide('slow');
    $('.login').hide('slow');
  });

  $('.input-bar').click(function() {
    $('.blur-page').fadeIn('slow');
  });

  $('.blur-page').click(function() {
    $('.blur-page').fadeOut('slow');
  });

  $('.badge').click(function () {
    $('.badge').fadeOut('slow');
  });

  $('.vote-form').on('submit',function(event) {
    var form = $(this);
    var upcount = $('.upvote-container', this);
    var downcount = $('.downvote-container', this);
    event.preventDefault();
    var input = $(this).serialize();
    $.ajax ({

      type: 'POST',
      url: '/question_vote',
      data: input,
      dataType: "json",
      success: function(msg) {
      upcount.html(msg.upvote_count);
      downcount.html(msg.downvote_count);
        }
    });
  });

  $('.answer-vote-form').on('submit',function(event) {
    var form = $(this);
    var upcount = $('.answer-upvote-container', this);
    var downcount = $('.answer-downvote-container', this);
    event.preventDefault();
    var input = $(this).serialize();
    $.ajax ({

      type: 'POST',
      url: '/answer_vote',
      data: input,
      dataType: "json",
      success: function(msg) {
      upcount.html(msg.upvote_count);
      downcount.html(msg.downvote_count);
        }
    });
  });


});