import Foundation

extension DateFormatter {
	static let launchDateTimeFormatter: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd MMMM, yyyy"

		return dateFormatter
	}()
}
