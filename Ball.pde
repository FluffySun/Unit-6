class Ball {
  float x, y;
  float r = 10;
  float dx = 4;
  float dy = -4;

  Ball() {
    reset();
  }

  void reset() {
    x = paddle.x;
    y = paddle.y - paddle.r - r;
  }

  void update() {
    x += dx;
    y += dy;

    if (x < r || x > width - r) {
      dx *= -1;
    }
    if (y < r) {
      dy *= -1;
    }
    if (y > height) {
      lives--;
      reset();
    }
  }

  void display() {
    fill(255, 255, 0);
    noStroke();
    ellipse(x, y, r * 2, r * 2);
  }

  void checkCollision(Paddle p, ArrayList<Brick> bricks) {
    // —— 1. Paddle 碰撞 —— 
    float dP = dist(x, y, p.x, p.y);
    if (dP <= r + p.r) {
      // 记录当前速度大小
      float speed = sqrt(dx*dx + dy*dy);
      // 撞击法向量
      float nx = x - p.x;
      float ny = y - p.y;
      float mag = sqrt(nx*nx + ny*ny);
      if (mag != 0) {
        // 单位法向量 * speed
        dx = nx / mag * speed;
        dy = ny / mag * speed;
      }
      // 防止球“卡”在挡板里
      y = p.y - p.r - r;

      if (bounceSound != null) {
        bounceSound.rewind();
        bounceSound.play();
      }
    }

    // —— 2. Brick 碰撞 —— 
    for (int i = bricks.size() - 1; i >= 0; i--) {
      Brick b = bricks.get(i);
      float dB = dist(x, y, b.x, b.y);
      if (dB <= r + b.r) {
        // 只翻转纵向速度，不改变速度大小
        dy *= -1;

        bricks.remove(i);
        score += 10;

        if (scoreSound != null) {
          scoreSound.rewind();
          scoreSound.play();
        }
        break;
      }
    }
  }
}
