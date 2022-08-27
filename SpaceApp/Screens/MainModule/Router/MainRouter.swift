import Foundation

final class MainRouter {
	weak var routingHandler: MainRouterRoutingHandler?
}

extension MainRouter: MainRouterInput {
	func routeToSettings() {
		routingHandler?.performRouteToSettings()
	}

	func routeToDetails(idRocket: String, nameRocket: String) {
		routingHandler?.performRouteToDetails(idRocket: idRocket, nameRocket: nameRocket)
	}
}
