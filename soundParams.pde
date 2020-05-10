import ddf.minim.*;

Minim minim;
AudioPlayer coinSound;
AudioPlayer doorSound;
AudioPlayer diamondSound;

void loadSounds() {
  minim = new Minim(this);
  coinSound = minim.loadFile("coin.wav");
  doorSound = minim.loadFile("door.wav");
  diamondSound = minim.loadFile("diamond.wav");
}
