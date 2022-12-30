//
//  ViewController.swift
//  UITest
//
//  Created by 이주송 on 2022/12/30.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var repeatTF: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapSignupButton(_ sender: Any) {
        if passwordTF.text != repeatTF.text {
            let alert = UIAlertController(title: "Error", message:"비밀번호와 확인 비밀번호가 다릅니다", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            DispatchQueue.main.async {
                //테스트를 위해 accessibilityIdentifier를 정해줘야함
                alert.view.accessibilityIdentifier = "errorAlertDialog"
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

}

