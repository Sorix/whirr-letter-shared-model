import Foundation

/// Route: /letters
public enum Letters {
	
	/// POST /letters
    public enum Create {
        
        // MARK: Create Letter Request
        
		public struct Request: Codable {
            public var receiverCountryCode: Int
            public var postage: Int
            public var paper: Int
            public var envelope: Int
            public var extras: Int
            public var pdf: Data?
            public var addresses: [Address]
            public var sender: Sender?

            public struct Address: Codable {
                public var name: String?
                public var addressLine1: String?
                public var addressLine2: String?
                public var townCity: String?
                public var postCode: String?
				
				public init() {}
            }
            
            public struct Sender: Codable {
                public var address: String
                public var includeSenderAddressOnEnvelope: Bool = true
            }
        }
        
        // MARK: Create Letter Response

        public struct Response: Codable {
            public let id: UUID
            
            public init(id: UUID) {
                self.id = id
            }
        }
    }
}

// MARK: Initializers

public extension Letters.Create.Request {
    public init(addresses: [Letters.Create.Request.Address], receiverCountryCode: Int, postage: Int, paper: Int, envelope: Int, extras: Int) {
        self.receiverCountryCode = receiverCountryCode
        self.postage = postage
        self.paper = paper
        self.envelope = envelope
        self.extras = extras
        self.addresses = addresses
    }
}

public extension Letters.Create.Request.Sender {
    public init(address: String) {
        self.address = address
    }
}
