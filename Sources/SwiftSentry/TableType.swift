//
//  TableType.swift
//  SwiftSentry
//
//  Created by Yuma decaux on 25/12/2024.
//


public enum TableType: String, Codable {
    case closeApproach = "CA"     // Close-Approach Data
    case stateVector = "VECTOR"  // State Vector Data
    case observer = "OBSERVER"   // Observer-Centric Data
    case orbitalElements = "ELEMENTS" // Orbital Elements
    case physical = "PHYSICAL"   // Physical Characteristics
    case List = "List"
    case Impactprobability = "ImpactProbability"
}
