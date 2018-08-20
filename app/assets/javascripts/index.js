$( document ).ready(function() {
  highlightRow();
});

function highlightRow(){
  // Highlight first table row by default
  $('.card-row').first().addClass('highlighted')

  // Move highlight to new table row when clicked
  $('.card-row').on('click', function(){
    $('.highlighted').removeClass('highlighted');
    $(this).addClass('highlighted');
  });
}