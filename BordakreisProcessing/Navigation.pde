void drawNavigationList(int posX, int posY){
  
  int x = posX;
  int y = posY;
  
  int circleSize = displayWidth/30;
  
  int navLength = (displayWidth/10)*4; 
  
  
  fill(255);
  strokeWeight(5);
  line(x, y, x+navLength, y);
  ellipse(x, y, circleSize, circleSize);
  ellipse(x+(navLength/4), y, circleSize, circleSize);
  ellipse(x+navLength/2, y, circleSize, circleSize);
  ellipse(x+(navLength/4*3), y, circleSize, circleSize);
  ellipse(x+navLength, y, circleSize, circleSize);
  
  
  if(gameState == 0){
    fill(30);
    ellipse(x, y, circleSize, circleSize);
  }else if(gameState == 1){
    fill(216,215,173);
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