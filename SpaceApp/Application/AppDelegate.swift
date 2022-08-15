import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	private var appCoordinator: AppCoordinator?
	private lazy var appDependency: AppDependency = AppDependency.makeDefault()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let window = UIWindow(frame: UIScreen.main.bounds)
		self.appCoordinator = AppCoordinator(window: window, appDependency: appDependency)
		self.window = window
		self.appCoordinator?.start()
		return true
	}
}
