// Setting jQueryUI default value
jQuery.ui.dialog.prototype.options.modal = true;
jQuery.ui.dialog.prototype.options.resizable = false;

(function($) {
  $.extend({
    dialogBase: function(html, options) {
      var $div = $('<div></div>');
      $div.html(html);
      options = $.extend({
        close: function() { $div.remove(); }
      }, options);
      $div.dialog(options);
    },
    notifyDialog: function(html, options) {
      options = $.extend({
        buttons: {
          '閉じる': function() { $(this).dialog('close'); }
        }
      }, options);
      $.dialogBase(html, options);
    },
    formDialog: function(html, options) {
      options = $.extend({
        buttons: {
          '送信': function() {
            var $form = $(this).find('form');
            $.ajax({
              type: 'POST',
              url: $form.attr('action'),
              data: $form.serializeArray(),
              dataType: 'script'
            });
            $(this).dialog('close');
          },
          'キャンセル': function() { $(this).dialog('close'); }
        }
      }, options);
      $.dialogBase(html, options);
    }
  });
})(jQuery);
