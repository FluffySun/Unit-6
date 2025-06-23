class Brick {
  float x, y, r;   
  color c;         

  Brick(float x, float y, float r, color c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, r * 2, r * 2);
  }
}
