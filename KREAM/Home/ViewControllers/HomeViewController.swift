//
//  HomeViewController.swift
//  KREAM
//
//  Created by 오현민 on 9/26/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var homeDelegate = HomeCollectionViewDelegate(navigationController: self.navigationController)
    private lazy var homeDataSource = HomeCollectionViewDataSource(
        homeData: HomeModel.dummy(),
        justdroppedData: JustDroppedModel.dummy(),
        coldWaveData: ColdWaveModel.dummy()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        
        setupAction()
        setupDelegate()
        setupTag()
        setUpNavigationBarItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true // 뷰 컨트롤러가 나타날 때 숨기기
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false // 뷰 컨트롤러가 사라질 때 나타내기
    }
    
    private lazy var homeView = HomeView().then {
        $0.searchField.addTarget(
            self,
            action: #selector(searchFieldTapped),
            for: .touchUpInside
        )
    }
    
    private func setupDelegate() {
        homeView.firstCollectionView.delegate = homeDelegate
        homeView.firstCollectionView.dataSource = homeDataSource
        
        homeView.secondCollectionView.delegate = homeDelegate
        homeView.secondCollectionView.dataSource = homeDataSource
        
        homeView.thirdCollectionView.delegate = homeDelegate
        homeView.thirdCollectionView.dataSource = homeDataSource
    }
    
    private func setupTag() {
        homeView.firstCollectionView.tag = 1
        homeView.secondCollectionView.tag = 2
        homeView.thirdCollectionView.tag = 3
    }
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(
            self,
            action: #selector(segmentControlValueChanged(segment: )),
            for: .valueChanged
        )
    }
    
    private func setUpNavigationBarItem() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func changeLinePosition(leading: Int, width: Int) {
        UIView.animate(withDuration: 0.2, animations: {
            self.homeView.underLineView.snp.updateConstraints {  $0.leading.equalTo(self.homeView.segmentedControl.snp.leading).offset(leading)
                $0.width.equalTo(width)
            }
            self.view.layoutIfNeeded()
        })
    }
    
    // MARK: - @objc
    @objc
    private func searchFieldTapped() {
        let searchVC = SearchViewController()
        searchVC.modalPresentationStyle = .fullScreen
        searchVC.view.backgroundColor = .white
        present(searchVC, animated: true)
    }
    
    @objc
    private func segmentControlValueChanged(segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            homeView.stackView.isHidden = false
            changeLinePosition(leading: 16, width: 28)
        case 1:
            homeView.stackView.isHidden = true
            changeLinePosition(leading: 71, width: 28)
        case 2:
            homeView.stackView.isHidden = true
            changeLinePosition(leading: 123, width: 56)
        case 3:
            homeView.stackView.isHidden = true
            changeLinePosition(leading: 199, width: 42)
        case 4:
            homeView.stackView.isHidden = true
            changeLinePosition(leading: 264, width: 28)
        case 5:
            homeView.stackView.isHidden = true
            changeLinePosition(leading: 320, width: 28)
        default:
            break
        }
    }
}
