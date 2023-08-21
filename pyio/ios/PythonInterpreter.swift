import Foundation
import PythonKit

class PythonInterpreter {
    func runScript(_ script: String) -> String {
        PythonLibrary.useVersion(3)
        let sys = Python.import("sys")
        
        // Capture the current stdout
        let originalStdout = sys.stdout
      let capturedOutput: PythonObject = PythonObject("")
        sys.stdout = capturedOutput
        
        // Execute the Python script
        do {
            _ = try Python.eval(script)
        } catch {
            print("Python evaluation error: \(error)")
        }
        
        // Reset stdout to its original value
        sys.stdout = originalStdout
        
        // Return the captured output
        return String(capturedOutput) ?? "null"
        }
}

