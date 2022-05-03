import 'dart:html';
import 'dart:math';
import 'dart:async';

late CanvasElement canvas;    
late CanvasRenderingContext2D ctx;

var ball;

class Ball {
  var r = 15.0; //ball size
  var x = 50.0; //start x
  var y = 50.0; //start y
  var vx = 0.0; //velocity
  var vy = 0.0; //velocity
}

void drawBall(){
  //clear display
  ctx.clearRect(0,0, canvas.width as num, canvas.height as num);
  ctx.fillStyle = "rgba(73, 134, 124, 0.8)";
  ctx.fillRect(0, 0, canvas.width as num, canvas.height as num);
  ctx.restore();
  
  //update ball with phyics
  
  //1- apply velocity to position
  ball.x = ball.x + ball.vx;
  ball.y = ball.y + ball.vy;
  
  //2- apply drag/friction to velocity
  ball.vx = ball.vx * .99;
  ball.vy = ball.vy * .99;
  
  //3- apply gravity to velocity
  ball.vx = ball.vx + .25;
  ball.vy = ball.vy + .25;
  
  //4- check for collision
  if (ball.y + ball.r > canvas.height){
    ball.y = canvas.height! - ball.r;
    ball.vy = (-1) * ball.vy;
  }

  if(ball.x + ball.r > canvas.width){
    ball.x = canvas.width! - ball.r;
    ball.vx = (-1) * ball.vx;   
    }
  
  //draw ball
  ctx.save();
  ctx.translate(ball.x, ball.y);
  ctx.fillStyle = "rgba(246, 184, 199, 0.8)"; //ball color
  ctx.beginPath();
  ctx.arc(0, 0, ball.r, 0, pi*2, false);
  ctx.closePath();
  ctx.fill();
  ctx.restore();
  
  timeWait();
}

Timer timeWait([int milliseconds = 0]) {
  const timeout = const Duration(milliseconds: 10);//seconds between each frame
  const ms = const Duration(milliseconds: 1);
  var duration = milliseconds == null ? timeout : ms * milliseconds;
  return new Timer(duration, drawBall);
}

void resetOnClick(MouseEvent event){
  if(event.offset.x < canvas.width! - ball.r && event.offset.y < canvas.height! - ball.r){ 
  	ball.x = event.offset.x;
  	ball.y = event.offset.y;
  	ball.vx = 0.0;//velocity
  	ball.vy = 0.0;//velocity
  }
}

void main() {
  ball = Ball();
  canvas = querySelector('#canvas') as CanvasElement;
  ctx = canvas.getContext('2d') as CanvasRenderingContext2D;
  drawBall();
  ctx.canvas.onClick.listen(resetOnClick);
}
