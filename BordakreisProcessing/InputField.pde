class InputField {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  
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
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
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
    if(frameCount%60<30)line(x+45+modifier, y+32, x+45+modifier, y+77);
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