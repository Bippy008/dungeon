final int MENU_STATE = 0;
final int GAME_STATE = 1;
final int PAUSE_STATE = 2;
final int VICTORY_STATE = 3;
final int DEFEAT_STATE = 4;

int state = MENU_STATE;

void setup() {
  fullScreen();
  background(0);
  
  loadFonts();
  loadSounds();
  loadImages();
}
  
void draw() {
  background(0);
 
  switch (state) {
    case MENU_STATE:
      drawMenu();
      break;
    case GAME_STATE:
      drawGame();
      break;
    case DEFEAT_STATE:
      drawDefeat();
      break;
    case VICTORY_STATE:
      drawVictory();
      break;
    case PAUSE_STATE:
      drawPause();
      break;
    // ...
  }
}
  
void drawMenu() {
  image(backgroundMenuImage, 0, 0, width, height);
  
  fill(255, 0, 0);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("Dungeon", width/2, height/2);
  
  fill(255);
  textSize(50);
  text("Press Enter to start the game", width/2, height/2 + 100);
}

void drawGame() {
  drawLevel();
  drawPlayer();
  drawPlayerScore();
}

void drawPause() {
  image(backgroundPauseImage, 0, 0, width, height);
  
  fill(255);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("Game on pause", width/2, height/2);
  
  textSize(50);
  text("Press Space to continue the game", width/2, height/2 + 100);
}

void drawDefeat() {
  image(backgroundDefeatImage, 0, 0, width, height);
  
  fill(255, 0 , 0);
  textSize(150);
  textAlign(CENTER, CENTER);
  text("WASTED", width/2, height/2);
  
  fill(255);
  textSize(50);
  text("Press Enter to return to menu", width/2, height/2 + 200);
}

float angle = 0;
void drawVictory() {
  noStroke();
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < 100; i++) {
    rotate(angle);
    angle += 0.00005;
    translate(i * 10, 0);
    fill(200 * i / 100.0);
    rect(0, 0, 100, 100);    
  }    
  popMatrix();
  
  fill(255);
  textSize(150);
  textAlign(CENTER, CENTER);
  text("VICTORY!", width/2, height/2 - 100);
  
  textSize(50);
  text("You collected " + playerScore + " points", width/2, height/2 + 50);
  
  fill(200);
  text("Press Enter to go back to menu", width/2, height - 100);
}

void keyPressed() {
  switch (state) {
    case MENU_STATE:
      keyPressedinMenu();
      break;
    case GAME_STATE:
      keyPressedInGame();
      break;
    case DEFEAT_STATE:
      keyPressedinDefeat();
      break;
    case PAUSE_STATE:
      keyPressedOnPause();
      break;
    case VICTORY_STATE:
      keyPressedInVictory();
      break;
    // ...
  }
}

void keyPressedinMenu() {
  if (keyCode == ENTER) {
    currentLevelIndex = -1;
    playerScore = 0;
    loadNextLevel();
    state = GAME_STATE;
  }
}

void keyPressedinDefeat() {
  if (keyCode == ENTER) {
    state = MENU_STATE;
  }
}

void keyPressedInGame() {
  switch (keyCode) {
    case UP:
      movePlayer(0, -1);
      break;
    case DOWN:
      movePlayer(0, 1);
      break;
    case LEFT:
      movePlayer(-1, 0);
      break;
    case RIGHT:
      movePlayer(1, 0);
      break;
  }  
  
  switch (key) {
    case ' ':
      state = PAUSE_STATE;
  }
}

void keyPressedOnPause() {
  if (key == ' ') {
    state = GAME_STATE;
  }
}

void keyPressedInVictory() {
  if (keyCode == ENTER) {
    state = MENU_STATE;
  }
}
