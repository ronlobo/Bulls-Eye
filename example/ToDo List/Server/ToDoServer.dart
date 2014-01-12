import '../../../lib/BullsEyeServer/bulls_eye_server.dart';
import 'RouteDefenitions.dart';
import 'ServerLogic.dart';

void main() {
  
  // Create Server Logic
  var logic = new ServerLogic();
  
  // Init Server
  var server = new Server(debug: true);
  
  // Register routes
  server..route("GET", cssPath, new LoadFile.fromUrl(), contentTypes: ["text/css"]) // Only CSS allowed
        ..route("GET", jsPath, new LoadFile.fromUrl())
        ..route("GET", dartPath, new LoadFile.fromUrl())
        ..route("GET", jshome, new LoadFile.fromPath("client/jshome.html"))
        ..route("GET", darthome, new LoadFile.fromPath("client/darthome.html"))
        ..route("GET", about, new ExecuteCode(logic.aboutRouteLogic));
  
  // Start Server
  server.start();
  
}
