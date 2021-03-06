//
//  ViperPresenter.swift
//  ACViper
//
//  Created by AppCraft LLC on 8/23/21.
//

import UIKit

public protocol ViperPresenterInput: AnyObject {
    var _view: ViperViewInput? { get set }
    var _interactor: ViperInteractorInput? { get set }
    var _router: ViperRouterInput? { get set }
}

open class ViperPresenter: ViperPresenterInput, ViperViewOutput, ViperInteractorOutput {
    
    // MARK: - Props
    public weak var _view: ViperViewInput?
    public var _interactor: ViperInteractorInput?
    public var _router: ViperRouterInput?
    
    // MARK: - Initialization
    public init() { }
    
    // MARK: - ViperPresenterInputProtocol
    
    // MARK: - ViperViewOutputProtocol
    open func viewIsReady(_ controller: UIViewController) { }
    
    open func loadData() { }
    
    open func reloadData() { }
        
    open func goBack(animated: Bool) {
        self._router?.goBack(animated: animated)
    }
    
    open func close(animated: Bool) {
        self._router?.dismiss(animated: animated)
    }
    
    // MARK: - ViperInteractorOutputProtocol
    open func beginLoading() {
        self._view?.beginLoading()
    }
    
    open func finishLoading(with error: Error?) {
        self._view?.finishLoading(with: error)
    }
    
    open func provideMessage(_ title: String?, message: String?) {
        self._view?.show(title: title, message: message, animated: true)
    }
    
}
