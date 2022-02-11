
public class JSONLoader {
  
  
  private final static String EXT = ".json";
  //private final static String PATH = "/home/danielmills/sketchbook/logicGates/data";
  private final static String PATH = "E:/FunOrUsefulPrograms/processing-4.0b5-windows-x64/processing-4.0b5/sketchbook/logicGates/data";
  
  
  
  public ArrayList<String> getJSONPaths() {
    
    File dir = new File(PATH);
    
    ArrayList<String> output = new ArrayList<String>();
    
    File[] files = dir.listFiles();
    
    for (File file : files) {
        
      if (file.getName().endsWith(EXT)) {
        output.add(file.getAbsolutePath()); 
      }
        
    }
    
    return output;
    
  }
  
  
}
