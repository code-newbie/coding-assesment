//
//  SplashTests.swift
//  SplashTests
//
//  Created by Ilhammalik on 28/05/20.
//  Copyright © 2020 Ilhammalik. All rights reserved.
//

import Nimble
import Quick
@testable import Splash
@testable import Domains
@testable import SplashWorker
@testable import Common

// swiftlint:disable all
class SplashTests: QuickSpec { //swiftlint:disable:this type_body_length
    override func spec() { //swiftlint:disable:this function_body_length
        // SplashMainPresenter Test
        class SplashMainInteractorToPresenterMock: SplashMainInteractorToPresenter {
            var isDidCheckServerDowntimeCalled: Bool = false
          
            func didCheckServerDowntime(with error: ErrorResponse?) {
                isDidCheckServerDowntimeCalled = true
            }
        }

        class SplashMainPresenterToInteractorMock: SplashMainPresenterToInteractor {
            var presenter: SplashMainInteractorToPresenter?
            var isCheckServerDowntimeCalled: Bool = false
            
            func checkServerDowntime() {
                isCheckServerDowntimeCalled = true
            }
        }

        class SplashMainViewMock: SplashMainPresenterToView {
            var presenter: SplashMainViewToPresenter?
            var isDisplayReprovisioningOverlayCalled: Bool = false
            
            func displayReprovisioningOverlay() {
                isDisplayReprovisioningOverlayCalled = true
            }
        }

        class SplashMainRouterMock: SplashMainPresenterToRouter {
            var isNavigateToPreLoginCalled: Bool = false

            func navigateToPreLogin(_ from: SplashMainPresenterToView) {
                isNavigateToPreLoginCalled = true
            }
        }

        describe("SplashMainPresenter") {
            var sut: SplashMainPresenter!
            var presenterToInteractorMock: SplashMainPresenterToInteractorMock!
            var splashMainView: SplashMainView!
            var splashMainViewMock: SplashMainViewMock!
            var routerMock: SplashMainRouterMock!
            beforeEach {
                presenterToInteractorMock = SplashMainPresenterToInteractorMock()
                sut = SplashMainPresenter(with: presenterToInteractorMock)
                presenterToInteractorMock.presenter = sut
                sut.interactor = presenterToInteractorMock
                splashMainView = SplashMainView(with: sut)
                splashMainViewMock = SplashMainViewMock()
                sut.view = splashMainViewMock
                routerMock = SplashMainRouterMock()
                sut.router = routerMock

            }
            context("viewDidLoad function is called") {
                it("When viewDidLoad is called, all the functions is called in viewDidLoad must be called succesfully") {
                    sut.viewDidLoad()
                    expect(presenterToInteractorMock.isCheckServerDowntimeCalled).to(beTrue())
                }
            }

        }
 
        class SplashWorkerMock: SplashWorkerProtocol {
            //var downtimeDelegate: SplashWorkerDowntimeProtocol?
            var isGetDowntimeStatusCalled: Bool = false

            func getDowntimeStatus() {
                isGetDowntimeStatusCalled = true
            }
        }
        
        describe("SplashMainPresenter") {
            var sut: SplashMainPresenter!
            var presenterToInteractorMock: SplashMainPresenterToInteractorMock!
            var splashMainView: SplashMainView!
            var splashMainViewMock: SplashMainViewMock!
            var routerMock: SplashMainRouterMock!
            beforeEach {
                presenterToInteractorMock = SplashMainPresenterToInteractorMock()
                sut = SplashMainPresenter(with: presenterToInteractorMock)
                presenterToInteractorMock.presenter = sut
                sut.interactor = presenterToInteractorMock
                splashMainView = SplashMainView(with: sut)
                splashMainViewMock = SplashMainViewMock()
                sut.view = splashMainViewMock
                routerMock = SplashMainRouterMock()
                sut.router = routerMock
                
            }
            
            context("viewDidLoad function is called") {
                it("When viewDidLoad is called, all the functions is called in viewDidLoad must be called succesfully") {
                    splashMainView.presenter?.viewDidLoad()
                   // expect(presenterToInteractorMock.isAnonymousTokenCalled).to(beTrue())
                }
            }
        }
        describe("SplashMainInteractor") {
            var sut: SplashMainInteractor!
            var workerMock: SplashWorkerMock!
            var presenterMock: SplashMainInteractorToPresenterMock!
  
            beforeEach {
                presenterMock = SplashMainInteractorToPresenterMock()
                workerMock = SplashWorkerMock()
                sut = SplashMainInteractor(with: workerMock)
                sut.presenter = presenterMock
            }
            
            context("checkForDeviceUuid function is called") {
                it("When checkForDeviceUuid is called, all the functions are in checkForDeviceUuid must be called succesfully") {
                    //sut.checkForDeviceUuid()
                    //expect(sut.settingContext.deviceId).notTo(beNil())
                }
            }
        }
    }
}
