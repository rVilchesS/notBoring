import UIKit

class TabBarController: UITabBarController {
    var participants = "0"
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupViewControllers()
    }
    
    func setupViewControllers() {
        let firstTabTitle = "Activities"
        let secondTabTitle = "Random"
        let firstTabImage = UIImage(systemName: "list.dash")
        let secondTabImage = UIImage(systemName: "shuffle")
        
        // First View Controller in TabBar
        let firstTab = ActivityViewController(nibName: "ActivityViewController", bundle: nil)
        firstTab.title = firstTabTitle
        firstTab.participants = participants
        firstTab.navigationItem.backButtonTitle = "Back"
        
        let firstTabNavigationViewController = UINavigationController(rootViewController: firstTab)
        
        firstTabNavigationViewController.tabBarItem = UITabBarItem(title: firstTabTitle, image: firstTabImage, selectedImage: firstTabImage)
        
        // Second View Controller in TabBar
        let secondTab = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        secondTab.title = secondTabTitle
        secondTab.participants = participants
        
        let secondTabNavigationViewController = UINavigationController(rootViewController: secondTab)
        
        secondTabNavigationViewController.tabBarItem = UITabBarItem(title: secondTabTitle, image: secondTabImage, selectedImage: secondTabImage)
        
        viewControllers = [firstTabNavigationViewController, secondTabNavigationViewController]
        tabBar.tintColor = .systemOrange
    }
}
