import UIKit
import Alamofire

class SuggestionViewController: UIViewController {
    
    var service = ActivityService()
    
    var category: String = ""
    var participants = "0"

    @IBOutlet weak var lblActivity: UILabel!
    @IBOutlet weak var lblParticipants: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var iconCategory: UIImageView!
    @IBOutlet weak var btnTryAnother: UIButton!{
        didSet {
            btnTryAnother.layer.cornerRadius = 10
            btnTryAnother.backgroundColor = .systemBlue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.getActivity(type: category, participants: participants) { [self] activity in
            self.lblActivity.text = activity.activity
            self.lblParticipants.text = self.participants
            self.lblPrice.text = String(activity.price)
            
            if category.isEmpty {
                self.lblCategory.text = activity.type
            } else {
                self.lblCategory.text = self.category
                lblCategory.isHidden = true
                iconCategory.isHidden = true
            }
        }
    }
    
    @IBAction func btnTryAnother(_ sender: Any) {
        self.viewDidLoad()
    }
}

extension SuggestionViewController {
    
    func priceCategory(_ price : Double) -> String {
        if price == 0 {
            return "Free"
        }
        if price > 0 && price < 0.3 {
            return "Low"
        }
        if price > 0.3 && price < 0.6 {
            return "Medium"
        }
        return "High"
    }
}

