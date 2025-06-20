void gameOver() {
  background(0);
  fill(white);
  textSize(32);
  text("Game Over!", width/2, height/2);
  
  if (leftscore>rightscore) {
    text("Left Player Wins!", width/2, height/2 + 50);
} else if (rightscore > leftscore) {
  text("Right Player Wins!", width/2, height/2 + 50);
  }
}

void gameOverClicks() {
  text("Final Score: " + score, width/2, height/2 + 80);
  text("Click to restart", width/2, height/2 + 120);
}
