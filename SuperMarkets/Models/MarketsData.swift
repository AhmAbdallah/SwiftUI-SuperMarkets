//
//	MarketsData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct MarketsData : Codable {

	let city : String?
	let coordinates : Coordinate?
	let descriptionField : String?
	let imageName : String?
	let marketId : Int?
	let name : String?


	enum CodingKeys: String, CodingKey {
		case city = "city"
		case coordinates
		case descriptionField = "description"
		case imageName = "imageName"
		case marketId = "marketId"
		case name = "name"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		coordinates = try Coordinate(from: decoder)
		descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
		imageName = try values.decodeIfPresent(String.self, forKey: .imageName)
		marketId = try values.decodeIfPresent(Int.self, forKey: .marketId)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}


}