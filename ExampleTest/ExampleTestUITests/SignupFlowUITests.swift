//
//  SignupFlowUITests.swift
//  ExampleTestUITests
//
//  Created by 이주송 on 2022/12/30.
//

import XCTest

final class SignupFlowUITests: XCTestCase {

    private var app:XCUIApplication!
    private var emailTF:XCUIElement!
    private var passwordTF:XCUIElement!
    private var repeatPasswordTF:XCUIElement!
    private var signupButton:XCUIElement!
    
    override func setUpWithError() throws {
            try super.setUpWithError()
            continueAfterFailure = false
            
            app = XCUIApplication()
            app.launch()
            
            emailTF = app.textFields["emailTF"]
            passwordTF = app.textFields["passwordTF"]
            repeatPasswordTF = app.textFields["repeatPasswordTF"]
            signupButton = app.buttons["signupButton"]
            
        }
    
    func testSignupViewController_DonotMatchPasswordAndRepeatPassword_PresentErrorAlertDialog() {
        
        //Act
        emailTF.tap()
        emailTF.typeText("fomagran6@naver.com")
        
        passwordTF.tap()
        passwordTF.typeText("12345678")
        
        repeatPasswordTF.tap()
        repeatPasswordTF.typeText("123456")
        
        signupButton.tap()
        
        //Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1),"잘못된 정보를 입력하면 경고창이 떠야하는데 안떴어요")
    }
}
