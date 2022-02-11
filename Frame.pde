
public class Frame {
  
  private Box box;
  private int strokeWeight = 3;
  private int stroke = 100;
  private int fill = 120;
  
  
  public Frame(Box box) {
   
    this.box = box;
    
  }
  
  
  public void draw() {
   
    stroke(stroke);
    strokeWeight(strokeWeight);
    fill(fill);
    this.box.draw();
    
  }
  
    
  public int getStrokeWeight() {
   return this.strokeWeight; 
  }
  
  public void setStrokeWeight(int weight) {
    this.strokeWeight = weight; 
  }
  
  public int getStroke() {
     return this.stroke;
  }
  
  public void setStroke(int stroke) {
    this.stroke = stroke; 
  }
  
  public int getFill() {
    return this.fill; 
  }
  
  public void setFill(int fill) {
    this.fill = fill; 
  }
  
  public boolean inFrame(int xx, int yy) {
    return this.box.inBox(xx,yy); 
  }
  
  public boolean inFrame(Point point) {
    return this.box.inBox(point); 
  }
  
  
}
