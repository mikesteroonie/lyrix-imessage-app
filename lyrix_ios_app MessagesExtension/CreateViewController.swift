//
//  MessagesViewController.swift
//  lyrix_ios_app MessagesExtension
//
//  Created by Michael Kim on 3/15/24.
//

import UIKit
import Messages


class CreateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var introPicker: UIPickerView = UIPickerView()
    var dummyArray = ["drake","kanye","travis","sza","taylor", "future","weeknd","olivia"]
    
    var startButton:UIButton = UIButton()
    
    var artistsCollectionView:UICollectionView!
    
    //title labels for the messageview controller
    var titleLabel: UILabel!
    var titleEst: UILabel!
    var titleComp: UILabel!
    var firstStageTitle: UILabel!
    var firstStageOneLiner: UILabel!
    var firstStagePronunciation: UILabel!
    var firstStageGrammar: UILabel!
    var firstStageDefinition: UILabel!
//    var firstStageImageView: UIImageView!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
//            titleLabel = UILabel(frame: CGRect(x: 20, y: 50, width: self.view.bounds.width - 140, height: 40))
//            titleLabel.text = "LYRIX"
//            titleLabel.font = UIFont(name: "Arial", size: 24)
//            titleLabel.textColor = .black
//
//            //image for the dictionary pronunciation stuff
//            titleImageView = UIImageView(frame: CGRect(x: self.view.bounds.width - 100, y: 50, width: 80, height: 40))
//            titleImageView.contentMode = .scaleAspectFit
//            titleImageView.image = UIImage(named: "yourImageName")
//            // larget text box for the left hand size
//            let largeTextBox = UITextView(frame: CGRect(x: 20, y: titleLabel.frame.maxY + 10, width: self.view.bounds.width / 2 - 30, height: 100))
//            largeTextBox.font = UIFont(name: "Arial", size: 18)
//            largeTextBox.backgroundColor = UIColor.lightGray // Just to make it visible
//
//            //ADDED: Title
//            self.view.addSubview(titleLabel)
//            //ADDED: definition images
//            self.view.addSubview(titleImageView)
//            // ADDED: Name of the page in arial font
//            self.view.addSubview(largeTextBox)
//            //ADDED: artist cells
//
//            setupArtistsCollectionView()
            
//            self.view.addSubview(artistsCollectionView)
        // Adjust the y position to ensure it's visible below the navigation bar.
        
        
        
        
        
        // Title Label
            titleLabel = UILabel()
            titleLabel.text = "\"LYRIX\""
            titleLabel.font = UIFont(name: "Arial-BoldMT", size: 40)
            titleLabel.textColor = .black
            titleLabel.sizeToFit() // Auto-size label based on text content
            titleLabel.center = CGPoint(x: self.view.bounds.width / 2 - 10, y: 30) // Center horizontally and position vertically
            self.view.addSubview(titleLabel)
        
        titleEst = UILabel()
        titleEst.text = "est. 2024"
        titleEst.font = UIFont(name: "Arial-BoldMT", size: 7)
        titleEst.textColor = .black
        titleEst.sizeToFit() // Auto-size label based on text content
        titleEst.center = CGPoint(x: titleLabel.frame.minX + 30, y: titleLabel.frame.maxY + 1) // Center horizontally and position vertically
        self.view.addSubview(titleEst)
        
        titleComp = UILabel()
        titleComp.text = "cold dreams LLC"
        titleComp.font = UIFont(name: "Arial-BoldMT", size: 7)
        titleComp.textColor = .black
        titleComp.sizeToFit() // Auto-size label based on text content
        titleComp.center = CGPoint(x: titleLabel.frame.maxX - 30, y: titleLabel.frame.maxY + 1) // Center horizontally and position vertically
        self.view.addSubview(titleComp)

            // First Stage Title
            firstStageTitle = UILabel(frame: CGRect(x: 20, y: titleLabel.frame.maxY + 20, width: self.view.bounds.width / 2, height: 100)) // Adjust height as needed
            firstStageTitle.numberOfLines = 3
            firstStageTitle.text = "ARTIST SELECTION"
            firstStageTitle.font = UIFont(name: "Arial-BoldMT", size: 28)
            firstStageTitle.textColor = .black
            self.view.addSubview(firstStageTitle)
            // First Stage Title
        firstStageOneLiner = UILabel(frame: CGRect(x: 20, y: firstStageTitle.frame.maxY + 20, width: self.view.bounds.width / 2, height: 20)) // Adjust height as needed
            firstStageOneLiner.numberOfLines = 0
            firstStageOneLiner.text = "Who you be listening to?"
            firstStageOneLiner.font = UIFont.systemFont(ofSize: 10)
            firstStageOneLiner.textColor = .black
//            self.view.addSubview(firstStageOneLiner)

            // First Stage Pronunciation
        firstStagePronunciation = UILabel(frame: CGRect(x: firstStageTitle.frame.maxX + 3, y: titleLabel.frame.maxY + 40, width: self.view.bounds.width / 2 - 50, height: 15)) // Adjust height as needed
            firstStagePronunciation.numberOfLines = 0
            firstStagePronunciation.text = "/ˈärdəst səˈlekSHən/"
            firstStagePronunciation.font = UIFont(name: "Arial-BoldMT", size: 13)
            firstStagePronunciation.textColor = .black
            self.view.addSubview(firstStagePronunciation)

            // First Stage Grammar
            firstStageGrammar = UILabel(frame: CGRect(x: firstStageTitle.frame.maxX + 3, y: firstStagePronunciation.frame.maxY + 1, width: self.view.bounds.width / 2 - 50, height: 15)) // Adjust height as needed
        firstStageGrammar.numberOfLines = 0
            firstStageGrammar.text = "» noun «"
        firstStageGrammar.font = UIFont.systemFont(ofSize: 10, weight: .bold)
            firstStageGrammar.textColor = .black
            self.view.addSubview(firstStageGrammar)

            // First Stage Definition
            firstStageDefinition = UILabel(frame: CGRect(x: firstStageTitle.frame.maxX + 3, y: firstStageGrammar.frame.maxY, width: self.view.bounds.width / 2 - 50, height: 30)) // Adjust height as needed
            firstStageDefinition.numberOfLines = 0
            firstStageDefinition.text = "~def: an option, or choice to pick someone of status in creative endeavors"
            firstStageDefinition.font = UIFont.systemFont(ofSize: 7)
            firstStageDefinition.textColor = .black
            self.view.addSubview(firstStageDefinition)
        
           
            setupArtistsCollectionView() // Setup the collection view
        }
    
    
    //-----LYRIX SPECIFIC CODE------

    
    // MARK: UICollectionViewDataSource Methods
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return dummyArray.count
        }
        
        //what goes in each cell, sizing of the image inside the cell. Needs to return
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistCell", for: indexPath)
                
                let imageName = dummyArray[indexPath.item]
                let imageView = UIImageView(image: UIImage(named: imageName))
                imageView.contentMode = .scaleAspectFit // Adjust the content mode
                imageView.clipsToBounds = true
                imageView.frame = cell.contentView.bounds // Use contentView for the cell's content
                cell.contentView.addSubview(imageView) // Add imageView to cell's contentView

                return cell
        }
        
        // MARK: UICollectionViewDelegateFlowLayout Methods
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // Assuming you want 3 items per row
            let width = collectionView.frame.width / 2 // Divide the collection view's width by 3
            return CGSize(width: width, height: width) // Make each cell square
        }
        
        // MARK: UICollectionViewDelegate Method
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let detailVC = DetailViewController()
            detailVC.selectedArtist = dummyArray[indexPath.item] // Pass the selected artist to the detail view controller
            //As opposed to doing self.present, we push onto the navigationviewcontroller
            
            navigationController?.pushViewController(detailVC, animated: true)
//            self.present(detailVC, animated: true, completion: nil)
        }

//    func setupArtistsCollectionView() {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical // Use a vertical scroll direction
//        layout.minimumLineSpacing = 0 // Set spacing between rows to 0
//        layout.minimumInteritemSpacing = 0 // Set spacing between items in a row to 0
//
//        artistsCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height), collectionViewLayout: layout)
//        artistsCollectionView.delegate = self
//        artistsCollectionView.dataSource = self
//        artistsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ArtistCell")
//        artistsCollectionView.backgroundColor = .white // Set background color to white
//        self.view.addSubview(artistsCollectionView)
//    }
    func setupArtistsCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // Use a vertical scroll direction
        layout.minimumLineSpacing = 0 // Set spacing between rows to 0
        layout.minimumInteritemSpacing = 0 // Set spacing between items in a row to 0

        // Adjust the y position of the collection view to be below the firstStageTitle
        let collectionViewYPosition = firstStageTitle.frame.maxY + 20 // Adjust the spacing as needed

        // Adjust the height of the collection view to take up the remaining space
        let collectionViewHeight = self.view.bounds.height - collectionViewYPosition

        artistsCollectionView = UICollectionView(frame: CGRect(x: 0, y: collectionViewYPosition, width: self.view.bounds.width, height: collectionViewHeight), collectionViewLayout: layout)
        artistsCollectionView.delegate = self
        artistsCollectionView.dataSource = self
        artistsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ArtistCell")
        artistsCollectionView.backgroundColor = .white // Set background color to white
        self.view.addSubview(artistsCollectionView)
    }


    
    
    //-------TUTORIAL CODE--------
    
    //function to decide initial setup
    
    func initialSetup(){
        
        addIntroPicker()
        addStartButton()
        
    }
    
    //need objc as timer needs access to c at run time
    @objc func addIntroPicker(){
        
        introPicker.delegate = self
        introPicker.frame = CGRect(x:0, y:0, width: self.view.bounds.width / 2, height:self.view.bounds.height)
        
        // Hide the picker view
            introPicker.isHidden = true
        //add to scene
        self.view.addSubview(introPicker)
        introPicker.backgroundColor = UIColor.clear
        
        
    }
    
    func addStartButton(){
        
        startButton = UIButton(type: .custom)
        //we added 20 to add padding
        startButton.frame = CGRect(x:(self.view.bounds.width / 2) + 20, y:self.view.bounds.height / 2, width: (self.view.bounds.width / 2) - 40, height: 30)
        //what happens when you press the button
        startButton.addTarget(self, action: #selector(self.pressedStart), for: .touchUpInside)
        startButton.setTitle("Caption", for: .normal)
        //adjusts button to change based on size of screen
        startButton.titleLabel?.adjustsFontSizeToFitWidth = true
        startButton.titleLabel?.font = UIFont(name: "Arial", size:16)
        startButton.setTitleColor(UIColor.black, for: .normal)
        startButton.backgroundColor = UIColor(named: "blue")
        self.view.insertSubview(startButton, aboveSubview:introPicker)
    }
    
    //MARK: Pressed Start
    
    @objc func pressedStart(){
        
        //setting up the next scren
        
    }
    
    //MARK: - Handle Picker View
    
    
    //--------------------------
    
    //return counts
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //returns number of columns in our picker view. scrollable.
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //how many rows do they have
        return dummyArray.count
    }
    
    //height for component
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        if(pickerView == introPicker){
            
            return 50
        } else {
            
            return 50
        }
       
    }
    
    //width for component
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        
            
            return self.view.bounds.width / 2
            
       
        
    }
    
    //returning the function
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        //viewforrow tells us which row we are showing right now.
//        let myLabelView = UILabel()
//        myLabelView.text = dummyArray[row]
//        //this runs for every row we got
//
//        myLabelView.adjustsFontSizeToFitWidth = true
//        myLabelView.font = UIFont (name:"Arial", size:20)
//        myLabelView.textAlignment = .center
//
//        return myLabelView
        
        
        let imageName:String = dummyArray[row]
        let myImageView = UIImageView (image:UIImage(named:imageName))
        myImageView.frame = CGRect(x:0, y:0, width:50, height:50)
        
        return myImageView
        
    }
    
    //function telling us what row we have selected.
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    

}
