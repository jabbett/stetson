$(function() {
  $(".btn-attach").click(function() {
    $("#form-attachment input").click();
  });

  $("#form-attachment input").on('change', function() {
    $(".btn-attach").addClass("hide");
    $(".stetson-page-meta .actions .spin").removeClass("hide");
    Rails.fire(this.form, 'submit');
  });
});