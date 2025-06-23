void GAMEOVER_setup() {
}

void GAMEOVER_draw() {
  background(0);
  fill(255, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(48);
  text("GAME OVER", width / 2, height / 2 - 50);

  fill(255);
  textSize(24);
  text("Score: " + score, width / 2, height / 2);
  text("Click or Press ENTER to Restart", width / 2, height / 2 + 50);
}

void restartGame() {
  score = 0;
  lives = 3;
  GAME_setup();
  screen = "GAME";
}
