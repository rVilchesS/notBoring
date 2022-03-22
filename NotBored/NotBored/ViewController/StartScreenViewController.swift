import UIKit

class StartScreenViewController: UIViewController, UITextFieldDelegate {

    
    // MARK: * Outlets *
    @IBOutlet weak var participantsTextField: UITextField!
    @IBOutlet weak var startButton: UIButton! {
        didSet {
            startButton.layer.cornerRadius = 15
            startButton.backgroundColor = .systemBlue
            startButton.layer.opacity = 0.8
        }
    }
    @IBOutlet weak var switchTerms: UISwitch!{
        didSet{
            switchTerms.onTintColor = .systemBlue
        }
    }
    
    @IBAction func switchTerms(_ sender: Any) {
        //turnStartButton()
   }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Keyboard only with numbers
        self.participantsTextField.keyboardType = .numberPad
    
        // Close keyboard by touching anywhere
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Validates that the conditions are met for the button to be enabled
        participantsTextField.delegate = self
        startButton.isEnabled = false
        switchTerms.isOn = false
        
        
    
    }
    // MARK: * Actions *
    


    @IBAction func activitiesTappend(_ sender: Any) {
        // ActivityViewController is instantiated
        let activityViewController = ActivityViewController(nibName: "ActivityViewController", bundle: nil)
        // ActivityViewController is declared as a navigationController
        
        // The viewController is displayed
        self.navigationController?.pushViewController(activityViewController, animated: true)
        
    }
    
    @IBAction func termsAndConditionsTappend(_ sender: Any) {
        // TermsAndConditionsViewController is instantiated
        let tAndCVC = TermsAndConditionsViewController(
            nibName: "TermsAndConditionsViewController",
            bundle: nil)
        // The viewController is displayed
        self.present(tAndCVC, animated: true)
    }
    
}

extension StartScreenViewController {
    
    // MARK: * Functions *
    
    // function to disable start button when it has no value or its value its less than 1
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let numberTextField = Int(textField.text ?? "0") ?? 0

        if numberTextField.words.isEmpty || numberTextField < 1 {
            startButton.isEnabled = false
            startButton.layer.opacity = 0.8
        } else {
            startButton.isEnabled = true
            startButton.layer.opacity = 1
        }
    }
    
    // function to close keyboard by touching anywhere
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    
    //para validar con el switch
    //    @objc func turnStartButton(){
    //
    //        if switchTerms.isOn && (self.participantsTextField != nil) {
    //            startButton.isEnabled = true
    //            startButton.layer.opacity = 1
    //        } else {
    //            startButton.isEnabled = false
    //            startButton.layer.opacity = 0.6        }
    //    }
}
