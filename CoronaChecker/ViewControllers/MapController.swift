//
//  MapController.swift
//  CoronaChecker
//
//  Created by Sem de Wilde on 14/12/2020.
//

import UIKit
import MapKit
import StoreKit

class MapController: UIViewController {
    
    //outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var linkButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //review the app (popupp)
        if let windowScene = UIApplication.shared.windows.first?.windowScene { SKStoreReviewController.requestReview(in: windowScene) }

        
        
        //testlocation eindhoven (Coolenlaan 3)
        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 51.41588022418173, longitude: 5.471808511802878)
        annontation.title = "Corona testlocatie"
        annontation.subtitle = "Eindhoven Antoon Coolenlaan 3"
        
        mapView.addAnnotation(annontation)
        
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 300000, longitudinalMeters: 300000 )
        mapView.setRegion(region, animated: true)
    }
        
    //URL for website
    @IBAction func Btn_URL(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://coronachecker-ac165.web.app/symptomen.html")! as URL, options: [:], completionHandler: nil)
    }
    
}
    




