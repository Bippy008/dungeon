final float CELL_SCALE = 0.8;

int cellSize;
int levelPixelWidth;
int levelPixelHeight;
int centeringShiftX;
int centeringShiftY;

PFont mainFont;

PImage wallImage;
PImage floorImage;
PImage doorImage;
PImage playerImage;
PImage ponyImage;
PImage backgroundMenuImage;
PImage backgroundPauseImage;
PImage backgroundDefeatImage;
Sprite coinSprite;
Sprite fireSprite;
Sprite diamondSprite;

void recalcDrawingParams() {
  cellSize = int(min(width / currentLevelWidth, height / currentLevelHeight) * CELL_SCALE);
  levelPixelWidth = currentLevelWidth * cellSize;
  levelPixelHeight = currentLevelHeight * cellSize;
  centeringShiftX = (width - levelPixelWidth) / 2;
  centeringShiftY = (height - levelPixelHeight) / 2;
}

void loadFonts() {
  mainFont = createFont("ARCADECLASSIC.TTF", 32);
  textFont(mainFont);
}

void loadImages() {
  wallImage = loadImage("wall.png");
  floorImage = loadImage("floor.png");
  doorImage = loadImage("door.png");
  playerImage = loadImage("player.png");
  ponyImage = loadImage("pony.png");
  backgroundMenuImage = loadImage("bg1.png");
  backgroundPauseImage = loadImage("bg2.png");
  backgroundDefeatImage = loadImage("bg3.png");
  coinSprite = new Sprite("coin/coin_", 9, ".png");
  fireSprite = new Sprite("fire/fire_", 9, ".png");
  diamondSprite = new Sprite("diamond/diamond_", 8, ".png");
}

class Sprite {
  PImage[] images;
  int frame;
  
  int skip, _skip;
  int time = -1;
  
  Sprite(String imagePrefix, int count, String extension) {
    this(imagePrefix, count, extension, 3);
  }
  
  Sprite(String imagePrefix, int count, String extension, int skip) {
    images = new PImage[count];

    for (int i = 0; i < count; i++) {
      String fileName = imagePrefix + i + extension;
      images[i] = loadImage(fileName);
    }
    
    this.skip = skip;
    _skip = skip;
  }

  void draw(float x, float y, float width, float height) {
    if (time < 0 || time > 0) {
      _skip--;
      if (_skip < 0) {
        _skip = skip;
        frame = (frame + 1) % images.length;
      }
      if (time > 0) {
        --time;
      }
      
      image(images[frame], x, y, width, height);
    } else {
      image(images[0], x, y, width, height);
    }
  }
}
