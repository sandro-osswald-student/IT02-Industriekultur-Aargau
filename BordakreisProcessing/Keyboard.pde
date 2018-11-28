Button num1 = new Button("1",600, 500,100,100);
Button num2 = new Button("2",700, 500,100,100);
Button num3 = new Button("3",800, 500,100,100);
Button num4 = new Button("4",600, 600,100,100);
Button num5 = new Button("5",700, 600,100,100);
Button num6 = new Button("6",800, 600,100,100);
Button num7 = new Button("7",600, 700,100,100);
Button num8 = new Button("8",700, 700,100,100);
Button num9 = new Button("9",800, 700,100,100);
Button num0 = new Button("0",600, 800,100,100);
Button deleteButton = new Button("delete",700, 800,200,100);

String number = "";

void numInput(){
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
}

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
  if (deleteButton.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    number = deleteLastElement(number);
    println(number);
      }
}

void hoverNum(){
  if (num1.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    
  }
}
