import Foundation

/// Route: /payments
public enum Payments {
	/// GET /payments/letter/{letter_id}/cost
	public enum GetCostForLetter {
		public struct Request: Codable {
			public let numberOfPages: Int
			
			public init(numberOfPages: Int) {
				self.numberOfPages = numberOfPages
			}
		}
		
		/// Response to `POST /user/persistent_token`
		public struct Response: Codable {
			public let letterCost: Double
            public let currency: String
			
            public init(letterCost: Double, currency: String) {
				self.letterCost = letterCost
                self.currency = currency
			}
		}
	}
}
