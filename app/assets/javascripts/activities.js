$(document).ready(function(){
  $(".unit").each(function(el){
    _this = $(this);

    if(_this.data().count > 5){
      _this.addClass("high");
    } else if(_this.data().count > 3){
      _this.addClass("medium");
    } else if(_this.data().count > 0){
      _this.addClass("low");
    }
  });

  Tipped.create(".unit", function(el){
    var date = $(el).data().date;
    var complete = $(el).data().complete;

    if(complete === true){
      var status = '<span class="ok">✓</span>';
    } else {
      var status = '<span class="x">X</span>';
    }

    return status + " " + date;
  });
});
