//
//  ViewController.swift
//  ImplementTestCase
//
//  Created by iMac on 27/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txfEmail: UITextField!
    @IBOutlet weak var txfPass: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblErrorPass: UILabel!
    
    let PASSWORD_REGEX = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[ ~!@#$%^&*+?\"'\\(\\),-/:;<=>\\[\\]_`^|{}\\\\])[A-Za-z\\d~!@#$%^&* +?\"'\\(\\),-/:;<=>\\[\\]_`\\\\^|{}]{8,30}$"
    //MARK:- Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:- OnClick Event
    
    @IBAction func sendClick(_ sender: Any) {
        lblTitle.isHidden = true
        if !validLoginInput(email: txfEmail.text!, password: txfPass.text!) == true{
            if txfEmail.text!.isEmpty || ((txfPass.text?.isEmpty) == nil){
                lblTitle.isHidden = false
                
            }else if isValidEmail(emailAddressString: txfEmail.text!) == false {
                lblTitle.isHidden = false
                lblTitle.text = "please enter valid Email format"
                return
            } else if isValidPassword(txfPass.text!) {
                lblTitle.isHidden = false
                lblTitle.text = "Please valid password"
                return
            }
        }
//        lblTitle.isHidden = false
//        lblTitle.text = "please enter email"
//        if txfEmail.text == "" || txfEmail.text == nil {
//            lblTitle.text = "Please Enter Email"
//        } else if !isValidEmail(emailAddressString: txfEmail.text!) {
//            lblTitle.text = "Please Enter Valid Email"
//        } else if txfPass.text == "" || txfPass.text == nil {
//            lblErrorPass.text = "Please Enter Password"
//        } else if !isValidPassword(txfPass.text!) {
//            lblErrorPass.text = "Please Enter Valid Password"
//        } else {
//            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SuccessVC") as! SuccessVC
//            self.present(newViewController, animated: true, completion: nil)
//        }
    }
    
    //MARK:- IsValid Email Formate
    
    func isValidEmail(emailAddressString: String) -> Bool {
        
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailAddressString)
    }
    //MARK:- IsValid Password Formate
    
    /*Password Hint
     ^                 # start-of-string
     (?=.*[0-9])       # abc digit must occur at least once
     (?=.*[abc-z])       # abc lower case letter must occur at least once
     (?=.*[A-Z])       # an upper case letter must occur at least once
     (?=.*[@#$%^&+=])  # abc special character must occur at least once you can replace with your special characters
     (?=\\S+$)          # no whitespace allowed in the entire string
     .{4,}             # anything, at least six places though
     $                 # end-of-string */
    
    func isValidPassword(_ string:String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", PASSWORD_REGEX)
        return passwordTest.evaluate(with: string)
    }
    
    //MARK:- Check Valid Email Or Password Function
    
    
    /* the input is not valid if...
     * ...the email/password is empty
     * ...the email is not valid
     * ...the password contains less then 8 digits
     */
    func validLoginInput(email:String,password:String) -> Bool{
        if(email.isEmpty || password.isEmpty){
            return false
        }
        if isValidEmail(emailAddressString: email) == false{
            return false
        }
        if isValidPassword(password) == false {
            return false
        }
        return true
    }
}
