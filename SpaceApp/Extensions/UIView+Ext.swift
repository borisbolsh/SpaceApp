import UIKit

extension UIView {
	func roundCorners(corners: UIRectCorner, radius: CGFloat) {
		let path = UIBezierPath(roundedRect: self.bounds,
														byRoundingCorners: corners,
														cornerRadii: CGSize(width: radius, height: radius))
		let mask = CAShapeLayer()
		mask.path = path.cgPath
		self.layer.mask = mask
	}
	
	class func loadFromNib(named: String? = nil) -> Self {
		let name = named ?? "\(Self.self)"

		guard
			let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
		else {
			fatalError("missing expected nib named: \(name)")
		}

		guard
			let view = nib.first as? Self
		else {
			fatalError("view of type \(Self.self) not found in \(nib)")
		}

		return view
	}
}
