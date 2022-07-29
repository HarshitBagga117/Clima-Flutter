import 'dart:io';

void main(){
  performTasks();
}
void performTasks(){
  task1();
  task2();
  task3();
}

void task1(){
String result="Task1 complete";
print(result);
}
void task2(){
  Duration threeSeconds=Duration(seconds: 3);
  Future.delayed(threeSeconds,(){
    String result="Task2 complete";
    print(result);
  });

}
void task3(){
  String result="Task3 complete";
  print(result);
}