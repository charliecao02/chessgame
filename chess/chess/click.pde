void mouseClicked() {
  clickrow = mouseY/scale;
  clickcol = mouseX/scale;
  if(selected==false) selected=true;
  else if(selected==true) selected=false;
  selectedtype=grid[clickrow][clickcol];
  println(selectedtype,selected);
}
