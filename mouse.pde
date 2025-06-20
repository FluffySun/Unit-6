//void mouseReleased() {
//  if (mode == INTRO) {
//    introClicks();
//  } else if (mode == GAME) {
//    gameClicks();
//  } else if (mode == PAUSE) {
//    pauseClicks();
//  } else if (mode == GAMEOVER) {
//    gameoverClicks();
//  }
//}

void mouseReleased() {
  if (mode == INTRO) {
    mode = GAME;
  } else if (mode == PAUSE) {
    mode = GAME;
  } else if (mode == GAMEOVER) {
    resetGame();
    mode = INTRO;
  }
}

void resetGame() {
  lives = 3;
  score = 0;
  vx = 3;
  vy = 3;
  px = width/2;
  py = height - 50;
  bx = width/2;
  by = height - 100;
  for (int i = 0; i < n; i++) {
    alive[i] = true;
  }
}
