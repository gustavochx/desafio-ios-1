//
//  ListCityViewController.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 13/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

class ListCityOffersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var presenter : ListCityOffersPresenter?
    var interactor : ListCityOffersInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayers()
        self.tableView.register(UINib(nibName: "OfferTableViewCell", bundle: nil), forCellReuseIdentifier: "offerTableCell")
        self.interactor?.getOfferForCity()
        self.setNavigationColor()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupLayers() {
        self.interactor = ListCityOffersInteractor()
        self.presenter = ListCityOffersPresenter()
        self.presenter?.delegate = self
        self.interactor?.delegate = self.presenter
    }
}
// Mark: UITableview Delegate e Data Sources
extension ListCityOffersViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.offers?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "offerTableCell", for: indexPath) as! OfferTableViewCell

        cell.configure(offer: (self.presenter?.offerForIndex(index: indexPath.row))!)

        return cell
    }
}

extension ListCityOffersViewController : ListCityOffersPresenterDelegate {

    func didPresent(_ offers: [Offer]) {
        self.presenter?.offers = offers
        self.tableView.reloadData()
    }

    func errorOnPresent(_ error: Error) {
        print(error)
    }
}

