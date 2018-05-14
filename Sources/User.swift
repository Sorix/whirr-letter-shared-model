import Foundation

public enum User {
	public var pathComponent: String { return "user" }

	public struct TokenResponse: Codable {
		public let discardableToken: String
		
		public init(token: String) {
			self.discardableToken = token
		}
	}
	
	// MARK: - Login
	public enum Login {
		public var pathComponent: String { return "login" }
		
		public struct Request: Codable {
			public let username: String
			public let password: String
		}
		
		public typealias Response = User.TokenResponse
	}

	// MARK: - Registration
	
	public enum Register {
		public var pathComponent: String { return "create" }
		
		public enum Mobile {
			public var pathComponent: String { return "mobile" }
			
			public struct Response: Codable {
				public let userID: UUID
				public let persistentToken: String
				
				public init(userID: UUID, token: String) {
					self.userID = userID
					self.persistentToken = token
				}
			}
		}
	}
	
	// MARK: Register

}
