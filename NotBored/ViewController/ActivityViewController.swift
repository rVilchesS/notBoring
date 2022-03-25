import UIKit
import Alamofire

struct Category: Codable {
    let id: Int
    let name: String
}

class ActivityViewController: UIViewController {
    
    var participants = "0"
    @IBOutlet weak var categoriesTableView: UITableView!
    
    var categories: [Category] = [Category(id: 1, name: "education"), Category(id: 2, name: "recreational"), Category(id: 3, name: "social"), Category(id: 4, name: "diy"), Category(id: 5, name: "charity"), Category(id: 6, name: "cooking"), Category(id: 7, name: "relaxation"), Category(id: 8, name: "music"), Category(id: 9, name: "busywork")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesTableView.dataSource = self
        categoriesTableView.delegate = self
        categoriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        categoriesTableView.reloadData()
    }
    
    
}

extension ActivityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.categoriesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
}

extension ActivityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        categoriesTableView.deselectRow(at: indexPath, animated: true)
        
        // navigation to SuggestionViewController
        let suggestion = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        self.navigationController?.pushViewController(suggestion, animated: true)
        suggestion.title = (categories[indexPath.row].name).capitalized
        suggestion.category = categories[indexPath.row].name
        suggestion.participants = participants
    }
}
