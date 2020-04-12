//
//  ViewController2.swift
//  be cool
//
//  Created by deepo on 4/7/20.
//  Copyright © 2020 deepo. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    var selection : String?
    @IBOutlet weak var llabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
llabel.text = selection
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
