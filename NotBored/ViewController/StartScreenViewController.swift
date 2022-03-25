import UIKit

class StartScreenViewController: UIViewController, UITextFieldDelegate {

    
    // MARK: *** Outlets ***
    @IBOutlet weak var participantsTextField: UITextField!
    @IBOutlet weak var startButton: UIButton! {
        didSet {
            startButton.layer.cornerRadius = 10
            startButton.backgroundColor = .systemYellow
            startButton.layer.opacity = 0.6
        }
    }
    
    @IBOutlet weak var switchTerms: UISwitch! {
        didSet{
            switchTerms.onTintColor = .systemYellow
        }
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
    
    // MARK: *** Actions ***

    @IBAction func activitiesTappend(_ sender: Any) {
        let tabBarController = TabBarController()
        tabBarController.participants = participantsTextField.text ?? "0"
        tabBarController.modalPresentationStyle = .overFullScreen
        self.present(tabBarController, animated: true)
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
    
    // MARK: *** Functions ***
    
    // function to disable start button when it has no value or its value its less than 1
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let numberTextField = Int(textField.text ?? "0") ?? 0
        
        if switchTerms.isOn{
            if numberTextField.words.isEmpty || numberTextField < 1 {
                startButton.isEnabled = false
                startButton.layer.opacity = 0.6
            } else {
                startButton.isEnabled = true
                startButton.layer.opacity = 1
            }
        } else {
            startButton.isEnabled = false
            startButton.layer.opacity = 0.6
        }
    }
    
    // function to close keyboard by touching anywhere
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
//    func presentNotAcceptedTermsAlert() {
//        let alert = UIAlertController(title: "Terms and Conditions", message: "Please accept the terms and conditions to continue.", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in NSLog("The \"Terms OK\" alert occured.")}))
//        self.present(alert, animated: true)
//    }
}

