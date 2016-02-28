$(document).ready(function(){
  $(".unit").each(function(el){
    _this = $(this);
    color_boxes(_this);
    add_flag(_this);
  });

  $("#new_entry").submit(function(e){
    var comment = $(this).children("#entry_comment").val();

    $.post(
      "/activities/" + $(this).data("id") + "/entries",
      { "entry": { "comment": comment}},
      function(data){
        var unit = $(".unit").last();
        unit.data("count", unit.data("count") + 1);
        unit.data("complete", true);
        color_boxes(unit);
        add_flag(unit);
        unit.addClass("flash");
        $("#new_entry")[0].reset();
      }
    );

    e.preventDefault();
  });

  function color_boxes(_this){
    if(_this.data().count > 5){
      _this.addClass("high");
    } else if(_this.data().count > 3){
      _this.addClass("medium");
    } else if(_this.data().count > 0){
      _this.addClass("low");
    }
  }

  function add_flag(_this){
    Tipped.create(_this, function(el){
      var date = $(el).data("date");
      var complete = $(el).data("complete");
      var count = $(el).data("count");

      if(complete === true){
        var status = '<span class="ok">✓</span>';
      } else {
        var status = '<span class="x">X</span>';
      }

      return status + " " + date + "<p class='contributions'>" + count + " contribution(s)</p>";
    });
  }
});
