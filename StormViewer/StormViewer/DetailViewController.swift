//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Tan Zhi Yang on 5/7/19.
//  Copyright © 2019 Tan Zhi Yang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View Controller Properties
        navigationItem.largeTitleDisplayMode = .never

        // Optional unwrapping -> Setup DVC
        if let imageToLoad = selectedImage {
            title = "\(imageToLoad)"
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
            imageView.image = UIImage(named:imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    // To be available to the OBJ-C OS for method calling (UIBarButtonItem)
    // #selector methods also need to be OBJ-C
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        // UIActivityViewController allows for sharing content with other apps and services
        let vc = UIActivityViewController(activityItems:[image], applicationActivities:[])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated:true)
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
