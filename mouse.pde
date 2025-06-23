void mouse_mousePressed() {
  if (screen.equals("INTRO") || screen.equals("GAMEOVER")) {
    restartGame();
  }
  else if (screen.equals("GAMEWIN")) {
    screen = "INTRO";
    introSound.loop();
  }
  else if (screen.equals("GAME")) {
    gamePaused = !gamePaused;
  }
}
