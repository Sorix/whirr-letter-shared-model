import Foundation

public protocol LetterModel: Codable {
	associatedtype AddressModelType: AddressModel
	associatedtype SenderModelType: SenderModel

	var sourceClient: String { get }
	var receiverCountryCode: Int { get }
	var postage: Int { get }
	var paper: Int { get }
	var envelope: Int { get }
	var extras: Int { get }
	var pdf: Data? { get }
//	var yourRef: String? { get }
	
	var addresses: [AddressModelType] { get }
	var sender: SenderModelType? { get }
}

public protocol AddressModel: Codable {
	var name: String? { get }
	var addressLine1: String? { get }
	var addressLine2: String? { get }
	var townCity: String? { get }
	var postCode: String? { get }
}

public protocol SenderModel: Codable {
	var address: String { get }
	var includeSenderAddressOnEnvelope: Bool { get }
}

public enum Letters {
	public typealias Post = LetterModel
	public typealias PostAnswer = CreationDetails

	public struct CreationDetails: Codable {

		public let id: UUID

		public init(id: UUID) {
			self.id = id
		}
	}
}
