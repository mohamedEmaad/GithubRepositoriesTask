
import Foundation

struct Owner: Codable {
    
	let login: String?
	let id: Int?
	let avatar_url: String?
	let url: String?
	let type: String?

	enum CodingKeys: String, CodingKey {

		case login = "login"
		case id = "id"
		case avatar_url = "avatar_url"
		case url = "html_url"
        case type = "type"

	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		login = try values.decodeIfPresent(String.self, forKey: .login)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		avatar_url = try values.decodeIfPresent(String.self, forKey: .avatar_url)
		url = try values.decodeIfPresent(String.self, forKey: .url)
        type = try values.decodeIfPresent(String.self, forKey: .type)
	}

}
