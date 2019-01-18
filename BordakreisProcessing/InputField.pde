//Class InputField handles input for angle, distance1 and distance2

class InputField {
  String label;
  float x;    // left  x position
  float y;    // left y position
  float w;    // width of line
  float h;    // right y position of line
  
  boolean isActive= false;  //isActive=true -> inputfield is displayed as normal, isActive=false -> inputfield is greyed out
  
  //Constructor
  InputField(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
  void Draw() {
    if(isActive){  //true = sets colour to nomral dark grey
      stroke(69);
      fill(69);
    }else{  //else sets colour to light grey
      stroke(200);
      fill(200);
    }
    strokeWeight(2);
    line(x, y+h, x+w, y+h);  //sets line below input number
    textAlign(CENTER, CENTER);  //sets alignment of displayed value
    text(label, x + (w / 2), y + (h / 2));  //sets text of displayed value
  }
    
  void setLabel(String newLabel){
    label = newLabel;
  }
  
  boolean isActive(){
    return isActive;
  }
  
  void turnActive(){
    isActive = true;
  }
  void turnInactive(){
    isActive = false;
  }
}

//draws blinking line next to value, indicating that any input over keyboard is written at this position
public void drawBlinkingLine(float x, float y){  
    stroke(0);
    float modifier = placementModifier(); //modifier changes position of line with new input
    if(frameCount%60<30)line(x+modifier+30, y+30, x+modifier+30, y+70); //draws line on average every second frame, makes line blinking
  }
  //adds modifier to x axis of blinking line, for it to stay with the written text, works up to 4 digits of input
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
        return 3000; // if input size larger than 4, line will be pushed ofscreen
    }
  }