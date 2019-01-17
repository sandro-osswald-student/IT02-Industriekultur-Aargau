class InputField {
  String label;
  float x;    // left  x position
  float y;    // left y position
  float w;    // width of line
  float h;    // right y position of line
  
  boolean isHighlighted= false;
  
  int highColor = 190;
  int normalColor = 218;
  int selectedColor = 190;
  int selectedColorHigh = 160;
  
  InputField(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
  void Draw() {
    /*
    if(isHighlighted){
      if(getGameState()==2){
        fill(92,107,192);
      }else if(getGameState()==3){
        fill(186,104,200);
      }else if(getGameState()==1){
        fill(8,127,35);
      }else{
        fill(255,202,40);
     }
     
    }else{
      fill(200);
    }
    
    */
    stroke(30);
    strokeWeight(2);
    line(x, y+h, x+w, y+h);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }
    
  void setLabel(String newLabel){
    label = newLabel;
  }
  
  boolean getIsHighlighted(){
    return isHighlighted;
  }
  
  void setIsHighlighted(boolean b){
    isHighlighted = b;
  }
}

public void drawBlinkingLine(float x, float y){
    stroke(0);
    float modifier = placementModifier();
    //println(getNumber().length());
    if(frameCount%60<30)line(x+modifier+30, y+30, x+modifier+30, y+70);
  }
  
  float placementModifier(){
    switch(getNumber().length()){
      case 0: 
        return 0;
      case 1: 
        return 10; 
      case 2: 
        return 20;
      case 3: 
        return 30; 
      case 4: 
        return 40; 
      default:           
        return 3000;
    }
  }