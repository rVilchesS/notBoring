import UIKit

class TermsAndConditionsViewController: UIViewController {

    // Outlet
    @IBOutlet weak var myCustomTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCustomTextView.textColor = .black
    }

    // Actions
    @IBAction func closeTap(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}
