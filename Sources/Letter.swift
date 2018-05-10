import Foundation

open class Letter: Codable {
	
	public var id: UUID?
	public var sourceClient: String
	public var receiverCountryCode: Int
	public var postage: Int
	public var paper: Int
	public var envelope: Int
	public var extras: Int
	//	 var letterBody: String?
	//	 var yourRef: String?
	public var pdf: Data?
	
	// MARK: Addresses
	
	/// We store addresses as JSON String because Fluent doesn't support JSON DB Type.
	/// Github Issue: [fluent-postgresql#48](https://github.com/vapor/fluent-postgresql/issues/48)
	var addressesJSON = String()
	public var addresses: [Address] {
		get {
			do {
				return try JSONDecoder().decode([Address].self, from: addressesJSON)
			} catch {
				assertionFailure("\(error)")
				return [Address]()
			}
		}
		
		set {
			do {
				self.addressesJSON = try JSONEncoder().encode(newValue)
			} catch {
				assertionFailure("\(error)")
				self.addressesJSON = String()
			}
		}
	}
	
	// MARK: - Init

	public init(sourceClient: String, addresses: [Address], receiverCountryCode: Int, postage: Int, paper: Int, envelope: Int, extras: Int) {
		self.sourceClient = sourceClient
		self.receiverCountryCode = receiverCountryCode
		self.postage = postage
		self.paper = paper
		self.envelope = envelope
		self.extras = extras
		self.addresses = addresses
	}
	
}

// MARK: - Submodels

extension Letter {
	
	public struct Address: Codable {
		var name: String?
		var addressLine1: String?
		var addressLine2: String?
		var townCity: String?
		var postCode: String?
	}
	
	public struct Sender: Codable {
		public var address: String
		public var includeSenderAddressOnEnvelope: Bool = true
		
		public init(address: String) {
			self.address = address
		}
	}
	
}

public enum Letters {

	public typealias Post = Letter
	public typealias PostAnswer = CreationDetails

	public struct CreationDetails: Codable {

		public let id: UUID

		public init(id: UUID) {
			self.id = id
		}

	}

}


