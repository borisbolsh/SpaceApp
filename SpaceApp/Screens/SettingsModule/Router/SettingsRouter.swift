import Foundation

final class SettingsRouter {
	weak var routingHandler: SettingsRouterRoutingHandler?
}

extension SettingsRouter: SettingsRouterInput {
	func closeSettinsModule(){}
}

extension SettingsRouter: SettingsRouterRoutingHandler {}
