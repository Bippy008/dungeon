final int POINTS_FOR_COIN = 1;
final int POINTS_FOR_DIAMOND = 5;
int playerX;
int playerY;
int playerScore = 0;

void placePlayer(int x, int y) {
playerX = x;
playerY = y;
}

void movePlayer(int dx, int dy) {
  int nextX = playerX + dx;
  int nextY = playerY + dy;
  
  if (currentLevel[nextY][nextX] != '#') {
    playerX = nextX;
    playerY = nextY;
    if (currentLevel[nextY][nextX] == 'E') {
      loadNextLevel();
      doorSound.play();
      doorSound.rewind();
    } else if (currentLevel[nextY][nextX] == '*') {
      playerScore += POINTS_FOR_COIN;
      currentLevel[nextY][nextX] = ' ';
      coinSound.play();
      coinSound.rewind();
    } else if (currentLevel[nextY][nextX] == 'F') {
      state = DEFEAT_STATE;
    } else if (currentLevel[nextY][nextX] == 'D'){
      playerScore += POINTS_FOR_DIAMOND;
      currentLevel[nextY][nextX] = ' ';
      diamondSound.play();
      diamondSound.rewind();
    }
  }
}

void drawPlayer() {
  int pixelX = centeringShiftX + playerX * cellSize;  
  int pixelY = centeringShiftY + playerY * cellSize;
  
  image(playerImage, pixelX, pixelY, cellSize, cellSize);
}

void drawPlayerScore() {
  fill(255);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("Score " + playerScore, width/2, 60);
}
