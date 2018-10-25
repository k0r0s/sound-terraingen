import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song;
FFT fft;


int cols, rows;
int scl=20;
int w =300;
int h= 300;
Harmonies har;
Harmonies har2;



void setup() {
  background(0);
  size(600, 600, P3D);
  colorMode(HSB);
  cols = w/scl;
  rows = h/scl;
  har = new Harmonies(scl, rows, cols);
  har2 = new Harmonies(scl, rows, cols);

  minim = new Minim(this);
  song=minim.loadFile("Lorn.mp3");
  song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());
}

void generateHarmony(Harmonies har, float prc, int hue) {
  stroke(hue, 255, 255);
  pushMatrix();
  translate(width/2, 0+height*prc);
  rotateX(PI/3);
  rotateZ(-PI/2.5);
  translate(-w/2, -h/2);
  har.createGrid();
  translate(w/2, h/2);
  translate(-width/2, 0-height*prc);
  popMatrix();
}

float up;
float down;
float speed=0.035;
 int i =0;
void draw() {
  float[] amplitude = new float[fft.specSize()];
  background(0);
  stroke(255);
  noFill();
  fft.forward(song.mix);
  generateHarmony(har, 0.3, 0);
  generateHarmony(har2, 0.5, 170);  
 
 


  for (int i=0; i<fft.specSize(); i+=5) {
   amplitude[i] = fft.getBand(i);
    
  }
  har.createOndul(speed, amplitude[i]*2);
    har2.createOndul(speed*2, amplitude[i]*2);
  i%=fft.specSize();
}
