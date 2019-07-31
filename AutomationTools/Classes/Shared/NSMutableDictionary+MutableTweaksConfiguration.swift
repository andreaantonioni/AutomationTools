//
//  EphimeralTweaksConfiguration.swift
//  JUSTEAT
//
//  Created by Alberto De Bortoli on 27/11/2018.
//  Copyright © 2019 Just Eat. All rights reserved.
//

import Foundation
import JustTweak

extension NSMutableDictionary: MutableTweaksConfiguration {
    
    public var logClosure: JustTweak.TweaksLogClosure? {
        get { return nil }
        set { }
    }
    
    public func isFeatureEnabled(_ feature: String) -> Bool {
        guard let storedValue = object(forKey: feature) as? Bool else { return false }
        return storedValue
    }
    
    public func tweakWith(feature: String, variable: String) -> Tweak? {
        guard let storedValue = object(forKey: variable) else { return nil }
        var value: TweakValue? = nil
        if let theValue = storedValue as? String {
            value = theValue
        }
        else if let theValue = storedValue as? NSNumber {
            value = theValue.tweakValue
        }
        guard let finalValue = value else { return nil }
        return Tweak(feature: feature, variable: variable, value: finalValue)
    }
    
    public func activeVariation(for experiment: String) -> String? {
        return nil
    }
    
    public func deleteValue(feature: String, variable: String) {
        removeObject(forKey: variable)
    }
    
    public func set(_ value: TweakValue, feature: String, variable: String) {
        self[variable] = value
    }
}
