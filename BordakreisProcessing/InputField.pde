class InputField {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  
  boolean isSelected= false;
  
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
  if(isSelected){  
   if (MouseIsOver()) {
    fill(0,selectedColorHigh, 0);
  }else {
    fill(0, selectedColor, 0);
  }
  }else{
    if (MouseIsOver()) {
    fill(highColor);
  }else {
    fill(normalColor);
  }
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
  
  boolean getIsSelected(){
    return isSelected;
  }
  
  void changeSelection(){
    isSelected = !isSelected;
  }
}