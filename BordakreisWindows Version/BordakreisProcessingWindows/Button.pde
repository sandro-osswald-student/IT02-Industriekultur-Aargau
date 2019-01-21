class Button {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  boolean isSelectable;  //if button can be selected and highlighted or not
  
  Button(String labelB, float xpos, float ypos) {
    label = labelB;
    x = xpos;
    y = ypos;
    h = 20;
    isSelectable = true;
  }
  
  void Draw() {
    if (MouseIsOver()) {  //draws button in gold colour when hovered above
    fill(216,215,173);  
    stroke(216,215,173);
    } else {
    }
  textSize(48);
  strokeWeight(1);
  textAlign(LEFT);
  if(isSelectable){ //draws button in dark grey colour if selectable
    if(!MouseIsOver()){ //draws button in standard colour (dark grey) when not hovered above
    fill(69);
    stroke(69);
    }
    line(x, y+3, x+textWidth(label), y+3);    
    text(label, x, y);
  }else{  //makes button greyed out if not selectable
    fill(200);
    stroke(200);
    line(x, y, x+textWidth(label), y);
    text(label, x, y);
    }
  }
  
  //checks if mouse is above button
  boolean MouseIsOver() {
    if (mouseX > x-10 && mouseX < (x + textWidth(label)+10) && mouseY > y-textAscent()-10 && mouseY < y+10 ){    //decides clickable area with width and height (textAscent) of text
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