
public class Node implements UpdateInterface {
  
  private boolean state = false;
  private String name = "";
  private boolean input = false;
  private int index;
  
  private ArrayList<UpdateInterface> outputs;
  
  
  public Node(String name, boolean input, int index) {
    this.name = name; 
    this.input = input;
    this.outputs = new ArrayList<UpdateInterface>();
    this.index = index;
    this.update(this.state);
  }
  
  
  public Node clone() {
    Node out = new Node(this.name,this.input,this.index);
    
    out.update(out.state);
    
    return out;
    
  }
  
  public Node clone(UpdateInterface output) {
   
    Node out = this.clone();
    
    out.getOutputs().add(output);
    
    return out;
    
  }
  
  
  @Override
  public void update(boolean newState) {
    //boolean pState = this.state;
    this.state = newState;
   
    //if (pState != state) {
      for (UpdateInterface o : outputs) {
        o.update(state);
      }
    //} 
  }
  public int getIndex() {
     return this.index; 
  }
  
  public boolean getInput() {
     return this.input; 
  }
  
  public boolean getState() {
     return this.state; 
  }
  
  public String getName() {
     return this.name; 
  }
  
  public ArrayList<UpdateInterface> getOutputs() {
     return this.outputs; 
  }
  
  
  
}
