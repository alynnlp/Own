//jQuery is required to run this code
$( document ).ready(function() {

  scaleVideoContainer();
  initBannerVideoSize('.video-container .poster img');
  initBannerVideoSize('.video-container .filter');
  initBannerVideoSize('.video-container video');
  $(window).on('resize', function() {
      scaleVideoContainer();
      scaleBannerVideoSize('.video-container .poster img');
      scaleBannerVideoSize('.video-container .filter');
      scaleBannerVideoSize('.video-container video');
  });
  function scaleVideoContainer() {
      var height = $(window).height() + 5;
      var unitHeight = parseInt(height) + 'px';
      $('.homepage-hero-module').css('height',unitHeight);

  }
  function initBannerVideoSize(element){
    $(element).each(function(){
          $(this).data('height', $(this).height());
          $(this).data('width', $(this).width());
      });
      scaleBannerVideoSize(element);
  }
  function scaleBannerVideoSize(element){
      var windowWidth = $(window).width(),
      windowHeight = $(window).height() + 5,
      videoWidth,
      videoHeight;
      $(element).each(function(){
          var videoAspectRatio = $(this).data('height')/$(this).data('width');
          $(this).width(windowWidth);
          if(windowWidth < 1000){
              videoHeight = windowHeight;
              videoWidth = videoHeight / videoAspectRatio;
              $(this).css({'margin-top' : 0, 'margin-left' : -(videoWidth - windowWidth) / 2 + 'px'});
              $(this).width(videoWidth).height(videoHeight);
          }
          $('.homepage-hero-module .video-container video').addClass('fadeIn animated');
      });
  }

  $('#userregisterform').validate( {
      rules: {
        name: {
          required: true,
        },
        email: {
          required: true,
          email: true
        },
        password: {
          required: true,
          minlength: 5
        },
        location:{
          required: true,
        },
        budget: {
          required: true,
        },
        size: {
          required: true,
        },
        age: {
          required: false,
        },
        address: {
          required: false,
        },
        occupation: {
          required: false,
        }
      },
      messages: {
        name: "Please enter your name",
        email: "Please enter a valid email address",
        password: {
          required: "Please provide a password",
          minlength: "Your password must be at least 5 characters long"
        },
        location: "Please provide your preferred new property location",
        budget: "Please provide your budget of purchase",
        size: "Please provide the size of new property"
      },

      submitHandler: function(form) {
          console.log('test')
          var formdata = $(form).serialize();
          $.ajax({
            url: '/client_profile',
            type: 'POST',
            dataType: 'json',
            data: {
              name: $('.regname').val(),
              email: $('.regemail').val(),
              password: $('.regpw').val(),
            },

            success: function(newdata){
              alert('data saved ' + newdata);
            },error: function(newdata) {
              alert('failed to save ' + newdata);
            }
          });
      }
    });
    return false;
});
