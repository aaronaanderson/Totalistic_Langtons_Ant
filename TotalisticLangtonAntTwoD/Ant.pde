

class Ant{
  
  Ant(PVector initialOrientation){
    location = new PVector(0.0, 0.0);
    orientation = initialOrientation;
  }
  
  void update(VectorInfluenceField field){
    //Which cell is the ant occupying?
    checkBounds();
    int x = int((location.x + (width * 0.5))/field.resolution);
    int y = int((location.y + (height * 0.5))/field.resolution);
    //get a copy of that vector
    PVector influenceVector = new PVector(0,0);
    if(x < field.resolution && y < field.resolution && (x*y) != 0){
      influenceVector = field.vectorField[x][y].get();
    }
    
    //rotate that vector to match the heading of the current Ant vector
    influenceVector.rotate(orientation.heading());
    //split the difference of the two headings
    //I'll use .lerp() and .normalize(), but there may be a more efficient method
    orientation = orientation.lerp(influenceVector, 0.001);
    orientation.normalize();
    
    //allow the change to feedback into the cell
    field.vectorField[x][y] = field.vectorField[x][y].lerp(orientation, 0.91);
    field.vectorField[x][y].normalize();
    
    //now that the angle is set, moving the ant is a simple matter of
    //adding the orientation to the position 
    location.add(orientation.mult(1.0));//the .mult allows for minimizing or exaggerating the change
  }
  void display(){
    pushMatrix();
    translate(width/2, height/2);
    //noStroke();
    fill(255, 10);
    ellipse(location.x, location.y, 20, 20);
    popMatrix();
  }
  
  PVector location;
  PVector orientation;
  void checkBounds(){
    if(location.x < -width*0.5 || location.y < -height*0.5 || location.x > width*0.5 || location.y > height*0.5){
      location.x = 0; location.y = 0;
    }
  }
}
