$(function() {
                $("[data-toggle='tooltip']").tooltip();
            });
            function showAndDismissAlert(type, message) {
                var htmlAlert = '<div class="alert alert-' + type + '">' + message + '</div>';

                // Prepend so that alert is on top, could also append if we want new alerts to show below instead of on top.
                $(".alert-messages").prepend(htmlAlert);

                // Since we are prepending, take the first alert and tell it to fade in and then fade out.
                // Note: if we were appending, then should use last() instead of first()
                $(".alert-messages .alert").first().hide().fadeIn(500).delay(3000).fadeOut(500, function() {
                    $(this).remove();
                });
            }