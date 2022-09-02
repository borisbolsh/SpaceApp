import Foundation

extension String {
	static func getMoneyString(sum: Double) -> String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		formatter.usesGroupingSeparator = true

		return formatter.string(from: NSNumber(value: sum)) ?? ""
	}

	static func getNumericString(number: Double) -> String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.maximumFractionDigits = 2

		return formatter.string(from: NSNumber(value: number)) ?? ""
	}

	static func getNumericString(number: Int) -> String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.maximumFractionDigits = 2

		return formatter.string(from: NSNumber(value: number)) ?? ""
	}
}
