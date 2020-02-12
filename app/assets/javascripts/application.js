// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap
//= require_tree .

// my_pokemon_form autocomplete
$(function() {
  $("#my_pokemon_form_name").autocomplete({
    autoFocus: true,
    source: "/my_pokemons/auto_complete_name.json"
  });

  $("#my_pokemon_form_ability").autocomplete({
    autoFocus: true,
    minLength: 0,
    source: function(request, response) {
      $.ajax({
        url: "/my_pokemons/auto_complete_ability.json",
        dataType: "json",
        type: "POST",
        data: { pokemon_name: $("#my_pokemon_form_name").val() },
        success: function( data ) {
          response(data);
        }
      });
    }
  }).focus(function() {
    jQuery(this).autocomplete("search", "");
  });

  $("#my_pokemon_form_item").autocomplete({
    autoFocus: true,
    minLength: 0,
    source: "/my_pokemons/auto_complete_item.json"
  }).focus(function() {
    jQuery(this).autocomplete("search", "");
  });

  $("#my_pokemon_form_ev_h, #my_pokemon_form_ev_a, #my_pokemon_form_ev_b, #my_pokemon_form_ev_c, #my_pokemon_form_ev_d, #my_pokemon_form_ev_s").autocomplete({
    autoFocus: true,
    minLength: 0,
    source: ["252", "4"]
  }).focus(function() {
    jQuery(this).autocomplete("search", "");
  });

  $("#my_pokemon_form_move_1, #my_pokemon_form_move_2, #my_pokemon_form_move_3, #my_pokemon_form_move_4").autocomplete({
    autoFocus: true,
    minLength: 1,
    source: "/my_pokemons/auto_complete_move.json"
  }).focus(function() {
    jQuery(this).autocomplete("search", "");
  });

  $("#my_pokemon_form_role").autocomplete({
    autoFocus: true,
    minLength: 0,
    source: "/my_pokemons/auto_complete_role.json"
  }).focus(function() {
    jQuery(this).autocomplete("search", "");
  });
});

// my_pokemon_form ability 入力不可設定
$(function() {
  if ($("#my_pokemon_form_name").val().length == 0) {
    $("#my_pokemon_form_ability").prop("disabled", true);
  }
  $("#my_pokemon_form_name").on("keydown keyup keypress change", function() {
    if ($(this).val().length == 0) {
      $("#my_pokemon_form_ability").prop("disabled", true);
      $("#my_pokemon_form_ability").val("");
    } else {
      $("#my_pokemon_form_ability").prop("disabled", false);
    }
  });
});

// my_pokemon_form move 入力不可設定
$(function() {
  var $move_1 = $("#my_pokemon_form_move_1")
  var $move_2 = $("#my_pokemon_form_move_2")
  var $move_3 = $("#my_pokemon_form_move_3")
  var $move_4 = $("#my_pokemon_form_move_4")
  if ($move_1.val().length == 0) {
    $move_2.prop("disabled", true);
    $move_3.prop("disabled", true);
    $move_4.prop("disabled", true);
  }
  $($move_1).on("keydown keyup keypress change", function() {
    if ($(this).val().length == 0) {
      $move_2.prop("disabled", true);
      $move_2.val("");
    } else {
      $move_2.prop("disabled", false);
    }
  });
  $($move_2).on("keydown keyup keypress change", function() {
    if ($(this).val().length == 0) {
      $move_3.prop("disabled", true);
      $move_3.val("");
    } else {
      $move_3.prop("disabled", false);
    }
  });
  $($move_3).on("keydown keyup keypress change", function() {
    if ($(this).val().length == 0) {
      $move_4.prop("disabled", true);
      $move_4.val("");
    } else {
      $move_4.prop("disabled", false);
    }
  });
});
