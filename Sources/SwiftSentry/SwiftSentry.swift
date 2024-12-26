import Foundation


public enum SentryError:Error {
    case NoSuchObject
    case noConnection
    case RequestError
    case OK
}

public struct SentrySyslog:CustomStringConvertible {
    let log:SentryError
    let message:String
    let timecode:String
    
    init( log: SentryError, message: String) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy--MM-dd hh:mm:ss"
        self.timecode = dateFormatter.string(from: date)

        self.log = log
                  self.message = message
        print("Sentry: \(log) \(message)")
    }
    
    public var description:String {
        return "\(log): \(message)"
    }
}

public final class SwiftSentry:NSObject, @unchecked Sendable {
    
    internal var buffer:Int = 0
    public var progress:Float?
    internal var expectedContentLength:Int?
    
    public var sysLog:[SentrySyslog]!
    
    public override init() {
        self.sysLog = [SentrySyslog]()
    }

    
    public func printLogs() {
        for log in sysLog {
            print(log.description)
        }
    }

}

extension SwiftSentry: URLSessionDelegate {
 
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        expectedContentLength = Int(response.expectedContentLength)
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        buffer += data.count
        let percentageDownloaded = Float(buffer) / Float(expectedContentLength!)
           progress =  percentageDownloaded
    }

    
}
