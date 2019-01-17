class RoundButton {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  int highColor = 190;
  int normalColor = 218;
  boolean isSelectable = true;
  
  RoundButton(String labelB, float xpos, float ypos) {
    label = labelB;
    x = xpos;
    y = ypos;
    h = 20;
  }
  
  void Draw() {
    //noStroke();
    
    //Testing size of button
    //rect(x, y-textAscent(), textWidth(label), textAscent());
    
    if (MouseIsOver()) {
    fill(216,215,173);
    stroke(216,215,173);
  } else {
    //stroke(255);
  }
  textSize(48);
  strokeWeight(1);
  textAlign(LEFT);
  if(isSelectable){
    if(!MouseIsOver()){
    fill(69);
    stroke(69);
    }
    line(x, y+3, x+textWidth(label), y+3);
    text(label, x, y);
  }else{
    fill(200);
    stroke(200);
    line(x, y, x+textWidth(label), y);
    text(label, x, y);
  }
  }
  
  boolean MouseIsOver() {
    if (mouseX > x-10 && mouseX < (x + textWidth(label)+10) && mouseY > y-textAscent()-10 && mouseY < y+10 ){
      return true;
    }
    return false;
  }
  
  void notSelectable(){
    isSelectable = false;
  }
  void turnSelectable(){
    isSelectable = true;
  }
  public boolean canBeSelected(){
    return isSelectable;
  }
}