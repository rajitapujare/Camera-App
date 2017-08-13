//
//  capturedPhotoViewController.swift
//  CameraApp1
//
//  Created by Rajita Pujare on 7/26/17.
//  Copyright © 2017 Rajita Pujare. All rights reserved.
//

import UIKit

class capturedPhotoViewController: UIViewController {
    var capturedImage1 = UIImage()
    var capturedImage2 = UIImage()
    
    @IBOutlet weak var capturedImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        capturedImageView.image = capturedImage1

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "photofolder" {
        var capturedImage2 = UIImage()
        
        let destination = segue.destination as! savePhotoFolders
        destination.capturedImage2 = self.capturedImage1
        destination.capturedImage3 = self.capturedImage2
        // returns nil propertyfrom here
        //destination.navigationController!.setNavigationBarHidden(true, animated: false)
        }
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
