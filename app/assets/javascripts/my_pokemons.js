$(document).on('turbolinks:load', function() {
  $('.my_pokemon_delete').change(function() {
    var checked = false;
    $('.my_pokemon_delete').each(function() {
      if ( $(this).is(':checked') ) {
        checked = true;
      }
    });
    if ( checked ) {
      $('#my_pokemon_delete_button').prop('disabled', false);
    } else {
      $('#my_pokemon_delete_button').prop('disabled', true);
    }
  });
});
