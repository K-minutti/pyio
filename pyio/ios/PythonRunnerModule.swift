import Foundation
import React

@objc(PythonRunnerModule)
class PythonRunnerModule: NSObject, RCTBridgeModule {
    static func moduleName() -> String {
        return "PythonRunnerModule"
    }

    @objc func runPythonScript(_ script: String, resolver: @escaping RCTPromiseResolveBlock, rejecter: @escaping RCTPromiseRejectBlock) {
        let pythonInterpreter = PythonInterpreter()
        let result = pythonInterpreter.runScript(script)       
        resolver(result)
    } 
}