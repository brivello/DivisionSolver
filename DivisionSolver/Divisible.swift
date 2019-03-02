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
    internal func divide() -> Double {
        return self
    }
}

extension Array: Divisible where Iterator.Element: Any /* <- 'Any' cannot be 'Divisible' */ { /*
     03/02/2019 Swift_4.2
     - It was necessary to extend arrays of type 'Any' to acheive the desired functionality in unbalanced/heterogenious arrays.
     - When only extending Arrays: Divisible, problems like [2, [4, 5], 3] were not be able to access Divisible due to the current functionality of swift
     - Error when force cast to Divisible -> Heterogeneous collection literal could only be inferred to '[Any]'; */
    internal func divideBy(denominator: Divisible) -> Divisible {
        return self.divide().divideBy(denominator: denominator)
    }
    func divide() -> Double {
        if self.count == 0 {
            return 0.0
        } else if self.count == 1, let first = self[0] as? Divisible {
            return first.divide()
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




