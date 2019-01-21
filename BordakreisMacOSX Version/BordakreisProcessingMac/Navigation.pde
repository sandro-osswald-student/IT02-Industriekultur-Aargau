//draws breadcrumb/navigation element that shows current position of user inside the screens

void drawNavigationList(int posX, int posY){
  int x = posX;
  int y = posY;
  int circleSize = displayWidth/50;    //size of the circles
  int navLength = (displayWidth/10)*3; //length of the line
  
  //draws line and the 5 circles
  fill(255); // default colour of circles is white
  strokeWeight(5);
  line(x, y, x+navLength, y);
  ellipse(x, y, circleSize, circleSize);
  ellipse(x+(navLength/4), y, circleSize, circleSize);
  ellipse(x+navLength/2, y, circleSize, circleSize);
  ellipse(x+(navLength/4*3), y, circleSize, circleSize);
  ellipse(x+navLength, y, circleSize, circleSize);
  
  //handles colouration of the active, on not jet reached states
  if(gameState == 0){
    fill(30);  //turns colour of circle dark grey
    ellipse(x, y, circleSize, circleSize);
  }else if(gameState == 1){
    fill(216,215,173);   //colour of circle turns golden
    ellipse(x, y, circleSize, circleSize);
    
    fill(30);
    ellipse(x+(navLength/4), y, circleSize, circleSize);
  }else if(gameState == 2){
    fill(216,215,173);
    ellipse(x, y, circleSize, circleSize);
    ellipse(x+(navLength/4), y, circleSize, circleSize);
    
    fill(30);
    ellipse(x+navLength/2, y, circleSize, circleSize);
  }else if(gameState == 3){
    fill(216,215,173);
    ellipse(x, y, circleSize, circleSize);
    ellipse(x+(navLength/4), y, circleSize, circleSize);
    ellipse(x+navLength/2, y, circleSize, circleSize);
    
    fill(30);
    ellipse(x+(navLength/4*3), y, circleSize, circleSize);
  }else if(gameState == 4){
    fill(216,215,173);
    ellipse(x, y, circleSize, circleSize);
    ellipse(x+(navLength/4), y, circleSize, circleSize);
    ellipse(x+navLength/2, y, circleSize, circleSize);
    ellipse(x+(navLength/4*3), y, circleSize, circleSize);
    
    fill(30);
    ellipse(x+navLength, y, circleSize, circleSize);
  }
}