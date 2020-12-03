
import Foundation

struct Repository: Codable {

	let id: Int?
	let name: String?
	let full_name: String?
	let privateRepo: Bool?
	let owner: Owner?
	let description: String?
	let url: String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case full_name = "full_name"
		case privateRepo = "private"
		case owner = "owner"
		case description = "description"
		case url = "url"

    }

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
		privateRepo = try values.decodeIfPresent(Bool.self, forKey: .private)
		owner = try values.decodeIfPresent(Owner.self, forKey: .owner)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		url = try values.decodeIfPresent(String.self, forKey: .url)
    }

}