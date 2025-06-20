void intro() {
  background(black);
  if (gif != null) {
    image(gif, 0, 0, width, height);
  }
  fill(white);
  textFont(titleFont);
  textAlign(CENTER, CENTER);
  text("Breakout!", width/2, height/2 - 50);
  textSize(20);
  text("Click to Start", width/2, height/2 + 20);
}


void introClicks() {
  if (dist(mouseX, mouseY, width/2, 260) < 50) {
    mode = GAME;
  }
}
