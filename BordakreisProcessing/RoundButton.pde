class RoundButton {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  int highColor = 190;
  int normalColor = 218;
  boolean isSelectable = true;
  
  RoundButton(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
  void Draw() {
    noStroke();
    
    if (MouseIsOver()) {
    fill(216,215,173);
  } else {
    fill(255);
  }
  if(isSelectable){
    ellipse(x, y, w, h);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x, y);
  }else{
    fill(255);
    ellipse(x, y, w, h);
    textAlign(CENTER, CENTER);
    fill(240);
    text(label, x, y);
  }
  }
  
  boolean MouseIsOver() {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < w/2 ) {
      return true;
    } else {
      return false;
    }
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