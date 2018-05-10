import Foundation

extension JSONEncoder {
	
	func encode<T>(_ value: T) throws -> String where T : Encodable {
		let encodedData: Data = try self.encode(value)
		guard let json = String(data: encodedData, encoding: .utf8) else {
			throw SharedModelError.stringDataConversionFailed
		}
		
		return json
	}

}

extension JSONDecoder {

	func decode<T>(_ type: T.Type, from jsonString: String) throws -> T where T : Decodable {
		guard let data = jsonString.data(using: .utf8) else {
			throw SharedModelError.stringDataConversionFailed
		}
		
		return try self.decode(type, from: data)
	}
	
}

