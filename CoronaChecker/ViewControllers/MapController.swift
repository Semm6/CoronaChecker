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

        
        //testlocation Maxima MC Eindhoven
        let secondlocation = MKPointAnnotation()
        secondlocation.coordinate = CLLocationCoordinate2D(latitude: 51.4568053497647, longitude: 5.4877460127580004)
        secondlocation.title = "location1.title"
        secondlocation.subtitle = "location1.subtitle"
        mapView.addAnnotation(secondlocation)
        
        //testlocation Eindhoven (Coolenlaan 3)
        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 51.41588022418173, longitude: 5.471808511802878)
        annontation.title = "Corona testlocatie"
        annontation.subtitle = "Eindhoven Antoon Coolenlaan 3"
        mapView.addAnnotation(annontation)
        
        //testlocation Catharina Ziekenhuis Eindhoven
        let thirdlocation = MKPointAnnotation()
        thirdlocation.coordinate = CLLocationCoordinate2D(latitude: 51.46750039329034, longitude: 5.471953166026649)
        thirdlocation.title = "Catharina Ziekenhuis"
        thirdlocation.subtitle = "Michelangelolaan 2"
        mapView.addAnnotation(thirdlocation)
        
        
        //zoomed on the Netherlands
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 300000, longitudinalMeters: 300000 )
        mapView.setRegion(region, animated: true)
    }
        
    //URL for website
    @IBAction private func Btn_URL(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://coronachecker-ac165.web.app/symptomen.html")! as URL, options: [:], completionHandler: nil)
    }
    
}
    




