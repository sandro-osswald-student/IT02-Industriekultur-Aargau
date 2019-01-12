import controlP5.*;

int xpos = 1000;
int ypos = 580; 


Button num1 = new Button("1",xpos, ypos,100,100);
Button num2 = new Button("2",xpos+100, ypos,100,100);
Button num3 = new Button("3",xpos+200, ypos,100,100);
Button num4 = new Button("4",xpos, ypos+100,100,100);
Button num5 = new Button("5",xpos+100, ypos+100,100,100);
Button num6 = new Button("6",xpos+200, ypos+100,100,100);
Button num7 = new Button("7",xpos, ypos+200,100,100);
Button num8 = new Button("8",xpos+100, ypos+200,100,100);
Button num9 = new Button("9",xpos+200, ypos+200,100,100);
Button num0 = new Button("0",xpos, ypos+300,100,100);
Button deleteButton = new Button("delete",xpos+100, ypos+300,200,100);
//Button bestaetigen = new Button("Bestätigen", xpos+350, ypos+300, 200, 100);



String number = "";
String distanceStr1 = "";
String distanceStr2 = "";
String angleStr = "";


//ControlP5 cp5;
 

void drawNumPad(){
  
  num1.Draw();
  num2.Draw();
  num3.Draw();
  num4.Draw();
  num5.Draw();
  num6.Draw();
  num7.Draw();
  num8.Draw();
  num9.Draw();
  num0.Draw();
  deleteButton.Draw();
  //bestaetigen.Draw();
 
}

public String getNumber(){
  return number;
}
public void clearNumber(){
  number = "";
}

/* add Texfield for strings
void addTextfields(){
  cp5 = new ControlP5(this);
  cp5.addTextfield("textInput_1").setPosition(20, 100).setSize(200, 40).setAutoClear(false);
  cp5.addTextfield("textInput_2").setPosition(20, 170).setSize(200, 40).setAutoClear(false);
  cp5.addBang("Submit").setPosition(240, 170).setSize(80, 40);    
 
}
*/



private static String deleteLastElement(String number) {
  if (number != null && number.length() > 0) {
    return number = number.substring(0,number.length() - 1);
  }
  return number;
}

void isNumberHit(){
  if (num1.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    number += "1";
    println(number);
  }
  if (num2.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    number += "2";
    println(number);
  }
  if (num3.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    number += "3";
    println(number);
  }
  if (num4.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    number += "4";
    println(number);
  }
  if (num5.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    number += "5";
    println(number);
  }
  if (num6.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    number += "6";
    println(number);
  }
  if (num7.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    number += "7";
    println(number);
  }
  if (num8.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    number += "8";
    println(number);
  }
  if (num9.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    number += "9";
    println(number);
  }
  if (num0.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    number += "0";
    println(number);
  }
  if (deleteButton.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    number = deleteLastElement(number);
    println(number);
  }
  /*
  if(bestaetigen.MouseIsOver()){
      if(getNumberState() == 1){
        distanceInt1= Integer.parseInt(getNumber());
        setNumberState(0);
      }else if(numberState == 2) {
        distanceInt2= Integer.parseInt(getNumber());
        setNumberState(0);
      }
      //clearNumber();
    }
    */
}

  void keyPressed() {
    println(getGameState());
    
    if(getGameState() >= 0 && getGameState() < 4){
    
      if (key >= '0' && key <= '9') {
        number +=key;
      }else if (key == BACKSPACE){
        number = deleteLastElement(number);
      }else if (key == ENTER && next.canBeSelected()){
       next();
      } 
  
    }
}