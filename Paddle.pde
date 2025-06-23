class Paddle {
  float x, y;
  float r = 60;  
  float speed = 6;

  Paddle() {
    x = width / 2;
    y = height;
  }

  void update() {
    if (leftPressed) x -= speed;
    if (rightPressed) x += speed;

    x = constrain(x, r, width - r);
  }

  void display() {
    fill(100, 200, 255);
    noStroke();
    arc(x, y, r * 2, r * 2, PI, TWO_PI);
  }
}
