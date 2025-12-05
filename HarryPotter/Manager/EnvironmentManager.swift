//
//  EnvironmentManager.swift
//  HarryPotter
//
//  Created by stephan on 04/12/25.
//

import Foundation

public final class EnvironmentManager {
    
    public enum Environment: String {
        case development, production
    }
    
    public static let standard = EnvironmentManager()
    
    public var environment: Environment {
#if Debug_development || Release_development
        return .development
        #elseif Debug_production || Release_production
        return .production
        #endif
    }
    
    public var endpoint: String? {
        guard let endpoint = Bundle.main.infoDictionary?["HARRY_POTTER_API_KEY"] as? String else { return nil }
        return endpoint
    }
    
    public func logConfiguration() {
        print(self.environment.rawValue)
        print(self.endpoint ?? "")
    }
}
