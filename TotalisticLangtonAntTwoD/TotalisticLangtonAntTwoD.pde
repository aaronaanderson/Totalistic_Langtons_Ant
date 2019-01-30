
/*
Currently, as is true in Langton's Ant, the influence of a cell is
limmited to -90 and 90 degrees. However, I can see some problems 
coming out of this. In the original, the influence is turn left (-90 degrees)
OR turn right (+90 degrees). In this version, the influence may be anywhere 
between -90 or 90 degrees (including floats). The influence angle is stored 
as a vector. -90 degrees as a vector = (-1,0) and 90 = (1,0). An explenation
requires pictures for a clearer explenation. I have these in drawings but bug
me if I don't upload them to the repo.
*/


boolean drawField = true;
int resolution = 20;
VectorInfluenceField influenceField; 
Ant[] ants;
int numAnts = 2100;
void setup(){
  size(600,600);
  
  influenceField = new VectorInfluenceField(resolution);
  influenceField.reset();
  
  ants = new Ant[numAnts];
  for(int i = 0; i < numAnts; i++){
    float theta = map(i, 0, numAnts, 0, TWO_PI);
    PVector temp = new PVector(0.0,1.0);
    temp.rotate(theta);
    ants[i] = new Ant(temp);
  }
  
  
}

void draw(){
  background(255);
  if(drawField){
    influenceField.drawVectors();
  }
  for(int i = 0; i < numAnts; i++){
    ants[i].update(influenceField);
    ants[i].display();
  }
  
  
}

void keyPressed(){
  if(key == ' '){
    drawField = !drawField;
  }
}
