//
//  ImpactParameters.swift
//  SwiftSentry
//
//  Created by Yuma decaux on 26/12/2024.
//


public enum ImpactParameters: String, Codable {
    case ps = "ps"
    case ip = "ip"
    case energy = "energy"
    case ts = "ts"
    case date = "date"
    case sigmaVi = "sigma_vi"
    case diameter = "diameter"
    case tsMax = "ts_max"
    case psCum = "ps_cum"
    case vImp = "v_imp"
    case nobs = "nobs"
    case nImp = "n_imp"
    case pdate = "pdate"
    case mass = "mass"
    case method = "method"
    case cdate = "cdate"
    case ndel = "ndel"
    case fullname = "fullname"
    case nsat = "nsat"
    case h = "h"
    case firstObs = "first_obs"
    case lastObs = "last_obs"
    case des = "des"
    case darc = "darc"
    case vInf = "v_inf"
    case psMax = "ps_max"

    var description: String {
        switch self {
        case .ps: return "Palermo Scale, a logarithmic measure of impact risk."
        case .ip: return "Impact Probability, the likelihood of a potential collision."
        case .energy: return "Impact Energy, the estimated energy released upon collision (in megatons of TNT)."
        case .ts: return "Torino Scale, a simplified scale for classifying asteroid impact threats."
        case .date: return "The date and time (in UTC) of the potential impact."
        case .sigmaVi: return "Uncertainty in the asteroid's velocity at the time of impact."
        case .diameter: return "Estimated diameter of the asteroid (in kilometers)."
        case .tsMax: return "Maximum value on the Torino Scale for potential impacts."
        case .psCum: return "Cumulative Palermo Scale for all potential impacts."
        case .vImp: return "Impact Velocity, the speed at which the asteroid would hit (in km/s)."
        case .nobs: return "Number of observations contributing to the asteroid's orbit calculation."
        case .nImp: return "Total number of potential impacts identified."
        case .pdate: return "Production Date, when the data was last updated."
        case .mass: return "Estimated mass of the asteroid (in kilograms)."
        case .method: return "Method used to compute the asteroid's trajectory and impact probabilities."
        case .cdate: return "Creation Date, when the data entry was created."
        case .ndel: return "Number of radar detections contributing to the data."
        case .fullname: return "The asteroid's full name or designation."
        case .nsat: return "Number of satellites or companions detected."
        case .h: return "Absolute Magnitude, a measure of the asteroid's brightness."
        case .firstObs: return "Date of the first observation of the asteroid."
        case .lastObs: return "Date of the last observation of the asteroid."
        case .des: return "Primary designation or name of the asteroid."
        case .darc: return "Data Arc, the time span (in days) between the first and last observations."
        case .vInf: return "Infinity Velocity, the relative velocity of the asteroid on a collision-free trajectory."
        case .psMax: return "Maximum Palermo Scale value for potential impacts."
        }
    }
}
