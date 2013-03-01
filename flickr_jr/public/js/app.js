function Carousel(){
  this.images = $(".frames li");
  this.position = 1;
}
 
Carousel.prototype.showNextPhoto = function(){
   if (this.atEnd) {     
      first_image_html = $(".frames li:nth-child(1)").html();
      this.addFirstImageToEnd();
      this.nextImageStartAgain();
    } else {
      this.nextImage();
    }
};
 
Carousel.prototype.showPreviousPhoto = function(){
   if (this.atBeginning) {
      last_image_html = $(".frames li:last-child").html();
      this.addLastImageToStart();
      this.previousImageStartAgain();
 
    } else {
      this.previousImage();
    }
};
 
Carousel.prototype.atEnd = function(){
  this.position == this.images.length
}
 
Carousel.prototype.atBeginning = function(){
  this.position == 1
}
 
Carousel.prototype.addFirstImageToEnd = function(){
  $('ul.frames').append('<li>' + first_image_html + '</li>');
}
 
Carousel.prototype.addLastImageToStart = function(){
  $('ul.frames').prepend('<li>' + last_image_html + '</li>');
}
 
Carousel.prototype.nextImage = function(){
  this.position++;
  $(".frames").animate({
    right: "+=100%"
  }, 500 );
}
 
Carousel.prototype.previousImage = function(){
  this. position++;
  $(".frames").animate({
    right: "-=100%"
  }, 500 );
}
 
Carousel.prototype.nextImageStartAgain = function () {
  $(".frames").animate({
    right: "+=100%"
  }, 1500, function() {
    $(".frames li:nth-child(1)").remove();
    $(".frames").animate({
      right: "-=100%"
    }, 0 );
  } );
}
 
Carousel.prototype.previousImageStartAgain = function () {
 $(".frames").animate({
          right: "+=100%"
        }, 0 );
 
      $(".frames").animate({
          right: "-=100%"
      }, 1000, function() {
      } );
      $(".frames li:last-child").remove();
}
 
 
$(document).ready( function() {
    var carousel = new Carousel();
    $('#next_frame').click(function() {
      carousel.showNextPhoto();
    });
    $('#previous_frame').click(function() {
      carousel.showPreviousPhoto();
    });
 
});