//
//  HalfSheetHepler.swift
//  AircraftInspection
//
//  Created by Роман on 01.05.2024.
//

import Foundation
import SwiftUI

struct HalfSheetHepler<SheetView: View>: UIViewControllerRepresentable {
    
    @Binding var showSheet: Bool
    var sheetView: SheetView
    let controller = UIViewController()
    var onEnd: ()->()
     
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    func makeUIViewController(context: Context) -> UIViewController {
        controller.view.backgroundColor = .clear
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if showSheet {
            
            let sheetController = CustomHostingControllers(rootView: sheetView)
            sheetController.presentationController?.delegate = context.coordinator
            
            uiViewController.present(sheetController, animated: true)
        }else {
            uiViewController.dismiss(animated: true)
        }
    }
    class Coordinator: NSObject, UISheetPresentationControllerDelegate{
        
        var parent: HalfSheetHepler
        
        init(parent: HalfSheetHepler) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.showSheet = false
            parent.onEnd()
        }
    }
}

class CustomHostingControllers<Content: View> : UIHostingController<Content>{
    override func viewDidLoad() {
        view.backgroundColor = .clear
        if let presentationController = presentationController as? UISheetPresentationController{
            presentationController.detents = [
                .medium()
            ]
        }
    
    }
}
