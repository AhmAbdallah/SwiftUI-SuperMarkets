//
//	Coordinate.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Coordinate : Codable {

	let latitude : Float?
	let longitude : Float?


	enum CodingKeys: String, CodingKey {
		case latitude = "latitude"
		case longitude = "longitude"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		latitude = try values.decodeIfPresent(Float.self, forKey: .latitude)
		longitude = try values.decodeIfPresent(Float.self, forKey: .longitude)
	}


}