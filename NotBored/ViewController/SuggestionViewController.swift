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
            btnTryAnother.layer.cornerRadius = 15
            btnTryAnother.backgroundColor = .systemYellow
            
        }
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.getActivity(type: category, participants: participants) { [self] activity in
            self.lblActivity.text = matchActivity(activity.activity)
            self.lblParticipants.text = self.participants
            self.lblPrice.text = priceCategory(activity.price)
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
        } else if price <= 0.3 {
            return "Low"
        } else if price <= 0.6 {
            return "Medium"
        } else {
            return "High"
        }
    }
    
    func matchActivity(_ activity: String) -> String {
        if activity.isEmpty {
            lblActivity.textColor = .red
            return "Sorry, we don't have activities for you"
        } else {
            return activity
        }
    }
}

