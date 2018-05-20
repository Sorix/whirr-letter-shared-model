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
    
    public struct ChargeRequest: Codable {
        public let source: String
        
        public init(source: String) {
            self.source = source
        }
    }
    
    public struct ChargeResponse: Codable {
        public let chargeID: UUID
        
        public init(chargeID: UUID) {
            self.chargeID = chargeID
        }
    }
}
