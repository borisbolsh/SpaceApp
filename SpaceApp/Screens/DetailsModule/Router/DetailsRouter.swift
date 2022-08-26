import Foundation

final class DetailsRouter {
	weak var routingHandler: DetailsRouterRoutingHandler?
}

extension DetailsRouter: DetailsRouterInput {}

extension DetailsRouter: DetailsRouterRoutingHandler {}
