import Foundation

public enum User {
	public enum CreatePersistentToken {
		/// Response to `POST /user/persistent_token`
		public struct Response: Codable {
			public let userID: UUID
			public let persistentToken: String
			
			public init(userID: UUID, token: String) {
				self.userID = userID
				self.persistentToken = token
			}
		}
	}
	
	public enum CreateDiscardableToken {
		/// Response to `GET /user/token`
		public struct Response: Codable {
			public let discardableToken: String
			
			public init(token: String) {
				self.discardableToken = token
			}
		}
	}
}
