import Foundation
import React

@objc(PythonRunnerModule)
class PythonRunnerModule: NSObject, RCTBridgeModule {
    @objc static override func moduleName() -> String {
        return "PythonRunnerModule"
    }

    @objc func runPythonScript(_ script: String, resolver: @escaping RCTPromiseResolveBlock, rejecter: @escaping RCTPromiseRejectBlock) {
        let pythonInterpreter = PythonInterpreter()
        let result = pythonInterpreter.runScript(script)       
        resolver(result)
    }

    @objc static func requiresMainQueueSetup() -> Bool {
        return true
    } 
}