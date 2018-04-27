import Foundation

public enum Precharge {
	
	open class Request: Codable {
		public var zoneID: Int
		public var paperTypeID: Int
		public var numberOfPages: Int
		public var zoneOfferID: Int
		public var envelopeTypeID: Int
		
		public init(zoneID: Int, paperTypeID: Int, numberOfPages: Int, zoneOfferID: Int, envelopeTypeID: Int) {
			self.zoneID = zoneID
			self.paperTypeID = paperTypeID
			self.numberOfPages = numberOfPages
			self.zoneOfferID = zoneOfferID
			self.envelopeTypeID = envelopeTypeID
		}
	}
	
	public struct Answer: Codable {
		public let id: String
		public let letterCost: Double
		
		public init(id: String, letterCost: Double) {
			self.id = id
			self.letterCost = letterCost
		}
	}
	
}
