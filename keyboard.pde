boolean leftPressed = false;
boolean rightPressed = false;

void keyboard_keyPressed() {
  if (keyCode == LEFT) {
    leftPressed = true;
  } else if (keyCode == RIGHT) {
    rightPressed = true;
  } else if (key == 'p' || key == 'P') {
    gamePaused = !gamePaused;
  } else if (keyCode == ENTER || key == RETURN) {
    if (screen.equals("INTRO") || screen.equals("GAMEOVER")) {
      restartGame();
    }
  }
}

void keyboard_keyReleased() {
  if (keyCode == LEFT) {
    leftPressed = false;
  } else if (keyCode == RIGHT) {
    rightPressed = false;
  }
}
