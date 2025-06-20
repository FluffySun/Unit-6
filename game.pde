//!!!6.19!!!START!!!:
//MISSING: GIF image/Font/Brick Array on top block balls
//GAME: contrain-not offscreen,text,lives,
//velocity paddle ball,bouncing,collision, gameover socre calculation
//GAMEOVER: win screen/restart button, lose screen
//mousereleased
//intro:join screen
//Pause button
//!!!6.19!!!END!!!


//Circle Collisions+++++
//if (d<=r+R) {
//vx=vx*-1;
//}
//d: dist(px,py,bx,by);
//r=pd/2
//R=bd/2
//END CIRCLE COLLISIONS+++++

//CIRCLE COLLISIONS 2X
//if(d<=r+R) {
//vx=(ballx-px)/10;
//vy=(bally-py)/10;
//}

void game() {
  //float brickd;

  background(darkblue);

  //PONG START:

  background(brown);

  //center line
  strokeWeight(5);
  stroke(255);
  line(width/2, 0, width/2, height);

  //scoreboard
  textSize(50);
  fill(mango);
  text(leftscore, width/4, 100);
  fill(green);
  text(rightscore, 3*width/4, 100);
  //text(timer,3*width/4,550);
  timer=timer-1;

  //draw paddles
  fill(orange);
  circle(leftx, lefty, leftd);
  fill(green);
  circle(rightx, righty, rightd);

  //draw ball
  fill(green);
  circle(ballx, bally, balld);

  //move paddles
  if (wkey==true) lefty=lefty-5;
  if (skey==true) lefty=lefty+5;
  if (upkey==true) righty=righty-5;
  if (downkey==true) righty=righty+5;

  //DRAFT MOVE PADDLE WITH LIMITS
  if (wkey && lefty-5>=100) lefty=lefty-5;
  if (skey && lefty+5<=100) lefty=lefty+5;
  if (upkey && righty-5>=100) righty=righty-5;
  if (downkey && righty+5<=700) righty=righty+5;

  //move ball
  if (timer<0) {
    ballx=ballx+vx;
    bally=bally+vy;
  }

  ballx=ballx+vx;
  bally=bally+vy;

  //scoring
  if (ballx<0) {
    rightscore++;
    ballx=width/2;
    bally=height/2;
    timer=100;
  }

  //bouncing
  if (bally <= balld/2 || bally>= height-balld/2) {
    vy=vy*-1;
  }
  if (dist(ballx, bally, rightx, righty)<balld/2+rightd) {
    vx=(ballx-rightx)/10;
    vy=(bally-righty)/10;
  }
  if (dist(ballx, bally, leftx, lefty)<balld/2+leftd) {
    vx=(ballx-leftx)/10;
    vy=(bally-lefty)/10;
  }


  //:PONG END

  //paddle-------------------------------------------------------------------------------
  fill(white); //draw paddle
  circle(px, py, pd);
  if (akey) px=px-5; //key mvt
  if (dkey) px=px+5;
  px = constrain(px, pd/2, width - pd/2);

  //ball
  fill(white); //draw ball
  circle(bx, by, bd);

  bx=bx+vx; //mvt
  by=by+vy;
  if (by > height + bd/2) {
  lives--;
  if (lives <= 0) {
    mode = GAMEOVER;
  } else {
    resetGame();
  }
}

  //bouncing
  if (dist(bx, by, px, py) < bd/2 + pd/2) { //paddle bounce
    vx = (bx-px)/10;
    vy = (by - py)/10;
  }
  if (by < bd/2 || by > height-bd/2) { //bounce off top
    vy =vy * -1;
  }
  if (bx < bd/2 || bx > width-bd/2) { //bounce off side
    vx =vx * -1;
  }

  //bricks
  //circle(x[0],y[0],brickd);
  //circle(x[1],y[1],brickd);
  //circle(x[2],y[2],brickd);

  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBrick(i);//send "i" as argument
    }
    i++; //tangible brick that has collisions+wall tangible bounce off
  }
}


void manageBrick (int i) { //parameters
  if (y[i]==100) fill(purple); //Different row colors
  if (y[i]==200) fill(mango);
  if (y[i]==300) fill(orange);
  if (y[i]==400) fill(green);
  circle(x[i], y[i], brickd);
  if (dist(bx, by, x[i], y[i]) < bd/2 + brickd/2) { //brick collisions
    vx = (bx-x[i])/10;
    vy = (by - y[i])/10;
    alive[i] = false;
score++;
  }
}

void gameClicks() {
}
