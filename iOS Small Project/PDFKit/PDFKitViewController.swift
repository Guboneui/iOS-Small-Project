//
//  PDFKitViewController.swift
//  iOS Small Project
//
//  Created by 구본의 on 2021/12/26.
//

import UIKit
import PDFKit

class PDFKitViewController: UIViewController {

    let pdfView = PDFView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(pdfView)
        
        // Document
        guard let url = Bundle.main.url(forResource: "CV", withExtension: "pdf") else {
            return
        }
        guard let document = PDFDocument(url: url) else {
            return
        }
        
        pdfView.document = document
        pdfView.delegate = self
        
        //Create document
        let newDocument = PDFDocument()
        guard let page = PDFPage(image: UIImage(systemName: "house")!) else {
            return
        }
        //newDocument.insert(page, at: 0)
        //pdfView.document = newDocument
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = self.view.bounds
     
    }


}


extension PDFKitViewController: PDFViewDelegate {
    
}
