$( document ).ready(function() {
  highlightRowEvent();
  updateSelectedCardEvent();
  displayDeckSettingsEvent();
  displayAnswerEvent();
  updateRemainingCardsEvent();
});

function highlightRowEvent(){
  // Highlight first table row by default
  $('.card-row').first().addClass('highlighted')

  // Move highlight to new table row when clicked
  $('.card-row').on('click', function(){
    $('.highlighted').removeClass('highlighted');
    $(this).addClass('highlighted');
  });
}

function updateSelectedCardEvent(){
  $('.card-row').on('click', function(){
    // Get ID for selected card
    var $selectedRow = $(this);

    var $selectedCardId = $selectedRow.find('.card-id-field').val()

    // Get selected card's edit form
    var $cardRequest = $.ajax({
      method: 'GET',
      url: 'cards/' + $selectedCardId + '/edit'
    })

    // Update partial with edit form
    $cardRequest.done(function(response){
      $('#edit-delete-selected-card-form').html(response);
    });
    
  });
}

function displayDeckSettingsEvent(){
  // Make overlay hidden by default
  $('.edit-delete-options-overlay').hide();

  // Make overlay visible when settings button is clicked
  $('.edit-delete-options-btn').on('click', function(){
    $('.edit-delete-options-overlay').hide();
    $(this).parent().find('.edit-delete-options-overlay').show();
  })
}

// When Show Answer button is clicked, hide button and show card back
function displayAnswerEvent(){
  $('.card-back').hide();
  $('.difficulty-btn-row').hide();

  $('#show-answer-btn').on('click', function(){
    $('.show-answer-btn-row').hide();
    $('.card-back').show();
    $('.difficulty-btn-row').show();
  });
}

function updateRemainingCardsEvent(){
  $('#correct-answer-btn').on('click', function(){
    var cardId = ($(this).val())

    $deleteCardRequest = $.ajax({
      url: '/correct_answer/' + cardId,
      method: 'GET'
    });

    $deleteCardRequest.done(function(response){
      $('.card-review').replaceWith(response)
    })
  });
}