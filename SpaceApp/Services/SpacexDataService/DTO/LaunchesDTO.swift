import Foundation

struct LaunchesResponse: Decodable {
	let launches: [LaunchDTO]
}

struct LaunchDTO: Decodable {
	let rocketId: String
	let missionName: String
	let dateLaunchUnix: TimeInterval
	let isLaunchSuccess: Bool?
	
	enum CodingKeys: String, CodingKey {
		case missionName = "name"
		case dateLaunchUnix = "date_unix"
		case isLaunchSuccess = "success"
		case rocketId = "rocket"
	}
}
