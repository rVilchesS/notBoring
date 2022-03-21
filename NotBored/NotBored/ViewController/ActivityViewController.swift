import UIKit


class ActivityViewController: UIViewController {
    
    @IBOutlet weak var categoriesTableView: UITableView!
    
    let categories = ["education", "recreational", "social", "diy", "charity", "cooking", "relaxation", "music", "busywork"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesTableView.dataSource = self
        categoriesTableView.delegate = self
        categoriesTableView.register(UITableViewCell.self,
                                     forCellReuseIdentifier: "cell")
        getCategories()
        setupNavigationBar()
    }
    
    private func getCategories() {
        categoriesTableView.reloadData()
    }
    //botom random
    func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "shuffle"), style: .plain, target: self, action: #selector(tapShuffle))
        
        
    }
    
    @objc func tapShuffle() {
    }
}

extension ActivityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.categoriesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
}

extension ActivityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        vc.category = categories[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
        //        categoriesTableView.deselectRow(at: indexPath, animated: true)
        //        print("La celda fue \(categories[indexPath.row].name).")
    }
}
