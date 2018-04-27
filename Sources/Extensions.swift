import Foundation

public extension JSONEncoder {
	public func snakeCased() -> Self {
		keyEncodingStrategy = .convertToSnakeCase
		return self
	}
}

public extension JSONDecoder {
	public func snakeCased() -> Self {
		keyDecodingStrategy = .convertFromSnakeCase
		return self
	}
}
