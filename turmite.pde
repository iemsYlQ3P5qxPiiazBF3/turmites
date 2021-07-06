int[][] grid;
int x;
int y;
int dir = 0;
String state = "A";

void setup(){
  background(255);
  size(256, 256);
  grid = new int[width][height];
  x = width/2;
  y = height/2;
  grid[x][y] = 128;
}

void north(){
  y--;
  if(y < 0){
    y = height - 1;
  }
}

void south(){
  y++;
  if(y >= height){
    y = 0;
  }
}

void east(){
  x++;
  if(x >= width){
    x = 0;
  }
}

void west(){
  x--;
  if(x < 0){
    x = width - 1;
  }
}

void f1(){
  if(dir == 0){
    north();
  }else if(dir == 1){
    east();
  }else if(dir == 2){
    south();
  }else{
    west();
  }
}

void b1(){
  if(dir == 0){
    dir = 2;
    south();
  }else if(dir == 1){
    dir = 3;
    west();
  }else if(dir == 2){
    dir = 0;
    north();
  }else if(dir == 3){
    dir = 1;
    east();
  }
}

void cc90(){
  if(dir == 0){
    dir = 3;
    west();
  }else if(dir == 1){
    dir = 0;
    north();
  }else if(dir == 2){
    dir = 1;
    east();
  }else if(dir == 3){
    dir = 2;
    south();
  }
}

void c90(){
  if(dir == 0){
    dir = 1;
    east();
  }else if(dir == 1){
    dir = 2;
    south();
  }else if(dir == 2){
    dir = 3;
    west();
  }else if(dir == 3){
    dir = 0;
    north();
  }
}

//No change in direction:
void b1n(){
  if(dir == 0){
    south();
  }else if(dir == 1){
    west();
  }else if(dir == 2){
    north();
  }else if(dir == 3){
    east();
  }
}

void cc90n(){
  if(dir == 0){
    west();
  }else if(dir == 1){
    north();
  }else if(dir == 2){
    east();
  }else if(dir == 3){
    south();
  }
}

void c90n(){
  if(dir == 0){
    east();
  }else if(dir == 1){
    south();
  }else if(dir == 2){
    west();
  }else if(dir == 3){
    north();
  }
}



void rules(){
  if(grid[x][y] == 0){
    grid[x][y] = 128;
  }
  if(state == "A"){
    if(grid[x][y] == 128){
      grid[x][y] = 255;
      b1n();
      c90();
    }else if(grid[x][y] == 255){
      grid[x][y] = 128;
      cc90();
      state = "B";
    }
    }else if(state == "B"){
      if(grid[x][y] == 128){
        grid[x][y] = 255;
        //f1();
        c90();
      }else if(grid[x][y] == 255){
        grid[x][y] = 128;
        c90n();
        f1();
        state = "A";
    }
  }
}

void draw(){
  rules();
  //background(255);
  noStroke();
  println(grid[x][y], x, y);
  rect(x, y, 1, 1);
  fill(grid[x][y]);
}
