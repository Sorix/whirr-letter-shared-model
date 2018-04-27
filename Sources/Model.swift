//
//  Model.swift
//  letter-model
//
//  Created by Vasily Ulianov on 24/04/2018.
//

import Foundation

open class Letter: Codable {
	
	public var sourceClient: String
	public var addresses: [Address]
	public var receiverCountryCode: Int
	public var postage: Int
	public var paper: Int
	public var envelope: Int
	public var extras: Int
	public var letterBody: String?
	public var sender: Sender?
	public var yourRef: String?
	public var fileAttachementGUIDs: [String]?
	
	// MARK: Initializing an Item
	
	public init(sourceClient: String, addresses: [Address], receiverCountryCode: Int, postage: Int, paper: Int, envelope: Int, extras: Int) {
		self.sourceClient = sourceClient
		self.addresses = addresses
		self.receiverCountryCode = receiverCountryCode
		self.postage = postage
		self.paper = paper
		self.envelope = envelope
		self.extras = extras
	}
	
	// MARK: -
	
	open class Address: Codable {
		
		public var name: String?
		public var addressLine1: String?
		public var addressLine2: String?
		public var townCity: String?
		public var postCode: String?
		
		// MARK: Initializing an Item
		
		public init() { }
	}
	
	open class Sender: Codable {
		
		public var address: String
		public var includeSenderAddressOnEnvelope: Bool = false
		
		public init(address: String) {
			self.address = address
		}
		
	}
	
}

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




