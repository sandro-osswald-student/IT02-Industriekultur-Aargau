//handles input form keyboard

String number = ""; //any input is written into this variable

public String getNumber(){
  return number;
}
public void clearNumber(){
  number = "";
}

private static String deleteLastElement(String number) { //deletes last character of the number string
  if (number.length() > 0) { 
    return number = number.substring(0,number.length() - 1); //deletes last character in String
  }
  return number;
}
  
void keyPressed() { 
  if(getGameState() >= 0 && getGameState() < 4 && screenState != 0){ //while game is active, inputs via number keys, enter key and backspace key are possible 
    if (key >= '0' && key <= '9') {
      if(number.length()<= 1 ){number +=key;}
    }else if (key == BACKSPACE){
      number = deleteLastElement(number);
    }else if (key == ENTER && next.canBeSelected()){ //enter key activates next buttons, if next buttons are available
     next();
    } 
      
  }
}