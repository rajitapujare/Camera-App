//
//  savePhotoFolders.swift
//  CameraApp1
//
//  Created by Rajita Pujare on 7/26/17.
//  Copyright © 2017 Rajita Pujare. All rights reserved.
//

import UIKit
import Foundation


class savePhotoFolders: UITableViewController, UIAlertViewDelegate {
    var capturedImage2 = UIImage()
    let fm = FileManager.default
    
    @IBOutlet weak var headButton: UIButton!
    @IBOutlet weak var leftArmButton: UIButton!
    
    @IBOutlet weak var rightArmButton: UIButton!
    @IBOutlet weak var stomachButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var leftLegButton: UIButton!
    
    @IBOutlet weak var rightLegButton: UIButton!
    var tField: UITextField!

    let timestamp = String(NSDate().timeIntervalSince1970)

//    var timestampString: String = "";
    var timestampString = String()
    

    @IBAction func createTextAlert(_ sender: Any) {
 /*       var alert = UIAlertView(title: "Enter Mole Name", message: nil, delegate: self, cancelButtonTitle: "Cancel")
        
        alert.addButton(withTitle: "Done")
        alert.alertViewStyle = .plainTextInput
        alert.show()
*/
        
        func configurationTextField(textField: UITextField!)
        {
            print("generating the TextField")
            textField.placeholder = "Enter name"
            tField = textField
        }
        
        func handleCancel(alertView: UIAlertAction!)
        {
            print("Cancelled !!")
        }
        
        var alert = UIAlertController(title: "Enter Mole Name", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: configurationTextField)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:handleCancel))
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler:{ (UIAlertAction) in
            print("Done !!")
            
            let input = self.tField.text
            let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
            
            if let documentDirectoryPath = documentDirectoryPath {
                // create the custom folder path
                
                let  newDirectoryPath = documentDirectoryPath.appending("/headAndNeck")
                let fileManager = FileManager.default
                //                    if !fileManager.fileExists(atPath: newDirectoryPath) {
                do {
                    try fileManager.createDirectory(atPath: newDirectoryPath,
                                                    withIntermediateDirectories: true,
                                                    attributes: nil)
                } catch {
                    print("Error creating headAndNeck folder in documents dir: \(error)")
                }
                
                
                
                //                    }

            if input != nil {
                
                
                let  newDirectoryPath1 = newDirectoryPath + "/" + input!;
                       // let  newDirectoryPath1 = newDirectoryPath.appending("/\(input)")
//                    let  newDirectoryPath1 = newDirectoryPath.appending("/headAndNeck/\(input)/\(self.timestamp)")

                            do {
                                try fileManager.createDirectory(atPath: newDirectoryPath1,
                                                                withIntermediateDirectories: true,
                                                                attributes: nil)
                            } catch {
                                print("Error creating /headAndNeck/\(input) folder in documents dir: \(error)")
                }
                
                let double = Double(self.timestamp)
                let date2 = (Date(timeIntervalSince1970: double!))
                self.timestampString = "\(date2)"
                
                let  newDirectoryPath2 = newDirectoryPath1 + "/" + self.timestampString;
                print("newDirectoryPath2 is " + newDirectoryPath2)
                
                do {
                    try fileManager.createDirectory(atPath: newDirectoryPath2,
                                                    withIntermediateDirectories: true,
                                                    attributes: nil)
                    print("newDirectoryPath2 created " + newDirectoryPath2)
                } catch {
                    print("Error creating /headAndNeck/\(input)/\(self.timestamp) folder in documents dir: \(error)")
                }

                func saveMyImageToDocumentDirectory(_ capturedImage2: UIImage) -> String {
                    print("saveImageToDocumentDirectory 0");
                    let docsurl = try! self.fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    let myurl = docsurl.appendingPathComponent("headAndNeck/" + input! + "/\(self.timestampString)" + "/image1.jpg");
                    let  newDirectoryPath = documentDirectoryPath.appending("/headAndNeck")
                    
                    print("saveImageToDocumentDirectory 1")
                    
                    let  newDirectoryPath1 = newDirectoryPath.appending("/\(input)")
                    
                    do {
                        try self.fm.createDirectory(atPath: newDirectoryPath1, withIntermediateDirectories: true, attributes: nil)
                    } catch {
                        print("Error creating /headAndNeck/\(input) folder in documents dir: \(error)")
                    }
                    
                    print("saveImageToDocumentDirectory 2")
                    let  newDirectoryPath2 = (newDirectoryPath1) + "/" + self.timestampString;
                    
                    do {
                        try self.fm.createDirectory(atPath: newDirectoryPath2, withIntermediateDirectories: true, attributes: nil)
                    } catch {
                        print("Error creating /headAndNeck/\(input)/\(self.timestamp) folder in documents dir: \(error)")
                    }
                    
                    print("saveImageToDocumentDirectory 3")
                    //                let directoryPath =  NSHomeDirectory().appending("/Documents/headAndNeck/\(input)/\(self.timestamp)")
                    /*
                    let fileUrl = Foundation.URL(string: newDirectoryPath2)
                    
                    let filename = "/\(self.timestamp)".appending(".jpg")
                    let filepath = newDirectoryPath2.appending(filename)
                    var urlString: String = fileUrl!.path
 */
                    
                    print("saveImageToDocumentDirectory 4")
                    
                    let items = try! self.fm.contentsOfDirectory(atPath: newDirectoryPath2)
                    print("saveImageToDocumentDirectory 5")
                    print(items)
                    
                    //                let url = NSURL.fileURL(withPath: filepath)
                    do {
                        try UIImageJPEGRepresentation(capturedImage2, 1.0)?.write(to: myurl, options: .atomic)
                        print("saving image to " + myurl.absoluteString);
                        return String.init(myurl.absoluteString)
                        
                    } catch {
                        print(error)
                        print("file cant not be save at path \(myurl.absoluteString), with error : \(error)");
                        return myurl.absoluteString
                    }
                }

                saveMyImageToDocumentDirectory(self.capturedImage2);
            
            }
        
        }
 
            func saveImageToDocumentDirectory(_ capturedImage2: UIImage) -> String {
                print("saveImageToDocumentDirectory 0");
                let docsurl = try! self.fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                let myurl = docsurl.appendingPathComponent("headAndNeck/\(input)/\(self.timestampString)")
                let  newDirectoryPath = documentDirectoryPath?.appending("/headAndNeck")
                
                print("saveImageToDocumentDirectory 1")

                let  newDirectoryPath1 = newDirectoryPath?.appending("/\(input)")
 
                    do {
                            try self.fm.createDirectory(atPath: newDirectoryPath1!, withIntermediateDirectories: true, attributes: nil)
                    } catch {
                        print("Error creating /headAndNeck/\(input) folder in documents dir: \(error)")
                }
 
                print("saveImageToDocumentDirectory 2")
                let  newDirectoryPath2 = (newDirectoryPath1)! + "/" + self.timestampString;
                
                do {
                    try self.fm.createDirectory(atPath: newDirectoryPath2, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    print("Error creating /headAndNeck/\(input)/\(self.timestamp) folder in documents dir: \(error)")
                }

                                print("saveImageToDocumentDirectory 3")
//                let directoryPath =  NSHomeDirectory().appending("/Documents/headAndNeck/\(input)/\(self.timestamp)")
                let fileUrl = Foundation.URL(string: newDirectoryPath2)

                let filename = "/\(self.timestamp)".appending(".jpg")
                let filepath = newDirectoryPath2.appending(filename)
                var urlString: String = fileUrl!.path

                                print("saveImageToDocumentDirectory 4")

                let items = try! self.fm.contentsOfDirectory(atPath: newDirectoryPath2)
                                print("saveImageToDocumentDirectory 5")
                print(items)

//                let url = NSURL.fileURL(withPath: filepath)
                do {
                    try UIImageJPEGRepresentation(capturedImage2, 1.0)?.write(to: myurl, options: .atomic)
                    print("saving image to " + myurl.absoluteString);
                    return String.init(myurl.absoluteString)
                    
                } catch {
                    print(error)
                    print("file cant not be save at path \(filepath), with error : \(error)");
                    return filepath
                }
            }


            
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })

        
    }

    @IBAction func saveLeftArmPhoto(_ sender: Any) {
        func configurationTextField(textField: UITextField!)
        {
            print("generating the TextField")
            textField.placeholder = "Enter name"
            tField = textField
        }
        
        func handleCancel(alertView: UIAlertAction!)
        {
            print("Cancelled !!")
        }
        
        var alert = UIAlertController(title: "Enter Mole Name", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: configurationTextField)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:handleCancel))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler:{ (UIAlertAction) in
            print("Done !!")
            
            print("Item : \(String(describing: self.tField.text))")
            let input = self.tField.text
            if input != nil {
                
                let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
                
                if let documentDirectoryPath = documentDirectoryPath {
                    // create the custom folder path
                    
                    let  newDirectoryPath = documentDirectoryPath.appending("/leftArm/\(input)/\(self.timestamp)")
                    let fileManager = FileManager.default
                    if !fileManager.fileExists(atPath: newDirectoryPath) {
                        do {
                            try fileManager.createDirectory(atPath: newDirectoryPath,
                                                            withIntermediateDirectories: false,
                                                            attributes: nil)
                        } catch {
                            print("Error creating /leftArm/\(input) folder in documents dir: \(error)")
                        }
                    }
                }
                
            }
            func saveImageToDocumentDirectory(_ capturedImage2: UIImage) -> String {
                let directoryPath =  NSHomeDirectory().appending("/Documents/leftArm/\(input)/\(self.timestamp)")
                if !FileManager.default.fileExists(atPath: directoryPath) {
                    do {
                        try FileManager.default.createDirectory(at: NSURL.fileURL(withPath: directoryPath), withIntermediateDirectories: true, attributes: nil)
                    } catch {
                        print(error)
                    }
                }
                let filename = "leftArm\(input)\(self.timestamp)".appending(".jpg")
                let filepath = directoryPath.appending(filename)
                let url = NSURL.fileURL(withPath: filepath)
                do {
                    try UIImageJPEGRepresentation(capturedImage2, 1.0)?.write(to: url, options: .atomic)
                    return String.init("/Documents/leftArm/\(input)/\(self.timestamp)/\(filename)")
                    
                } catch {
                    print(error)
                    print("file cant not be save at path \(filepath), with error : \(error)");
                    return filepath
                }
            }
            
            
            
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        

    }

    @IBAction func saveRightArmPhoto(_ sender: Any) {
        func configurationTextField(textField: UITextField!)
        {
            print("generating the TextField")
            textField.placeholder = "Enter name"
            tField = textField
        }
        
        func handleCancel(alertView: UIAlertAction!)
        {
            print("Cancelled !!")
        }
        
        var alert = UIAlertController(title: "Enter Mole Name", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: configurationTextField)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:handleCancel))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler:{ (UIAlertAction) in
            print("Done !!")
            
            print("Item : \(String(describing: self.tField.text))")
            let input = self.tField.text
            if input != nil {
                
                let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
                
                if let documentDirectoryPath = documentDirectoryPath {
                    // create the custom folder path
                    
                    let  newDirectoryPath = documentDirectoryPath.appending("/rightArm/\(input)/\(self.timestamp)")
                    let fileManager = FileManager.default
                    if !fileManager.fileExists(atPath: newDirectoryPath) {
                        do {
                            try fileManager.createDirectory(atPath: newDirectoryPath,
                                                            withIntermediateDirectories: false,
                                                            attributes: nil)
                        } catch {
                            print("Error creating /rightArm/\(input) folder in documents dir: \(error)")
                        }
                    }
                }
                
            }
            func saveImageToDocumentDirectory(_ capturedImage2: UIImage) -> String {
                let directoryPath =  NSHomeDirectory().appending("/Documents/rightArm/\(input)/\(self.timestamp)")
                if !FileManager.default.fileExists(atPath: directoryPath) {
                    do {
                        try FileManager.default.createDirectory(at: NSURL.fileURL(withPath: directoryPath), withIntermediateDirectories: true, attributes: nil)
                    } catch {
                        print(error)
                    }
                }
                let filename = "rightArm\(input)\(self.timestamp)".appending(".jpg")
                let filepath = directoryPath.appending(filename)
                let url = NSURL.fileURL(withPath: filepath)
                do {
                    try UIImageJPEGRepresentation(capturedImage2, 1.0)?.write(to: url, options: .atomic)
                    return String.init("/Documents/rightArm/\(input)/\(self.timestamp)/\(filename)")
                    
                } catch {
                    print(error)
                    print("file cant not be save at path \(filepath), with error : \(error)");
                    return filepath
                }
            }
            
            
            
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        

    }

    @IBAction func saveStomachPhoto(_ sender: Any) {
        func configurationTextField(textField: UITextField!)
        {
            print("generating the TextField")
            textField.placeholder = "Enter name"
            tField = textField
        }
        
        func handleCancel(alertView: UIAlertAction!)
        {
            print("Cancelled !!")
        }
        
        var alert = UIAlertController(title: "Enter Mole Name", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: configurationTextField)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:handleCancel))
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler:{ (UIAlertAction) in
            print("Done !!")
            
            print("Item : \(String(describing: self.tField.text))")
            let input = self.tField.text
            if input != nil {
                
                let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
                
                if let documentDirectoryPath = documentDirectoryPath {
                    // create the custom folder path
                    
                    let  newDirectoryPath = documentDirectoryPath.appending("/stomach/\(input)/\(self.timestamp)")
                    let fileManager = FileManager.default
                    if !fileManager.fileExists(atPath: newDirectoryPath) {
                        do {
                            try fileManager.createDirectory(atPath: newDirectoryPath,
                                                            withIntermediateDirectories: false,
                                                            attributes: nil)
                        } catch {
                            print("Error creating /stomach/\(input) folder in documents dir: \(error)")
                        }
                    }
                }
                
            }
            func saveImageToDocumentDirectory(_ capturedImage2: UIImage) -> String {
                let directoryPath =  NSHomeDirectory().appending("/Documents/stomach/\(input)/\(self.timestamp)")
                if !FileManager.default.fileExists(atPath: directoryPath) {
                    do {
                        try FileManager.default.createDirectory(at: NSURL.fileURL(withPath: directoryPath), withIntermediateDirectories: true, attributes: nil)
                    } catch {
                        print(error)
                    }
                }
                let filename = "stomach\(input)\(self.timestamp)".appending(".jpg")
                let filepath = directoryPath.appending(filename)
                let url = NSURL.fileURL(withPath: filepath)
                do {
                    try UIImageJPEGRepresentation(capturedImage2, 1.0)?.write(to: url, options: .atomic)
                    return String.init("/Documents/stomach/\(input)/\(self.timestamp)/\(filename)")
                    
                } catch {
                    print(error)
                    print("file cant not be save at path \(filepath), with error : \(error)");
                    return filepath
                }
            }
            
            
            
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        

    }
    @IBAction func saveBackPhoto(_ sender: Any) {
        func configurationTextField(textField: UITextField!)
        {
            print("generating the TextField")
            textField.placeholder = "Enter name"
            tField = textField
        }
        
        func handleCancel(alertView: UIAlertAction!)
        {
            print("Cancelled !!")
        }
        
        var alert = UIAlertController(title: "Enter Mole Name", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: configurationTextField)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:handleCancel))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler:{ (UIAlertAction) in
            print("Done !!")
            
            print("Item : \(String(describing: self.tField.text))")
            let input = self.tField.text
            if input != nil {
                
                let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
                
                if let documentDirectoryPath = documentDirectoryPath {
                    // create the custom folder path
                    
                    let  newDirectoryPath = documentDirectoryPath.appending("/back/\(input)/\(self.timestamp)")
                    let fileManager = FileManager.default
                    if !fileManager.fileExists(atPath: newDirectoryPath) {
                        do {
                            try fileManager.createDirectory(atPath: newDirectoryPath,
                                                            withIntermediateDirectories: false,
                                                            attributes: nil)
                        } catch {
                            print("Error creating /back/\(input) folder in documents dir: \(error)")
                        }
                    }
                }
                
            }
            func saveImageToDocumentDirectory(_ capturedImage2: UIImage) -> String {
                let directoryPath =  NSHomeDirectory().appending("/Documents/back/\(input)/\(self.timestamp)")
                if !FileManager.default.fileExists(atPath: directoryPath) {
                    do {
                        try FileManager.default.createDirectory(at: NSURL.fileURL(withPath: directoryPath), withIntermediateDirectories: true, attributes: nil)
                    } catch {
                        print(error)
                    }
                }
                let filename = "back\(input)\(self.timestamp)".appending(".jpg")
                let filepath = directoryPath.appending(filename)
                let url = NSURL.fileURL(withPath: filepath)
                do {
                    try UIImageJPEGRepresentation(capturedImage2, 1.0)?.write(to: url, options: .atomic)
                    return String.init("/Documents/back/\(input)/\(self.timestamp)/\(filename)")
                    
                } catch {
                    print(error)
                    print("file cant not be save at path \(filepath), with error : \(error)");
                    return filepath
                }
            }
            
            
            
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        

    }
    @IBAction func saveLeftLegPhoto(_ sender: Any) {
        func configurationTextField(textField: UITextField!)
        {
            print("generating the TextField")
            textField.placeholder = "Enter name"
            tField = textField
        }
        
        func handleCancel(alertView: UIAlertAction!)
        {
            print("Cancelled !!")
        }
        
        var alert = UIAlertController(title: "Enter Mole Name", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: configurationTextField)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:handleCancel))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler:{ (UIAlertAction) in
            print("Done !!")
            
            print("Item : \(String(describing: self.tField.text))")
            let input = self.tField.text
            if input != nil {
                
                let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
                
                if let documentDirectoryPath = documentDirectoryPath {
                    // create the custom folder path
                    
                    let  newDirectoryPath = documentDirectoryPath.appending("/leftLeg/\(input)/\(self.timestamp)")
                    let fileManager = FileManager.default
                    if !fileManager.fileExists(atPath: newDirectoryPath) {
                        do {
                            try fileManager.createDirectory(atPath: newDirectoryPath,
                                                            withIntermediateDirectories: false,
                                                            attributes: nil)
                        } catch {
                            print("Error creating /leftLeg/\(input) folder in documents dir: \(error)")
                        }
                    }
                }
                
            }
            func saveImageToDocumentDirectory(_ capturedImage2: UIImage) -> String {
                let directoryPath =  NSHomeDirectory().appending("/Documents/leftLeg/\(input)/\(self.timestamp)")
                if !FileManager.default.fileExists(atPath: directoryPath) {
                    do {
                        try FileManager.default.createDirectory(at: NSURL.fileURL(withPath: directoryPath), withIntermediateDirectories: true, attributes: nil)
                    } catch {
                        print(error)
                    }
                }
                let filename = "leftLeg\(input)\(self.timestamp)".appending(".jpg")
                let filepath = directoryPath.appending(filename)
                let url = NSURL.fileURL(withPath: filepath)
                do {
                    try UIImageJPEGRepresentation(capturedImage2, 1.0)?.write(to: url, options: .atomic)
                    return String.init("/Documents/leftLeg/\(input)/\(self.timestamp)/\(filename)")
                    
                } catch {
                    print(error)
                    print("file cant not be save at path \(filepath), with error : \(error)");
                    return filepath
                }
            }
            
            
            
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        

    }
    
    @IBAction func saverightLegPhoto(_ sender: Any) {
        func configurationTextField(textField: UITextField!)
        {
            print("generating the TextField")
            textField.placeholder = "Enter name"
            tField = textField
        }
        
        func handleCancel(alertView: UIAlertAction!)
        {
            print("Cancelled !!")
        }
        
        var alert = UIAlertController(title: "Enter Mole Name", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: configurationTextField)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:handleCancel))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler:{ (UIAlertAction) in
            print("Done !!")
            
            print("Item : \(String(describing: self.tField.text))")
            let input = self.tField.text
            if input != nil {
                
                let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
                
                if let documentDirectoryPath = documentDirectoryPath {
                    // create the custom folder path
                    
                    let  newDirectoryPath = documentDirectoryPath.appending("/rightLeg/\(input)/\(self.timestamp)")
                    let fileManager = FileManager.default
                    if !fileManager.fileExists(atPath: newDirectoryPath) {
                        do {
                            try fileManager.createDirectory(atPath: newDirectoryPath,
                                                            withIntermediateDirectories: false,
                                                            attributes: nil)
                        } catch {
                            print("Error creating /rightLeg/\(input) folder in documents dir: \(error)")
                        }
                    }
                }
                
            }
            func saveImageToDocumentDirectory(_ capturedImage2: UIImage) -> String {
                let directoryPath =  NSHomeDirectory().appending("/Documents/rightLeg/\(input)/\(self.timestamp)")
                if !FileManager.default.fileExists(atPath: directoryPath) {
                    do {
                        try FileManager.default.createDirectory(at: NSURL.fileURL(withPath: directoryPath), withIntermediateDirectories: true, attributes: nil)
                    } catch {
                        print(error)
                    }
                }
                let filename = "rightLeg\(input)\(self.timestamp)".appending(".jpg")
                let filepath = directoryPath.appending(filename)
                let url = NSURL.fileURL(withPath: filepath)
                do {
                    try UIImageJPEGRepresentation(capturedImage2, 1.0)?.write(to: url, options: .atomic)
                    return String.init("/Documents/rightLeg/\(input)/\(self.timestamp)/\(filename)")
                    
                } catch {
                    print(error)
                    print("file cant not be save at path \(filepath), with error : \(error)");
                    return filepath
                }
            }
            
            
            
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        

    }
    

  /*  @IBAction func saverightLegPhoto(_ sender: Any) {
        let input = self.tField.text
        if input != nil {
            
            let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
            
            if let documentDirectoryPath = documentDirectoryPath {
                // create the custom folder path
                
                let   newDirectoryPath = documentDirectoryPath.appending("/rightLeg/\(input)")
                let fileManager = FileManager.default
                if !fileManager.fileExists(atPath: newDirectoryPath) {
                    do {
                        try fileManager.createDirectory(atPath: newDirectoryPath,
                                                        withIntermediateDirectories: false,
                                                        attributes: nil)
                    } catch {
                        print("Error creating /rightLeg/\(input) folder in documents dir: \(error)")
                    }
                }
            }
            
        }

    }
    
   */
    override func viewDidLoad() {
        super.viewDidLoad()
            // path to documents directory
            let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
            if let documentDirectoryPath = documentDirectoryPath {
                // create the custom folder path
                let stomachDirectoryPath = documentDirectoryPath.appending("/stomach")
                let fileManager = FileManager.default
                if !fileManager.fileExists(atPath: stomachDirectoryPath) {
                    do {
                        try fileManager.createDirectory(atPath: stomachDirectoryPath,
                                                        withIntermediateDirectories: false,
                                                        attributes: nil)
                    } catch {
                        print("Error creating Stomach folder in documents dir: \(error)")
                    }
                }
                let leftArmDirectoryPath = documentDirectoryPath.appending("/leftArm")
                if !fileManager.fileExists(atPath: leftArmDirectoryPath) {
                    do {
                        try fileManager.createDirectory(atPath: leftArmDirectoryPath,
                                                        withIntermediateDirectories: false,
                                                        attributes: nil)
                    } catch {
                        print("Error creating Left Arm folder in documents dir: \(error)")
                    }
                }
                let rightArmDirectoryPath = documentDirectoryPath.appending("/rightArm")
                if !fileManager.fileExists(atPath: rightArmDirectoryPath) {
                    do {
                        try fileManager.createDirectory(atPath: rightArmDirectoryPath,
                                                        withIntermediateDirectories: false,
                                                        attributes: nil)
                    } catch {
                        print("Error creating Right Arm folder in documents dir: \(error)")
                    }
                }
                let headAndNeckDirectoryPath = documentDirectoryPath.appending("headAndNeck")
                if !fileManager.fileExists(atPath: headAndNeckDirectoryPath) {
                    do {
                        try fileManager.createDirectory(atPath: headAndNeckDirectoryPath,
                                                        withIntermediateDirectories: false,
                                                        attributes: nil)
                    } catch {
                        print("Error creating Head and Neck folder in documents dir: \(error)")
                    }
                }
                let backDirectoryPath = documentDirectoryPath.appending("/back")
                if !fileManager.fileExists(atPath: backDirectoryPath) {
                    do {
                        try fileManager.createDirectory(atPath: backDirectoryPath,
                                                        withIntermediateDirectories: false,
                                                        attributes: nil)
                    } catch {
                        print("Error creating Back folder in documents dir: \(error)")
                    }
                }
                let leftLegDirectoryPath = documentDirectoryPath.appending("/leftLeg")
                if !fileManager.fileExists(atPath: leftLegDirectoryPath) {
                    do {
                        try fileManager.createDirectory(atPath: leftLegDirectoryPath,
                                                        withIntermediateDirectories: false,
                                                        attributes: nil)
                    } catch {
                        print("Error creating Left Leg folder in documents dir: \(error)")
                    }
                }
                let rightLegDirectoryPath = documentDirectoryPath.appending("/rightLeg")
                if !fileManager.fileExists(atPath: rightLegDirectoryPath) {
                    do {
                        try fileManager.createDirectory(atPath: rightLegDirectoryPath,
                                                        withIntermediateDirectories: false,
                                                        attributes: nil)
                    } catch {
                        print("Error creating Right Leg folder in documents dir: \(error)")
                    }
                
                
                
                
                
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

/*    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
