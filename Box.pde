public class Box {
   
  private Point pos;
  private Point size;
  
  
  public Box(float x, float y, float w, float h) {
   
    this.pos = new Point(x,y);
    this.size = new Point(x+w,y+h);
    
  }
  
  public void draw() {
   
    rect(pos.getX(),pos.getY(),size.getX(),size.getY());
    
  }
  
  public Point getPos() {
     return this.pos;
  }
  
  public Point getSize() {
    return this.size;
  }
  
  public boolean inBox(float xx, float yy) {
   
    return xx > pos.getX() && 
           xx < pos.getX()+size.getX() &&
           yy > pos.getY() &&
           yy < pos.getY()+size.getY();
    
  }
  
  public boolean inBox(Point point) {
   return inBox(point.getX(), point.getY());
  }
  
  
  
}
