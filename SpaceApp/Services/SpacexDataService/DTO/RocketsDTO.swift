import Foundation

struct RocketsResponse: Decodable {
	let rockets: [RocketsDTO]
}

struct RocketsDTO: Decodable {
	let id: String
	let name: String
	let type: String
	let active: Bool
	let stages: Int
	let boosters: Int
	let country: String
	let price: Double
	let firstFlight: String
	let company: String
	let wikipedia: String
	let description: String
	let images: [String?]
	let successRatePct: Int

	let height: HeightRocket
	let diameter: DiameterRocket
	let mass: MassRocket

	let firstStageRocket: FirstStageRocket
	let secondStageRocket: SecondStageRocket
	let payloadWeightsRocket: [PayloadWeightsRocket]

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
		case images = "flickr_images"
		case price = "cost_per_launch"
		case firstFlight = "first_flight"
		case successRatePct = "success_rate_pct"
		case height
		case diameter
		case mass
		case firstStageRocket = "first_stage"
		case secondStageRocket = "second_stage"
		case payloadWeightsRocket = "payload_weights"
	}
}

struct HeightRocket: Decodable {
	let meters: Double
	let feet: Double
}

struct DiameterRocket: Decodable {
	let meters: Double
	let feet: Double
}

struct MassRocket: Decodable {
	let kg: Int
	let lb: Int
}

struct FirstStageRocket: Decodable {
	let engines: Int
	let fuelAmountTons: Float
	let burnTimeSec: Int?

	enum CodingKeys: String, CodingKey {
		case engines
		case fuelAmountTons = "fuel_amount_tons"
		case burnTimeSec = "burn_time_sec"
	}
}

struct SecondStageRocket: Decodable {
	let engines: Int
	let fuelAmountTons: Float
	let burnTimeSec: Int?

	enum CodingKeys: String, CodingKey {
		case engines
		case fuelAmountTons = "fuel_amount_tons"
		case burnTimeSec = "burn_time_sec"
	}
}

struct PayloadWeightsRocket: Decodable {
	let id: String
	let name: String
	let kg: Int
	let lb: Int
}
