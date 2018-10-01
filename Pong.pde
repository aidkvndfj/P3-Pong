//Variables
PVector paddle1;
PVector paddle2;
PVector ball;
PVector ballSpeed;
int p1 = 0, p2 = 0;
float   speedP;
boolean upL, downL, upR, downR;
float start, direction;


void setup(){
  //720p, 30FPS
  size(1280, 720);
  frameRate(30);
  
  //Inital Pos Setup
  paddle1 = new PVector(75, 360);
  paddle2 = new PVector(1205, 360);
  ball = new PVector(640, 360);
  
  //Initial Speed Setup
  ballSpeed = new PVector(7.5, random(0, 20));
  speedP = 10;
  
  //Picks Start Direction
  start = random(0.0, 1.0);
  pickDirection();
  
}

void reset(){
  //Resets Pos
  paddle1 = new PVector(75, 360);
  paddle2 = new PVector(1205, 360);
  ball.x = 640;
  ball.y = 360;
  
  //Picks new Direction
  start = random(0.0, 1.0);
  pickDirection();
  
  ballSpeed.y = random(0, 20);
}

void draw(){
  //Gets rid of previos frame
  background(240);
  
  //All Main Functions Will Go Here 
  ballBounce();
  ballMove();
  ballDraw();
  paddleRMove();
  paddleRDraw();
  paddleLMove();
  paddleLDraw();
  
  printScore();
  win();
}

void ballDraw(){
  fill(0);
  noStroke();
  ellipseMode(CENTER);
  ellipse(ball.x, ball.y, 12, 12);
}

void ballMove(){
  ball.x += ballSpeed.x * direction;
  ball.y += ballSpeed.y;
}

void ballBounce(){
  if((ball.x < paddle1.x+13 && ball.x > paddle1.x-13 && ball.y < paddle1.y+50 && ball.y > paddle1.y-50)|| (ball.x > paddle2.x-13 && ball.x < paddle2.x+13 && ball.y < paddle2.y+50 && ball.y > paddle2.y-50)){
    direction *= -1;
  }
  
  if(ball.y > 710 || ball.y < 10) {
    ballSpeed.y *= -1;
  }
}

void paddleRDraw(){
  //Draw paddle
  fill(0);
  strokeWeight(0.5);
  stroke(255);
  rectMode(CENTER);
  rect(paddle2.x, paddle2.y, 25, 100);
}

void paddleRMove(){
 if (upR){
   paddle2.y -= speedP;
 }else if(downR){
   paddle2.y += speedP;
 }
}

void paddleLDraw(){
  //Draw paddle
  fill(0);
  strokeWeight(0.5);
  stroke(255);
  rectMode(CENTER);
  rect(paddle1.x, paddle1.y, 25, 100);
}

void paddleLMove(){
 if (upL){
   paddle1.y -= speedP;
 }else if(downL){
   paddle1.y += speedP;
 }
}

void win() {
  if (ball.x < paddle1.x-75 ){
   reset();
   print("WINNER ");
   p2 += 1;
   delay(1000);
  }else if(ball.x > paddle2.x+75){
   reset();
   print("WINNER ");
   p1 += 1;
   delay(1000); 
  }
  
  if (p1 == 5) {
    noLoop();
    print("\nPlayer 1 wins");
  }else if (p2 == 5) {
    noLoop();
    print("\nPlayer 2 wins");
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    upL = true;
  }
  if (key == 's' || key == 'S') {
    downL = true;
  }
  if (keyCode == UP) {
    upR = true;
  }
  if (keyCode == DOWN) {
    downR = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    upL = false;
  }
  if (key == 's' || key == 'S') {
    downL = false;
  }
  if (keyCode == UP) {
    upR = false;
  }
  if (keyCode == DOWN) {
    downR = false;
  }
}

void pickDirection() {
   if (start > 0.5){
    direction = 1;
  }else{
    direction = -1; 
  } 
}

void printScore(){
  stroke(0);
  strokeWeight(3);
  /*
  //top line
  line(450, 20, 490, 20);
  //2nd line
  line(450, 60, 490, 60);
  //3rd line
  line(450, 100, 490, 100);
  //left top
  line(450, 20, 450, 60);
  //right top
  line(490, 20, 490, 60);
  //left bottom
  line(450, 60, 450, 100);
  //right bottom
  line(490, 60, 490, 100);
  */
  
  if (p1 == 0){
  line(450, 20, 490, 20);
  line(450, 100, 490, 100);
  line(450, 20, 450, 60);
  line(490, 20, 490, 60);
  line(450, 60, 450, 100);
  line(490, 60, 490, 100);
  }else if(p1 == 1){   
  line(490, 20, 490, 60);
  line(490, 60, 490, 100);
  }else if(p1 == 2){
  line(450, 20, 490, 20);
  line(490, 20, 490, 60);
  line(450, 60, 490, 60);
  line(450, 60, 450, 100);
  line(450, 100, 490, 100);  
  }else if(p1 == 3){
  line(490, 20, 490, 60);
  line(490, 60, 490, 100);
  line(450, 20, 490, 20);
  line(450, 60, 490, 60);
  line(450, 100, 490, 100);
  }else if(p1 == 5){
  line(450, 20, 490, 20);
  line(490, 20, 490, 60);
  line(450, 60, 490, 60);
  line(490, 60, 490, 100);
  line(450, 100, 490, 100);    
  }
}
