import Foundation

/// Route /user
public enum User {
	/// POST /user/persistent_token
	public enum CreatePersistentToken {
		public struct Response: Codable {
			public let userID: UUID
			public let persistentToken: String
			
			public init(userID: UUID, token: String) {
				self.userID = userID
				self.persistentToken = token
			}
		}
	}
	
	/// GET /user/token
	public enum CreateDiscardableToken {
		public struct Response: Codable {
			public let discardableToken: String
			
			public init(token: String) {
				self.discardableToken = token
			}
		}
	}
}
