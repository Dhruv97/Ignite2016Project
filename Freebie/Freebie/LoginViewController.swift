//
//  LoginViewController.swift
//  Freebie
//
//  Created by Vishal Vasan on 11/14/16.
//  Copyright © 2016 Ignite2016. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBAction func FBBtnPressed(_ sender: Any) {
        let FBLoginManager = FBSDKLoginManager()
        FBLoginManager.logIn(withReadPermissions: ["email"], from: self) {
            
            (result, error) in
            
            
            if error != nil {
                print("FBLOGINERROR : \(error)")
            }
            else if result?.isCancelled == true {
                print("LOGIN CANCELLED")
            }
            else {
                print("FBLOGIN SUCCESS")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
                
            }
            
            
            
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Firebase Authorization with Facebook Error")
            }
            else {
                print("Firebase Authorization with Facebok Success")
            }
        })
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
