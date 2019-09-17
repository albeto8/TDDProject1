//
//  DetailViewControllerTests.swift
//  TDDProject1Tests
//
//  Created by Mario Alberto Barragán Espinosa on 9/16/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import XCTest
@testable import TDDProject1

class DetailViewControllerTests: XCTestCase {
    
    func testDetailImageViewExists() {
        // given
        let sut = DetailViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        XCTAssertNotNil(sut.imageView)
    }
    
    func testDetailViewIsImageView() {
        // given
        let sut = DetailViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        XCTAssertEqual(sut.view, sut.imageView)
    }
    
    func testDetailImageViewBackgroundColor() {
        // given
        let sut = DetailViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        XCTAssertEqual(sut.imageView.backgroundColor, .white)
    }
    
    func testDetailImageViewIsAspectFit() {
        // given
        let sut = DetailViewController()
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        XCTAssertEqual(sut.imageView.contentMode, .scaleAspectFit)
    }
    
    func testDetailLoadsImage() {
        // given
        let filenameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: filenameToTest, in: Bundle.main, compatibleWith: nil)
        
        let sut = DetailViewController()
        sut.selectedImage = filenameToTest
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        XCTAssertEqual(sut.imageView.image, imageToLoad)
    }
}
