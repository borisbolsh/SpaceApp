import Foundation

extension DateFormatter {
	static let launchDateTimeFormatter: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd MMMM, yyyy"

		return dateFormatter
	}()

	static func getRocketFormattedDate(string: String) -> String? {
		let dateFormatterGet = DateFormatter()
		dateFormatterGet.dateFormat = "yyyy-MM-dd"

		let date: Date? = dateFormatterGet.date(from: string)

		guard let date = date else {
			return nil
		}

		return DateFormatter.launchDateTimeFormatter.string(from: date)
	}
}
