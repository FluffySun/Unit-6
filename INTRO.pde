void INTRO_setup() {
}

void INTRO_draw() {
  background(30, 30, 70);
  image(gifFrames[gifIndex], 0, 0, width, height);
  
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(48);
  text("BREAKOUT GAME", width / 2, height / 2 - 50);

  textSize(24);
  text("Click or Press ENTER to Start", width / 2, height / 2 + 20);
  
  updateGif();
}
