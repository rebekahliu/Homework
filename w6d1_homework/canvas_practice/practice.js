document.addEventListener("DOMContentLoaded", function(){
  // const canvas = document.getElementById('mycanvas');
  // canvas.width = 500;
  // canvas.height = 500;
  //
  // const ctx = canvas.getContext('2d');
  // ctx.fillStyle = `red`;
  // ctx.fillRect(0, 0, 500, 500);
  //
  // ctx.beginPath();
  // ctx.arc(200, 200, 50, 0, 2 * Math.PI);
  // ctx.strokeStyle = "blue";
  // ctx.lineWidth = 10;
  // ctx.stroke();
  //
  // ctx.fillStyle = "green";
  // ctx.fill();

  function draw() {
  var canvas = document.getElementById('mycanvas');
  if (canvas.getContext) {
     var ctx = canvas.getContext('2d');

    ctx.beginPath();
    ctx.arc(75, 75, 50, 0, Math.PI * 2, true); // Outer circle
    ctx.moveTo(110, 75);
    ctx.arc(75, 75, 35, 0, Math.PI, false);  // Mouth (clockwise)
    ctx.moveTo(65, 65);
    ctx.arc(60, 65, 5, 0, Math.PI * 2, true);  // Left eye
    ctx.moveTo(95, 65);
    ctx.arc(90, 65, 5, 0, Math.PI * 2, true);  // Right eye
    ctx.stroke();
    }
  }
  draw();
});
