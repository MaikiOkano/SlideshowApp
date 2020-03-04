//
//  View2Controller.swift
//  SlideshowApp
//
//  Created by 岡野真生 on 2020/02/25.
//  Copyright © 2020 maiki.okano. All rights reserved.
//

import UIKit

class View2Controller: UIViewController {

    @IBOutlet weak var ImageField2: UIImageView!
    var bigImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ImageField2.image = bigImage
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
