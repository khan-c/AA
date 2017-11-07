document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');

  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext('2d');

  ctx.fillStyle = '#aaf49e';
  ctx.fillRect(0, 0, 500, 500);
  ctx.fill();

  ctx.beginPath();
  ctx.arc(250, 250, 150, 0, 2 * Math.PI);
  ctx.strokeStyle = 'rgb(76, 119, 230)';
  ctx.fillStyle = 'rgb(76, 119, 230)';
  ctx.fill();
  ctx.stroke();

  ctx.beginPath();
  ctx.moveTo(250, 225);
  ctx.strokeStyle = 'rgb(224, 80, 71)';
  ctx.bezierCurveTo(250, 217, 245, 205, 225, 205);
  ctx.bezierCurveTo(195, 205, 195, 232.5, 195, 232.5);
  ctx.bezierCurveTo(195, 260, 215, 282, 250, 305);
  ctx.bezierCurveTo(285, 282, 305, 260, 305, 232.5);
  ctx.bezierCurveTo(305, 232.5, 305, 205, 275, 205);
  ctx.bezierCurveTo(265, 205, 250, 217, 250, 225);
  ctx.fillStyle = 'rgb(224, 80, 71)';
  ctx.fill();
  ctx.stroke();


});
