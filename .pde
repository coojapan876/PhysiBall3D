PVector pos=new PVector(300,25,-200);
PVector vel=new PVector(0,0,0);
float g=0.30;
float f=0.99;float r=25;
void generatePhysics()
{
  vel.mult(f);
  vel.y+=g;
  pos.add(vel);
  if(pos.y+r>700){
    vel.y=-vel.y;pos.y=680-r;
  }
  if(pos.y-r<0){pos.y=r;vel.y=-vel.y;}
  if(pos.z-100<-800){pos.z=-700;vel.z=-vel.z;}
}
void setup(){
  size(800,800,P3D);
  smooth();
  frameRate(30);
}
void draw(){
  background(0,255,255);
  generatePhysics();
  pushMatrix();
  lights();
  noFill();
  stroke(120);
  translate(pos.x,pos.y,pos.z);
  sphere(r*2);
  popMatrix();
  if(keyPressed&&keyCode==UP){
    vel.z=-7;}
  if(keyPressed&&keyCode==DOWN){
    vel.z=7;}
  if(keyPressed&&keyCode==LEFT){
    vel.x=-7;
  }
  if(keyPressed&&keyCode==RIGHT){
    vel.x=7;
  }
  if(keyPressed&&keyCode==CONTROL){
    vel.y=-7;
  }
  if(pos.x+r*2>670){
    vel.x=-vel.x;
  }
  if(pos.x-r*2<120){
    vel.x=-vel.x;
  }
}
