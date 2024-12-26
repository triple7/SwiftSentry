//
//  Untitled.swift
//  SwiftSentry
//
//  Created by Yuma decaux on 26/12/2024.
//

extension SwiftSentry {
    
    public func getSentryList(result: @escaping (SentryResultList) -> Void) {
        getSentryData(parameters: [:], closure: { json in
            result(json.list!)
        })
    }

    public func getTargetSentryData(target: String, result: @escaping (SentryImpact) -> Void) {
        getSentryData(parameters: ["des": target], tableType: .Impactprobability, closure: { json in
            result(json.sentryImpact!)
        })
    }
    
}
