//
//  SentryResult.swift
//  SwiftSentry
//
//  Created by Yuma decaux on 25/12/2024.
//


import Foundation

public struct SentryResult:Codable {
    public var closeApproach:CloseApproach?
    public var stateVector:StateVectorData?
    public var observerData:ObserverData?
    public var orbitalElements:OrbitalElementsData?
    public var physicalData:PhysicalData?
    public var list:SentryResultList?
    public var sentryImpact:SentryImpact?

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

    public mutating func setSentryImpact(_ value: SentryImpact?) {
        self.sentryImpact = value
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
    public let count: String
    public let data: [SentryListResult]
    public let signature:SentrySignature
}

public struct SentryListResult: Codable {
    public let id: String
    public let range: String
    public let des: String
    public let fullname: String
    public let diameter: String
    public let lastObs: String
    public let psCum: String
    public let ip: String
    public let psMax: String
    public let nImp: Int
    public let h: String
    public var tsMax: String?
    public let lastObsJD: String
    public let vInf: String
    
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

public struct SentryImpact: Codable {
    let data: [ImpactData]
    let signature: SentrySignature
    let summary: Summary
    
    }

public struct ImpactData: Codable {
    let ps: String
    let ip: String
    let energy: String
    let ts: String
    let date: String
    let sigmaVi: String
    
    enum CodingKeys: String, CodingKey {
        case ps, ip, energy, ts, date
        case sigmaVi = "sigma_vi"
    }
}


public struct Summary: Codable {
    let diameter: String
    let tsMax: String
    let psCum: String
    let ip: String
    let vImp: String
    let nobs: Int
    let energy: String
    let nImp: Int
    let pdate: String
    let mass: String
    let method: String
    let cdate: String
    let ndel: Int
    let fullname: String
    let nsat: String
    let h: String
    let firstObs: String
    let ndop: Int
    let lastObs: String
    let des: String
    let darc: String
    let vInf: String
    let psMax: String
    
    enum CodingKeys: String, CodingKey {
        case diameter
        case tsMax = "ts_max"
        case psCum = "ps_cum"
        case ip
        case vImp = "v_imp"
        case nobs
        case energy
        case nImp = "n_imp"
        case pdate
        case mass
        case method
        case cdate
        case ndel
        case fullname
        case nsat
        case h
        case firstObs = "first_obs"
        case ndop
        case lastObs = "last_obs"
        case des
        case darc
        case vInf = "v_inf"
        case psMax = "ps_max"
    }
}
