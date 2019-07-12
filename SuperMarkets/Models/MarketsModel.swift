//
//	MarketsModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct MarketsModel : Codable {

	let marketsData : [MarketsData]?
	let message : String?
	let success : Bool?


	enum CodingKeys: String, CodingKey {
		case marketsData = "marketsData"
		case message = "message"
		case success = "success"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		marketsData = try values.decodeIfPresent([MarketsData].self, forKey: .marketsData)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		success = try values.decodeIfPresent(Bool.self, forKey: .success)
	}


}