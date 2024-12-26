//
//  SentryResult.swift
//  SwiftSentry
//
//  Created by Yuma decaux on 25/12/2024.
//


import Foundation

public struct SentryResult:Codable {
    var closeApproach:CloseApproach?
    var stateVector:StateVectorData?
    var observerData:ObserverData?
    var orbitalElements:OrbitalElementsData?
    var physicalData:PhysicalData?
    var list:SentryResultList?

    public mutating func setCloseApproach(_ value: CloseApproach?) {
        self.closeApproach = value
    }
    
    public mutating func setStateVector(_ value: StateVectorData?) {
        self.stateVector = value
    }
    
    public mutating func setObserverData(_ value: ObserverData?) {
        self.observerData = value
    }
    
    public mutating func setOrbitalElements(_ value: OrbitalElementsData?) {
        self.orbitalElements = value
    }

    public mutating func setPhysicalData(_ value: PhysicalData?) {
        self.physicalData = value
    }

    public mutating func setResultList(_ value: SentryResultList?) {
        self.list = value
    }

}


public struct CloseApproach: Codable {
    let object: CloseApproachObject
}

public struct CloseApproachObject: Codable {
    let id: String
    let fullname: String
    let absoluteMagnitude: Double
    let diameterMinKm: Double
    let diameterMaxKm: Double
    let closeApproaches: [CloseApproach]
}


public struct StateVectorData: Codable {
    let object: StateVectorObject
    let vectors: [StateVector]
}

public struct StateVectorObject: Codable {
    let id: String
    let fullname: String
}

public struct StateVector: Codable {
    let time: String
    let position: Position
    let velocity: Velocity
}

public struct Position: Codable {
    let x: Double
    let y: Double
    let z: Double
}

public struct Velocity: Codable {
    let vx: Double
    let vy: Double
    let vz: Double
}


public struct ObserverData: Codable {
    let object: ObserverObject
    let observerData: [Observer]
}

public struct ObserverObject: Codable {
    let id: String
    let fullname: String
}

public struct Observer: Codable {
    let time: String
    let ra: Double // Right Ascension
    let dec: Double // Declination
    let magnitude: Double
    let distanceAu: Double
}


public struct OrbitalElementsData: Codable {
    let object: OrbitalObject
    let orbitalElements: OrbitalElements
}

public struct OrbitalObject: Codable {
    let id: String
    let fullname: String
}

public struct OrbitalElements: Codable {
    let epoch: String
    let semiMajorAxisAu: Double
    let eccentricity: Double
    let inclinationDeg: Double
    let ascendingNodeLongitudeDeg: Double
    let perihelionArgumentDeg: Double
    let meanAnomalyDeg: Double
    let orbitalPeriodDays: Double
    let perihelionDistanceAu: Double
    let aphelionDistanceAu: Double
}


public struct PhysicalData: Codable {
    let object: PhysicalObject
}

public struct PhysicalObject: Codable {
    let id: String
    let fullname: String
    let absoluteMagnitude: Double
    let diameterMinKm: Double
    let diameterMaxKm: Double
    let albedo: Double
    let rotationPeriodHours: Double?
}


public struct SentryResultList: Codable {
    let count: String
    let data: [SentryListResult]
    let signature:SentrySignature
}

public struct SentryListResult: Codable {
    let id: String
    let range: String
    let des: String
    let fullname: String
    let diameter: String
    let lastObs: String
    let psCum: String
    let ip: String
    let psMax: String
    let nImp: Int
    let h: String
    var tsMax: String?
    let lastObsJD: String
    let vInf: String
    
    // Map snake_case keys to camelCase properties
    enum CodingKeys: String, CodingKey {
        case id, range, des, fullname, diameter
        case lastObs = "last_obs"
        case psCum = "ps_cum"
        case ip
        case psMax = "ps_max"
        case nImp = "n_imp"
        case h
        case tsMax = "ts_max"
        case lastObsJD = "last_obs_jd"
        case vInf = "v_inf"
    }
}

public     struct SentrySignature:Codable {
    let version:String
    let source:String
}

