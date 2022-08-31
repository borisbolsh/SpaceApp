import UIKit

final class SettingsRouter {
	weak var routingHandler: SettingsRouterRoutingHandler?
}

extension SettingsRouter: SettingsRouterInput {
	func closeSettinsModule() {
		routingHandler?.performCloseSettinsModule()
	}
}
