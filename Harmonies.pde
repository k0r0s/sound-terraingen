class Harmonies{
  int scl;
  float [][] terrain;
  int rows;
  int cols;
  float flying;
  Harmonies(int scl, int rows, int cols){
    this.scl=scl;
    this.rows=rows;
    this.cols=cols; 
    terrain = new float [cols][rows];
  }
  
void createGrid(){
  for(int y=0;y<rows-1;y++){
    beginShape(QUAD_STRIP);
    for(int x=0;x<cols;x++){
      vertex(x*scl, y*scl,terrain[x][y]);
      vertex(x*scl,(y+1)*scl,terrain[x][y+1]);
    }
    endShape();
  }
}


void createOndul(float speed,float ampli){
   flying-=speed;
  float yoff = flying;
  for(int y =0; y<rows; y++){
    float xoff = 0;
    for(int x = 0 ; x<cols;x++){
      terrain[x][y] = map(noise(xoff,yoff),0,1,-ampli,ampli);
      xoff+=0.2;
    }
    yoff +=0.2;
}
}


}
