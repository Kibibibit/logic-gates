


HashMap<String, Gate> gates;

ArrayList<Frame> frames;


Gate newGate(String gate) {
  return gates.get(gate).clone(); 
}

void setup() {
  
  size(1200,900); 
  
  JSONLoader loader = new JSONLoader();  
  
  gates = new HashMap<String, Gate>();
  
  ArrayList<String> jsons = loader.getJSONPaths();
  
  for (String json : jsons) {
     System.out.println(json); 
     Gate gate = new Gate(json);
     gates.put(gate.getName(), gate);
  }
  
  
  frames = new ArrayList<Frame>();
  
  Frame topBar = new Frame(new Box(0,0,width,50));
  Frame sideMenu = new Frame(new Box(0,50,200,height-50));
  sideMenu.setFill(160);
  
  Frame mainView = new Frame(new Box(200,50,width-200,height-50));
  mainView.setFill(20);
  
  frames.add(topBar);
  frames.add(sideMenu);
  frames.add(mainView);
  
}



void draw() {
  
  fill(0);
  stroke(0);
  strokeWeight(0);
  clear();
  background(20);
  
  for (Frame frame : frames) {
     frame.draw(); 
  }
  
  
}
