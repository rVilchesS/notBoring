import UIKit

class TabBarController: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        let firstTabNavigationViewController = UINavigationController(rootViewController: firstTab)
        
        firstTabNavigationViewController.tabBarItem = UITabBarItem(title: firstTabTitle, image: firstTabImage, selectedImage: firstTabImage)
    
        // Second View Controller in TabBar
        let secondTab = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        secondTab.title = secondTabTitle
        
        let secondTabNavigationViewController = UINavigationController(rootViewController: secondTab)
        
        secondTabNavigationViewController.tabBarItem = UITabBarItem(title: secondTabTitle, image: secondTabImage, selectedImage: secondTabImage)
        
        viewControllers = [firstTabNavigationViewController ,secondTabNavigationViewController]
    }
}
