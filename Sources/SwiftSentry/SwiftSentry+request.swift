//
//  SwiftSentry+request.swift
//  SwiftSentry
//
//  Created by Yuma decaux on 25/12/2024.
//

import Foundation


extension SwiftSentry {
    
    /** request returned data check
     */
    private func requestIsValid(error: Error?, response: URLResponse?, url: URL? = nil) -> Bool {
        var gotError = false
        if error != nil {
            self.sysLog.append(SentrySyslog(log: .RequestError, message: error!.localizedDescription))
            gotError = true
        }
        if (response as? HTTPURLResponse) == nil {
            self.sysLog.append(SentrySyslog(log: .RequestError, message: "response timed out"))
            gotError = true
        }
        let urlResponse = (response as! HTTPURLResponse)
        if urlResponse.statusCode != 200 {
            let error = NSError(domain: "com.error", code: urlResponse.statusCode)
            self.sysLog.append(SentrySyslog(log: .RequestError, message: error.localizedDescription))
            gotError = true
        }
        if !gotError {
            let message = url != nil ? url!.absoluteString : "data"
            self.sysLog.append(SentrySyslog(log: .OK, message: "\(message) downloaded"))
        }
        return !gotError
    }
    
    public func getSentryData(target: String, startTime: String, stopTime: String, stepSize: String = "5m", tableType: TableType = .closeApproach, closure: @escaping (SentryResult)-> Void) {
        /** Gets a single target sentry data
         Params:
         target: target name (asteroid in horizons syntax)
         startTime: Start time of sentry data evaluation
         stopTime: stop time of sentry data evaluation
         stepSize: time per step
         tableType: type of data to return (see TableType enum)
         closure: the resulting json data
         */
        let request = SentryRequest(target: target, startTime: startTime, stopTime: stopTime, stepSize: stepSize, tableType: tableType)
        let configuration = URLSessionConfiguration.ephemeral
        let queue = OperationQueue.main
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: queue)
        
        print(request.getUrl().absoluteString)
        let task = session.dataTask(with: request.getUrl()) { [weak self] data, response, error in
            
            var result = SentryResult()
            print(String(data: data!, encoding: .ascii))
            if self!.requestIsValid(error: error, response: response) {
                switch tableType {
                case .closeApproach:
                    result.setCloseApproach(try! JSONDecoder().decode(CloseApproach.self, from: data!))
                case .stateVector:
                    result.setStateVector(try! JSONDecoder().decode(StateVectorData.self, from: data!))
                case .observer:
                    result.setObserverData(try! JSONDecoder().decode(ObserverData.self, from: data!))
                case .orbitalElements:
                    result.setOrbitalElements(try! JSONDecoder().decode(OrbitalElementsData.self, from: data!))
                case .physical:
                    result.setPhysicalData(try! JSONDecoder().decode(PhysicalData.self, from: data!))
                }
                
                self?.sysLog.append(SentrySyslog(log: .OK, message: "target \(target) \(tableType.rawValue)) downloaded"))
            }
            closure(result)
            return
        }
        task.resume()
    }
    
}
