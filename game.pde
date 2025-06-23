Paddle paddle;
Ball ball;
ArrayList<Brick> bricks;
int score = 0;
int lives = 3;
boolean gamePaused = false;

void GAME_setup() {
  paddle = new Paddle();
  ball = new Ball();
  initBricks();
}

void GAME_draw() {

  paddle.update();
  paddle.display();

  ball.update();
  ball.display();
  ball.checkCollision(paddle, bricks);

  displayBricks();

  if (bricks.isEmpty()) {
    winSound.rewind();
    winSound.play();
    screen = "GAMEWIN";
    return;
  }

  fill(255);
  textSize(18);
  textAlign(LEFT);
  text("Score: " + score, 10, 20);
  text("Lives: " + lives, 10, 40);

  if (lives <= 0) {
    loseSound.rewind();
    loseSound.play();
    screen = "GAMEOVER";
  }
}


void initBricks() {
  bricks = new ArrayList<Brick>();
  int rows = 6;
  int cols = 9;
  float radius = 18;
  float gap = 10;
  float offsetX = (width - (cols * (radius * 2 + gap))) / 2 + radius;
  float offsetY = 80;

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols - (i % 2); j++) {
      float x = offsetX + j * (radius * 2 + gap) + ((i % 2) * (radius + gap / 2));
      float y = offsetY + i * (radius * 2 + gap);

      color c = color(
        map(i, 0, rows - 1, 100, 255),
        map(j, 0, cols - 1, 100, 255),
        200
      );
      bricks.add(new Brick(x, y, radius, c));
    }
  }
}

void displayBricks() {
  for (Brick b : bricks) {
    b.display();
  }
}
