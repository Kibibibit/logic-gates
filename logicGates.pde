


HashMap<String, Gate> gates;

void setup() {
  JSONLoader loader = new JSONLoader();  
  
  gates = new HashMap<String, Gate>();
  
  ArrayList<String> jsons = loader.getJSONPaths();
  
  for (String json : jsons) {
     System.out.println(json); 
     Gate gate = new Gate(json);
     gates.put(gate.getName(), gate);
  }
  
  
  
}



void draw() {
  
  
  
}
