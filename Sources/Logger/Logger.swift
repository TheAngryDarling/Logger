import Foundation


/**
 Protocol for defining a logging object.
 When supporting logging within an object, please store reference as this protocol instead of concreate logger type.
 That way the actaul logger is interchangeable, and new logger types can be created and used down the road with no change
 to the objects
*/
public protocol Logger {
    /*
     Log a message.  Do not call this method directly.  This is outlined so that concrete types that implement Logger have this method.
     Instead, please call the log(messaeg, level) helper method insetad.
     - parameters:
         - message: The message to log
         - level: The log level to use
         - filename: The name of the file this is being called from
         - line: The line number in the file that this method was called
         - funcname: The name of the function that called this function
     */
    func logMessage(message: String, level: LogLevel, filename: String, line: Int, funcname: String, additionalInfo: [String: Any])
}

public extension Logger {
    /*
     Log a message.  This calls the logMessage method on the instance of the logger
     - parameters:
        - message: The message to log
        - level: The log level to use
        - filename: The name of the file this is being called from (Defaults to #file)
        - line: The line number in the file that this method was called (Defaults to #line)
        - funcname: The name of the function that called this function (Defaults to #function)
    */
    public func log(_ message: String,
                    _ level: LogLevel = .info,
                    filename: String = #file,
                    line: Int = #line,
                    funcname: String = #function,
                    additionalInfo: [String: Any] = [:]) {
        self.logMessage(message: message, level: level, filename: filename, line: line, funcname: funcname, additionalInfo: additionalInfo)
    }
}
