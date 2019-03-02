//
//  Divisible.swift
//  DivisionSolver
//
//  Created by Ben Rivello on 3/2/19.
// 
//

import Foundation

protocol Divisible {
    func divideBy(denominator: Divisible) -> Divisible
    func divide() -> Double
}

extension Double : Divisible {
    internal func divideBy (denominator: Divisible) -> Divisible {
        if let denominator = denominator as? Double {
            return self/denominator
        } else {
            return self.divideBy(denominator: denominator.divide())
        }
    }
    func divide() -> Double {
        return self
    }
}

extension Array: Divisible where Iterator.Element: Any {
    internal func divideBy(denominator: Divisible) -> Divisible {
        return self.divide().divideBy(denominator: denominator)
    }
    func divide() -> Double {
        if self.count == 0 {
            return 0.0
        } else if self.count == 1, let first = self[0] as? Divisible {
            return first.divideBy(denominator: 1.0) as! Double
        } else if var numerator = self[0] as? Divisible {
            for i in 1..<self.count {
                if let current = self[i] as? Divisible {
                    numerator = numerator.divideBy(denominator: current)
                }
            }
            return numerator as! Double
        }
        return Double.nan
    }
}




