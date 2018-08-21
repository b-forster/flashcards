$( document ).ready(function() {
  highlightRowEvent();
  updateSelectedCardEvent();
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
    $selectedRow = $(this);

    $selectedCardId = $selectedRow.find('.card-id-field').val()

    // Get selected card's edit form
    $cardRequest = $.ajax({
      method: 'GET',
      url: 'cards/' + $selectedCardId + '/edit'
    })

    // Update partial with edit form
    $cardRequest.done(function(response){
      $('#edit-delete-selected-card-form').html(response);
    });
    
  });
}