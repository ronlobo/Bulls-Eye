part of softhai.bulls_eye.Server;

class LoadFile implements RouteLogic {
  
  String _filePath;
  
  LoadFile.fromUrl();
    
  LoadFile.fromPath(this._filePath);
  
  Future execute(ReqResContext context) 
  {
    var filePath = this._filePath; 
    
    if(filePath == null)
    {
      // Try to find a wildcard variable
      filePath = context.variables.routeVariables["*"];
    }
    
    if(filePath != null) {
      final File file = new File(filePath);
      return file.exists().then((bool found) {
        if (found) 
        {
          return file.openRead().pipe(context.request.response);
        } 
        else 
        {
          context.HandleError(new FileNotFoundException(context.request, filePath, context.currentRoute));
        }
      });
    }
  }
}