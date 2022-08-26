import Foundation

final class SettingsRouter {
	weak var routingHandler: SettingsRouterRoutingHandler?
}

extension SettingsRouter: SettingsRouterInput {}

extension SettingsRouter: SettingsRouterRoutingHandler {}
