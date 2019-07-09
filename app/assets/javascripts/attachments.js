$(function() {
  $(".btn-attach").click(function() {
    $("#form-attachment input").click();
  });

  $("#form-attachment input").on('change', function() {
    $(".btn-attach").addClass("hide");
    $(".stetson-page-meta .actions .spin").removeClass("hide");
    Rails.fire(this.form, 'submit');
  });

  // Paste an image from the clipboard, get a valid markdown tag
  $(window).on("paste", function(event) {
    var $form = $("#form-page"),
      $textarea = $(".editor textarea"),
      pastableTypes = [ 'image/png', 'image/gif', 'image/jpeg' ],
      originalEvent = event.originalEvent;

    if ($textarea.is(":focus")
        && originalEvent.clipboardData.items.length == 1
        && pastableTypes.includes(originalEvent.clipboardData.items[0].type)) {
      
      var placeholder = "![Uploading...]()",
        text = $textarea.val(),
        caretPosition = $textarea[0].selectionStart,
        $fileInput = $form.find("input[type='file']"),
        uploadUrl = $fileInput.data("direct-upload-url"),
        pastedFile = originalEvent.clipboardData.items[0].getAsFile(),
        fileExtension = pastedFile.name.split('.').pop(),
        namedFile = new File([pastedFile], 'image_' + Date.now() + '.' + fileExtension, { type: pastedFile.type })
        uploader = new ActiveStorage.DirectUpload(namedFile, uploadUrl);

      // Show placeholder text for the image markdown
      $textarea.val(text.substring(0, caretPosition) + placeholder + text.substring(caretPosition));

      // Start the file upload
      uploader.create(function(error, blob) {
        if (error) {
          // Restore original text
          $textarea.val(text);
          // Show the error message
          alert("Sorry, there was a problem uploading your pasted file: " + error);
        } else {
          // File has been uploaded, but we need to associate it with this
          // page by adding its 'signed_id' to the attachments input. Once
          // the page is saved, the association will be complete.
          var $hiddenField = $("<input type='hidden' />"),
            imageFilename = blob.filename,
            imageId = blob.id,
            markdown = "!["+imageFilename+"](/attachments/"+imageId+")",
            newCaretPosition = caretPosition + markdown.length;

          $hiddenField.attr("value", blob.signed_id);
          $hiddenField.attr("name", $fileInput.attr("name"));
          $form.append($hiddenField);

          // Replace markdown placeholder with real tag
          text = $textarea.val();
          $textarea.val(text.replace(placeholder, markdown));
          // Ensure cursor appears where the user would expect it
          $textarea[0].setSelectionRange(newCaretPosition, newCaretPosition);
        }
      });
    }
  });
});