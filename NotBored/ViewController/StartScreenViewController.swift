import UIKit

class StartScreenViewController: UIViewController {

    
    // MARK: *** Outlets ***
    @IBOutlet weak var participantsTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Keyboard only with numbers
        onlyNumbers()
        
        // Close keyboard by touching anywhere
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        textFieldDidChange(textField: participantsTextField)
    }
    
    // MARK: *** Actions ***

    @IBAction func activitiesTappend(_ sender: Any) {
        
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
     
    // Function for changes the type of keyboard to a numeric one
    func onlyNumbers() {
        self.participantsTextField.keyboardType = .numberPad
        
    }
    
    // function to disable start button when it has no value
    func textFieldDidChange(textField: UITextField) {

        if textField.text != nil {
            startButton.isEnabled = true
        }else{
            startButton.isEnabled = false
        }
    }
    
    // function to close keyboard by touching anywhere
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

