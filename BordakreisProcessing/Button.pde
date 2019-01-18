class Button {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
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
    fill(216,215,173);
  } else {
    fill(69);
  }
  if(isSelectable){
    stroke(255);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(255);
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