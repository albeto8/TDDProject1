//
//  TDDProject1Tests.swift
//  TDDProject1Tests
//
//  Created by Mario Alberto Barragán Espinosa on 9/16/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import XCTest
@testable import TDDProject1

class TDDProject1Tests: XCTestCase {
    
    func testLoadingImages() {
        // given
        let sut = ViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        XCTAssertEqual(sut.pictures.count, 10, "There should be ten pictures.")
    }
    
    func testTableExists() {
        // given
        let sut = ViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        XCTAssertNotNil(sut.tableView)
    }
    
    func testTableViewHasCorrectRowCount() {
        // given
        let sut = ViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        let rowCount = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(rowCount, sut.pictures.count, "There should be ten pictures.")
    }
    
    func testEachCellHasTheCorrectText() {
        // given
        let sut = ViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        for (index, picture) in sut.pictures.enumerated() {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)
            XCTAssertEqual(cell.textLabel?.text, picture)
        }
    }
    
    func testCellsHaveDisclousureIndicators() {
        // given
        let sut = ViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        for index in sut.pictures.indices {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)
            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
    }
    
    func testViewControllerUsesLargeTitles() {
        // given
        let sut = ViewController()
        _ = UINavigationController(rootViewController: sut)
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        XCTAssertTrue(sut.navigationController?.navigationBar.prefersLargeTitles ?? false)
    }
    
    func testNavigationBarHasStormViewerTitle() {
        // given
        let sut = ViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        XCTAssertEqual(sut.title, "Storm Viewer")
    }
    
    func testSelectingImageShowsDetail() {
        // given
        let sut = ViewController()
        var selectedImage: String?
        let testIndexPath = IndexPath(row: 0, section: 0)
        
        // when
        sut.pictureSelectAction = {
            selectedImage = $0
        }
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        
        // then
        XCTAssertEqual(selectedImage, "nssl0049.jpg")
        /*
         // test not using coordinators
        // given
        let sut = ViewController()
        let navigationController = UINavigationController(rootViewController: sut)
        let testIndexPath = IndexPath(row: 0, section: 0)
        
        // when
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        
        // create an expectation...
        let expectation = XCTestExpectation(description: "Selecting a table view cell")
        // ...then fulfill it asynchronously
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        
        // then
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(navigationController.topViewController is DetailViewController)
        */
    }
    
    func testSelectingImageShowsDetailImage() {
        // given
        let sut = ViewController()
        let testIndexPath = IndexPath(row: 0, section: 0)
        let filenameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: filenameToTest, in: Bundle.main, compatibleWith: nil)
        
        // when
        sut.pictureSelectAction = {
            let detail = DetailViewController()
            detail.selectedImage = $0
            detail.loadViewIfNeeded()
            XCTAssertEqual(detail.imageView.image, imageToLoad)
        }
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        /*
         // test not using coordinators
        // given
        let sut = ViewController()
        let navigationController = UINavigationController(rootViewController: sut)
        let testIndexPath = IndexPath(row: 0, section: 0)
        let filenameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: filenameToTest, in: Bundle.main, compatibleWith: nil)
        
        // when
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        // create an expectation...
        let expectation = XCTestExpectation(description: "Selecting a table view cell")
        // ...then fulfill it asynchronously
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        // then
        wait(for: [expectation], timeout: 1)
        guard let detail = navigationController.topViewController as? DetailViewController else {
            XCTFail("Didn't push to a detail view controller.")
            return
        }
        
        detail.loadViewIfNeeded()
        
        XCTAssertEqual(detail.imageView.image, imageToLoad)
        */
    }
}
