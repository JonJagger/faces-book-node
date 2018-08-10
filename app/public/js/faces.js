$(() => {

  const makeFace = function(name) {
    return $("<img>", {
      "class":"face",
      "title":name,
        "src":`img/${year}/${name}.jpg`
     });
  };

  const tipped = function(node) {
    return node.tooltip({
      position: {
        my: "center bottom-20",
        at: "center top",
        using: function(position,feedback) {
          $(this).css(position);
          $("<div>")
            .addClass("arrow")
            .addClass(feedback.vertical)
            .addClass(feedback.horizontal)
            .appendTo(this);
        }
      }
    });
  };

  $("#shuffle").click(function() {
    window.location.reload();
  });

  //- - - - - - - - - - - - - - - -

  $.ajax({
    url: `/shuffle?year=${year}`,
    success: function(names) {
      const faces = $("faces");
      names.forEach(function(name) {
        const face = makeFace(name);
        faces.append(tipped(face));
      });
    }
  });

});
