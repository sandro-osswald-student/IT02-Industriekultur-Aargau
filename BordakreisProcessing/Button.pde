class Button {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  int highColor = 190;
  int normalColor = 218;
  boolean isSelectable = true;
  
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
  void Draw() {
    
    if (MouseIsOver()) {
    fill(89,144,21);
  } else {
    fill(139,195,74);
  }
  if(isSelectable){
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }else{
    stroke(170);
    fill(200);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(150);
    text(label, x + (w / 2), y + (h / 2));
  }
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
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