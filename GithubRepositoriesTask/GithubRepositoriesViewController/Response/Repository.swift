
import Foundation

final class Repository: Codable {

	let id: Int?
	let name: String?
	let full_name: String?
	let privateRepo: Bool?
	let owner: Owner?
	let description: String?
	let url: String?
    var date: String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case full_name = "full_name"
		case privateRepo = "private"
		case owner = "owner"
		case description = "description"
		case url = "url"
        case date = "date"

    }

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
		privateRepo = try values.decodeIfPresent(Bool.self, forKey: .privateRepo)
		owner = try values.decodeIfPresent(Owner.self, forKey: .owner)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		url = try values.decodeIfPresent(String.self, forKey: .url)
        date = try values.decodeIfPresent(String.self, forKey: .date)
    }

}
