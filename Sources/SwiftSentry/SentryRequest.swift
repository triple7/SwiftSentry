//
//  SentryParams.swift
//  SwiftSentry
//
//  Created by Yuma decaux on 25/12/2024.
//


import Foundation

public struct SentryParams: Codable {
    let command: String        // The object identifier (e.g., asteroid name or designation)
    let startTime: String      // The start time for the query in ISO 8601 format (e.g., "2024-01-01")
    let stopTime: String       // The stop time for the query in ISO 8601 format (e.g., "2024-12-31")
    let stepSize: String       // The step size for data generation (e.g., "1d", "1h")
    let tableType: TableType      // The type of table requested (e.g., "CA" for close-approach data)
}


public struct OrbitParams: Codable {
    let semiMajorAxis: Double         // Semi-major axis in AU
    let eccentricity: Double          // Orbital eccentricity
    let inclination: Double           // Orbital inclination in degrees
    let perihelionDistance: Double    // Perihelion distance in AU
    let aphelionDistance: Double      // Aphelion distance in AU
    let orbitalPeriod: Double         // Orbital period in years
    let meanAnomaly: Double           // Mean anomaly in degrees
    let argumentOfPerihelion: Double  // Argument of perihelion in degrees
    let ascendingNodeLongitude: Double // Longitude of ascending node in degrees
}


public struct SentryRequest {
    /** Sentry request formatter
     Creates a request Url from the API and configured parameters, with start and end time
     */
private let APIUrl = "https://ssd-api.jpl.nasa.gov/sentry.api"
    private(set) var parameters:[String: String]

    public init(target: String, startTime: String, stopTime: String, stepSize: String, tableType: TableType) {
        self.parameters = [
            "des": target,
        ]
    }
    
    public func getUrl() -> URL {
        var url = URLComponents(string: APIUrl)
        url!.queryItems = Array(parameters.keys).map {URLQueryItem(name: $0, value: parameters[$0]!)}
        return url!.url!
    }

}

