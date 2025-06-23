
import ddf.minim.*; 
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim       minim;           
AudioPlayer introSound;      
AudioPlayer bounceSound;     
AudioPlayer scoreSound;     
AudioPlayer winSound;        
AudioPlayer loseSound;      

PImage[] gifFrames;
int gifIndex = 0;
final int TOTAL_FRAMES = 61;



void setup() {
  size(800, 600);
  smooth();
  
    println("Data folder: " + sketchPath("data"));
  File dir = new File(sketchPath("data/ezgif-split"));
  if (dir.exists()) {
    println("Found folder, listing contents:");
    for (String f : dir.list()) {
      println("  " + f);
    }
  } else {
    println("Folder not found: data/ezgif-split");
  }
  
  gifFrames = new PImage[TOTAL_FRAMES];
  int i = 0;
  while (i < TOTAL_FRAMES) {
    gifFrames[i] = loadImage("ezgif-split/frame_" + i + ".gif");
    if (gifFrames[i] == null) {
      println("ERROR loading frame_" + i + ".gif");
    }
    i++;
  }

  minim = new Minim(this);
  introSound  = minim.loadFile("intro.mp3");
  bounceSound = minim.loadFile("bounce.wav");
  scoreSound  = minim.loadFile("score.wav");
  winSound    = minim.loadFile("win.wav");
  loseSound   = minim.loadFile("lose.wav");
  
  introSound.loop();
  INTRO_setup();
  GAME_setup();
  GAMEOVER_setup();
}

void updateGif() {
  gifIndex = (gifIndex + 1) % TOTAL_FRAMES;
}


void startGame() {
  introSound.pause();
  GAME_setup();
  screen = "GAME";
}


void stop() {
  introSound.close();
  bounceSound.close();
  scoreSound.close();
  winSound.close();
  loseSound.close();
  minim.stop();
  super.stop();
}

String screen = "INTRO";

void draw() {
  background(0);

  if (screen.equals("INTRO")) {
    INTRO_draw();

  } else if (screen.equals("GAME")) {
    if (gamePaused) {
      showPause();
    } else {
      GAME_draw();
    }

  } else if (screen.equals("GAMEWIN")) {
    showGameWin();

  } else if (screen.equals("GAMEOVER")) {
    GAMEOVER_draw();
  }
}

void showGameWin() {
  background(0);
  fill(0, 255, 0);
  textAlign(CENTER, CENTER);
  textSize(48);
  text("YOU WIN!", width/2, height/2 - 20);
  textSize(20);
  fill(255);
  text("Click to play again", width/2, height/2 + 30);
}

void showPause() {
  fill(255);
  textAlign(CENTER);
  textSize(32);
  text("PAUSED – Click to Resume", width / 2, height / 2);
  textSize(20);
  text("Click anywhere to continue", width / 2, height / 2 + 40);
}



void keyPressed() {
  keyboard_keyPressed();
}

void keyReleased() {
  keyboard_keyReleased();
}

void mousePressed() {
  mouse_mousePressed();
}
