import Foundation

public enum Payments {
	public enum GetCostForLetter {
		/// Response to `POST /user/persistent_token`
		public struct Response: Codable {
			public let letterCost: Double
			public let currency = "GBP"
			
			public init(letterCost: Double) {
				self.letterCost = letterCost
			}
		}
	}
}
