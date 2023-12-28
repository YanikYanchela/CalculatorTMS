//
//  ViewController.swift
//  calculator
//
//  Created by Дмитрий Яновский on 24.12.23.
//

import UIKit

class ViewController: UIViewController {
   
    let StackViewMain = UIStackView()
    let viewMain = UIView()
    let viewResult = UIView()
    let resultLabel = UILabel()
    
    var firstValue: Double? = 0
    var secondValue: Double? = 0
    var selectedOperation: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewResult()
        resLabel()
        uiViewMain()
        stackMain()
        
    
    }

    @objc func numberButtonPress(_ sender: UIButton) {
        if let buttonTitle = sender.titleLabel?.text {
            resultLabel.text = (resultLabel.text ?? "") + buttonTitle
        }
    }
    

 

    
    func stackMain() {
        StackViewMain.axis = .vertical
        StackViewMain.distribution = .fillEqually
        StackViewMain.backgroundColor = #colorLiteral(red: 0.9607843757, green: 0.9607843757, blue: 0.9607843757, alpha: 1)
        StackViewMain.layer.cornerRadius = 20
        StackViewMain.spacing = 8
        view.addSubview(StackViewMain)
        StackViewMain.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            StackViewMain.widthAnchor.constraint(equalToConstant: 200),
            StackViewMain.heightAnchor.constraint(equalToConstant: 350),
            StackViewMain.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            StackViewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            StackViewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        // Создаем первый горизонтальный UIStackView
        let stackView1 = createStackView()
        StackViewMain.addArrangedSubview(stackView1)
       
        
        // Создаем второй горизонтальный UIStackView
        let stackView2 = createStackView()
        StackViewMain.addArrangedSubview(stackView2)
        
        // Создаем второй горизонтальный UIStackView
        let stackView3 = createStackView()
        StackViewMain.addArrangedSubview(stackView3)
        
        // Создаем второй горизонтальный UIStackView
        let stackView4 = createStackView()
        StackViewMain.addArrangedSubview(stackView4)
        
        // Создаем второй горизонтальный UIStackView
        let stackView5 = createStackView()
        StackViewMain.addArrangedSubview(stackView5)
        
        // Добавляем элементы в первый горизонтальный UIStackView
        let acButton = createButton(withTitle: "AC")
        acButton.backgroundColor = #colorLiteral(red: 0.6712463811, green: 0.6712463811, blue: 0.6712463811, alpha: 1)
        acButton.setTitleColor(.white, for: .normal)
        stackView1.addArrangedSubview(acButton)
       
        let pmButton = createButton(withTitle: "+/-")
        pmButton.backgroundColor = #colorLiteral(red: 0.6712463811, green: 0.6712463811, blue: 0.6712463811, alpha: 1)
        pmButton.setTitleColor(.white, for: .normal)
        stackView1.addArrangedSubview(pmButton)
       
        let percentButton = createButton(withTitle: "%")
        percentButton.backgroundColor = #colorLiteral(red: 0.6712463811, green: 0.6712463811, blue: 0.6712463811, alpha: 1)
        percentButton.setTitleColor(.white, for: .normal)
        stackView1.addArrangedSubview(percentButton)
 
        
        let devButton = createButton(withTitle: "÷")
        devButton.backgroundColor = #colorLiteral(red: 1, green: 0.6265729777, blue: 0.097385673, alpha: 1)
        devButton.setTitleColor(.white, for: .normal)
        stackView1.addArrangedSubview(devButton)
        
        // Добавляем элементы во второй горизонтальный UIStackView
        stackView2.addArrangedSubview(createButton(withTitle: "7"))
        stackView2.addArrangedSubview(createButton(withTitle: "8"))
        stackView2.addArrangedSubview(createButton(withTitle: "9"))
        let xButton = createButton(withTitle: "x")
        xButton.backgroundColor = #colorLiteral(red: 1, green: 0.6265729777, blue: 0.097385673, alpha: 1)
        xButton.setTitleColor(.white, for: .normal)
        stackView2.addArrangedSubview(xButton)
        
        // Добавляем элементы во второй горизонтальный UIStackView
        stackView3.addArrangedSubview(createButton(withTitle: "4"))
        stackView3.addArrangedSubview(createButton(withTitle: "5"))
        stackView3.addArrangedSubview(createButton(withTitle: "6"))
        let minButton = createButton(withTitle: "-")
        minButton.backgroundColor = #colorLiteral(red: 1, green: 0.6265729777, blue: 0.097385673, alpha: 1)
        minButton.setTitleColor(.white, for: .normal)
        stackView3.addArrangedSubview(minButton)
        
        // Добавляем элементы во второй горизонтальный UIStackView
        let oneButton = createButton(withTitle: "1")
        stackView4.addArrangedSubview(oneButton)
        
        stackView4.addArrangedSubview(createButton(withTitle: "2"))
        stackView4.addArrangedSubview(createButton(withTitle: "3"))
        let plusButton = createButton(withTitle: "+")
        plusButton.backgroundColor = #colorLiteral(red: 1, green: 0.6265729777, blue: 0.097385673, alpha: 1)
        plusButton.setTitleColor(.white, for: .normal)
        stackView4.addArrangedSubview(plusButton)
        
        // Добавляем элементы во второй горизонтальный UIStackView
        stackView5.addArrangedSubview(createButton(withTitle: "0"))
        stackView5.addArrangedSubview(createButton(withTitle: "."))
        let resButton = createButton(withTitle: "=")
        resButton.backgroundColor = #colorLiteral(red: 1, green: 0.6265729777, blue: 0.097385673, alpha: 1)
        resButton.setTitleColor(.white, for: .normal)
        stackView5.addArrangedSubview(resButton)
        
        
    }
    
    func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        stackView.spacing = 8
        return stackView
    }
    
    func createButton(withTitle title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9607843757, green: 0.9607843757, blue: 0.9607843757, alpha: 1)
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 5
        
               return button
           }

    func uiViewMain(){
        viewMain.backgroundColor = #colorLiteral(red: 0.9607843757, green: 0.9607843757, blue: 0.9607843757, alpha: 1)
        viewMain.translatesAutoresizingMaskIntoConstraints = false
        viewMain.layer.cornerRadius = 30
        viewMain.layer.shadowOpacity = 30
        view.addSubview(viewMain)
        NSLayoutConstraint.activate([
            viewMain.widthAnchor.constraint(equalToConstant: 200),
            viewMain.heightAnchor.constraint(equalToConstant: 500),
            viewMain.topAnchor.constraint(equalTo: view.topAnchor, constant: 420),
            viewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            viewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0)
        ])
    }
    func ViewResult(){
        viewResult.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewResult.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(viewResult)
        NSLayoutConstraint.activate([
            viewResult.widthAnchor.constraint(equalToConstant: 200),
            viewResult.heightAnchor.constraint(equalToConstant: 450),
            viewResult.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            viewResult.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            viewResult.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0)])
           
    }
    func resLabel(){
        resultLabel.font = UIFont.boldSystemFont(ofSize: 50)
        resultLabel.textColor = .white
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.backgroundColor = .black
        view.addSubview(resultLabel)
        NSLayoutConstraint.activate([
            resultLabel.widthAnchor.constraint(equalToConstant: 200),
            resultLabel.heightAnchor.constraint(equalToConstant: 100),
            resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 315),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0)
        
    ])
    }
}
