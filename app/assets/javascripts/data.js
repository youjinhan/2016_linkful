        $('.modify').click(function() {
              var id = $(this).data('id');
              $('.text[data-id="' + id + '"]').attr('contenteditable', true);
            });
