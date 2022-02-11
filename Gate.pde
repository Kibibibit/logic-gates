public class Gate implements UpdateInterface {
  
  private String name;
  
  private HashMap<Integer,Node> inputs;
  private HashMap<Integer,Node> outputs;
  
  private HashMap<String,String> truthTable;
  
  private String jsonPath;
  
  private void init() {
    this.truthTable = new HashMap<String,String>();
    
    this.inputs = new HashMap<Integer,Node>();
    this.outputs = new HashMap<Integer,Node>();
    
  }
  
  private Gate() {
    this.init();
  }
  
  public Gate(String jsonPath) {
   
    this.jsonPath = jsonPath;
    this.init();
    
    JSONObject json = loadJSONObject(jsonPath);
    
    this.name = json.getString("name");
    JSONArray nodes = json.getJSONArray("nodes");
    
    for (int i = 0; i < nodes.size(); i++) {
       JSONObject nodeJson = nodes.getJSONObject(i);
       
       Node node = new Node(
         nodeJson.getString("name"),
         nodeJson.getBoolean("input"),
         nodeJson.getInt("index")
       );
       
       
       if (node.getInput()) {
         inputs.put(node.getIndex(),node);
       } else {
         outputs.put(node.getIndex(),node); 
       }
       
    }
    
    JSONObject jsonTable = json.getJSONObject("table");
    
    String[] keys = (String[]) jsonTable.keys().toArray(new String[jsonTable.size()]);
    
    for (String k : keys) {
      truthTable.put(k,jsonTable.getString(k));
    }
    
  }
  
  
  public Gate clone() {
     
    Gate out = new Gate();
    
    out.setName(this.getName());
    out.setJsonPath(this.getJsonPath());
    
    //Clone maps
    
    
    return out;
    
    
  }
  
  
  @Override
  public void update(boolean newState) {
     String in = "";
     for (int i = 0; i < inputs.size(); i++) {
        boolean state = inputs.get(i).getState();
        if (state) {
          in += "1"; 
        } else {
         in += "0"; 
        }
     }
     
     String out = truthTable.get(in);
     
     for (int i = 0; i < outputs.size(); i++) {
       boolean bit = out.charAt(i) == '1';
       
       outputs.get(i).update(bit);
     }
     
  }
  
  public String getName() {
     return this.name; 
  }
  
  public HashMap<String,String> getTruthTable() {
     return this.truthTable; 
  }
  
  public String getJsonPath() {
    return this.jsonPath; 
  }
  
  public HashMap<Integer,Node> getInputs() {
    return this.inputs; 
  }
  
  public HashMap<Integer,Node> getOutputs() {
    return this.outputs; 
  }
  
  public void setName(String name) {
    this.name = name;
  }
   
  public void setJsonPath(String jsonPath) {
    this.jsonPath = jsonPath; 
  }
  
  
  
}
