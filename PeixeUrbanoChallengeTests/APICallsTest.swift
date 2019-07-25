//
//  PeixeUrbanoChallengeTests.swift
//  PeixeUrbanoChallengeTests
//
//  Created by Gustavo Henrique on 25/07/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import XCTest

@testable import PeixeUrbanoChallenge

class APICallsTest: XCTestCase {

    var client: PeixeUrbanoClient!

    override func setUp() {
        super.setUp()
        self.client = PeixeUrbanoClient.shared
    }

    override func tearDown() {
        self.client = nil
    }

    func testCallCityOffers() {
        var offers = [Offer]()
        var returnedError: APIError? = nil
        let asyncExpectation = expectation(description: "Request return with the city offers!")

        client.getCityDeals(city: nil) { (response) in
            switch(response) {
            case .success(let responseOffers):
                offers = responseOffers.response.deals!
            case .failed(let error):
                returnedError = error
            }
            asyncExpectation.fulfill()
        }

        waitForExpectations(timeout: 5.0) { (error) in
            XCTAssert(offers.count > 0, "No offers :(")
            XCTAssert(returnedError == nil, "Error on calling endpoint: \(String(describing: returnedError?.localizedDescription))")
        }
    }

    func testFailCallingCityOffers() {
        var offers = [Offer]()
        var returnedError: APIError? = nil
        let asyncExpectation = expectation(description: "Request will fail with not existing city")

        client.getCityDeals(city: "pindamaiangaba") { (response) in
            switch(response) {
            case .success(let responseOffers):
                offers = responseOffers.response.deals!
            case .failed(let error):
                returnedError = error
            }
            asyncExpectation.fulfill()
        }

        waitForExpectations(timeout: 5.0) { (error) in
            XCTAssert(offers.count == 0, "Offers existing for this city :(")
            XCTAssert(returnedError != nil, "This request may be produce an 404 not found error")
        }


    }





}
