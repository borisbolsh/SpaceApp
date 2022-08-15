import Foundation

struct RocketsResponse: Decodable {
	let rockets: [Rockets]
}

struct Rockets: Decodable {
	let id: String?
	let name: String?
	let type: String?
	let active: Bool?
	let stages: Int?
	let boosters: Int?
	let country: String?
	let price: Double?
	let firstFlight: String?
	let company: String?
	let wikipedia: String?
	let description: String?
	let successRatePct: Int?

	enum CodingKeys: String, CodingKey {
		case id
		case name
		case type
		case active
		case stages
		case boosters
		case country
		case company
		case wikipedia
		case description
		case price = "cost_per_launch"
		case firstFlight = "first_flight"
		case successRatePct = "success_rate_pct"
	}
}
