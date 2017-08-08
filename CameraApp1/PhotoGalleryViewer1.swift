//
//  PhotoGalleryViewer1.swift
//  CameraApp1
//
//  Created by Rajita Pujare on 8/3/17.
//  Copyright © 2017 Rajita Pujare. All rights reserved.
//

import UIKit

class PhotoGalleryViewer1: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var pathname = String()
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    let fm = FileManager.default
    var images = [UIImage]()
    let docsurl = try! FileManager.default.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myurl = docsurl.appendingPathComponent("\(pathname)")
        var urlString: String = myurl.path
        
        let items = try! fm.contentsOfDirectory(atPath: urlString)
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        
        // Do any additional setup after loading the view.
        loadImages()

    }
    
    //    private func load(fileName: String) -> UIImage? {
    func loadImages() {
        let fileURL = docsurl.appendingPathComponent(pathname)
        do {
            let imageData = try Data(contentsOf: fileURL)
            let image1 = UIImage(data: imageData)
            images.append(image1!)
            self.collectionView.reloadData()
        } catch {
            print("Error loading image : \(error)")
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
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! PhotoCell
        let image = images[indexPath.row]
        cell.ph.image = image
        
        
        // Configure the cell
        
        return cell
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
