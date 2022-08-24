import Foundation

final class MainRouter {
	weak var routingHandler: MainRouterRoutingHandler?
}

extension MainRouter: MainRouterInput {
	func routeToDetails() {
		routingHandler?.performRouteToDetails()
	}
}
