

class VectorInfluenceField{
  
  VectorInfluenceField(int _resolution){
    resolution = _resolution;
    vectorField = new PVector[width/resolution][height/resolution];
  }
  
  void reset(){
  for(int x = 0; x < width/resolution; x++){
    for(int y = 0; y < height/resolution; y++){
      PVector position = new PVector(x,y);
      PVector center = new PVector(width*0.5/resolution, height*0.5/resolution);
      vectorField[x][y] = position.sub(center);
      vectorField[x][y].y = abs(vectorField[x][y].y) * -1;
      vectorField[x][y].normalize();
    }
  }
}

void drawVectors(){
  for(int x = 0; x < width/resolution; x++){
    for(int y = 0; y < height/resolution; y++){
      drawVector(vectorField[x][y], x*resolution, y*resolution, resolution-2);
    }
  }
}

void drawVector(PVector v, float x, float y, float scayl) {//take from Nature Of Code
    pushMatrix();
    float arrowsize = 4;
    // Translate to position to render vector
    translate(x,y);
    stroke(0,100);
    strokeWeight(0.5);
    // Call vector heading function to get direction (note that pointing to the right is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(0,0,len,0);
    line(len,0,len-arrowsize,+arrowsize/2);
    line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  }
  
  
  PVector vectorField[][];//currently will be limmited to 180 degrees
  int resolution;
};
