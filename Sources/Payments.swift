import Foundation

/// Route: /payments
public enum Payments {
	/// GET /payments/letter/{letter_id}/cost
	public enum GetCostForLetter {
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
	
	/// Successfull response for `POST /payments/letter/{letter_id}/charge`
    public struct ChargeResponse: Codable {
        public let chargeID: UUID
        
        public init(chargeID: UUID) {
            self.chargeID = chargeID
        }
    }
}
