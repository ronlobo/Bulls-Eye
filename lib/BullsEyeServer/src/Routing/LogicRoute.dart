part of softhai.bulls_eye.Server;

typedef bool LogicCall(RouteContext context);

class LogicRoute extends Route {
  
  LogicCall _logicCall;
  
  LogicRoute(common.RouteDef routeDefenition, this._logicCall, [List<String> methods, List<String> contentTypes]) : super(routeDefenition, methods, contentTypes) {
    
  }
  
  bool _internalExecute(RouteContext context) 
  {
    return this._logicCall(context);
  }
}