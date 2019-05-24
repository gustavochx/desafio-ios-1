//
//  ListTripOffersViewController.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 22/04/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

class ListTripOffersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presenter: ListTripOffersPresenter?
    var interactor: ListTripOffersInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayers()
        self.tableView.register(UINib(nibName: "OfferTableViewCell", bundle: nil), forCellReuseIdentifier: "offerTableCell")
        self.setNavigationColor()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.getTripOffers()
    }

    private func setupLayers() {
        self.interactor = ListTripOffersInteractor()
        self.presenter = ListTripOffersPresenter()
        self.presenter?.delegate = self
        self.interactor?.delegate = self.presenter
    }


}

extension ListTripOffersViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.offers?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "offerTableCell", for: indexPath) as! OfferTableViewCell
        cell.configure(offer: (self.presenter?.offerForIndex(index: indexPath.row))!)
        return cell
    }


}

extension ListTripOffersViewController: ListTripOffersPresenterDelegate {
    func didPresent(_ offers: [Offer]) {
        self.presenter?.offers = offers
        self.tableView.reloadData()
    }

    func errorOnPresent(_ error: Error) {
        print(error)
    }

    
}
