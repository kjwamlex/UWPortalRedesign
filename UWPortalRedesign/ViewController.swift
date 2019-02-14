//
//  ViewController.swift
//  UWPortalRedesign
//
//  Created by Joonwoo KIM on 2018-07-29.
//  Copyright © 2018 Joonwoo KIM. All rights reserved.
//

import UIKit
import Intents

var dashboardHeaderArray:[String] = ["Calendar", "watCard", "Weather", "Exams", "Classes", "News"]
class dashboardTableViewCell: UITableViewCell {
    
    @IBOutlet var mainCell: UIView!
    @IBOutlet var headerTopLabel: UILabel!
    @IBOutlet var bottomHeaderLabel: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!
    
    
    @IBOutlet var calendarView: UIView!
    @IBOutlet var todayLabelCalendar: UILabel!
    @IBOutlet var todayAllDayDeterminationLabelCalendar: UILabel!
    @IBOutlet var todayNameLabelCalendar: UILabel!
    @IBOutlet var tomorrowLabelCalendar: UILabel!
    @IBOutlet var tomorrowAllDayDeterminationLabelCalendar: UILabel!
    @IBOutlet var tomorrowNameLabelCalendar: UILabel!
    @IBOutlet var upNextLabelCalendar: UILabel!
    @IBOutlet var upNextFirstNameLabelCalendar: UILabel!
    @IBOutlet var upNextFirstAllDayDeterminationLabelCalendar: UILabel!
    @IBOutlet var upNextSecondNameLabelCalendar: UILabel!
    @IBOutlet var upNextSecondAllDayDeterminationLabelCalendar: UILabel!

    
    @IBOutlet var watIAMProfile: UIView!
    @IBOutlet var watIAMProfilePicture: UIImageView!
    @IBOutlet var watIAMUserName: UILabel!
    @IBOutlet var watIAMFaculty: UILabel!
    @IBOutlet var watIAMStudentID: UILabel!
    @IBOutlet var watIAMID: UILabel!
    @IBOutlet var watIAMBarCode: UIImageView!

    
    @IBOutlet var weatherView: UIView!
    
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if superview != nil {
            backgroundImageView.layer.cornerRadius = 30
            backgroundImageView.clipsToBounds = true
            
            watIAMProfile.clipsToBounds = true
            watIAMProfile.layer.cornerRadius = 30
            
            //watIAMProfilePicture.layer.cornerRadius = 70
            //watIAMProfilePicture.clipsToBounds = true
            
            // corner radius
            watIAMProfilePicture.layer.cornerRadius = 70
            
            // border
            watIAMProfilePicture.layer.borderWidth = 0.0
            watIAMProfilePicture.layer.borderColor = UIColor.black.cgColor
            watIAMProfilePicture.layer.shadowOffset = CGSize(width: 0, height: 2)
            // shadow
            watIAMProfilePicture.layer.shadowColor = UIColor.black.cgColor
            watIAMProfilePicture.layer.shadowOpacity = 0.3
            watIAMProfilePicture.layer.shadowRadius = 13
            
            
            

            // corner radius
            mainCell.layer.cornerRadius = 30
            
            // border
            mainCell.layer.borderWidth = 0.0
            mainCell.layer.borderColor = UIColor.black.cgColor
            mainCell.layer.shadowOffset = CGSize(width: 0, height: 2)
            // shadow
            mainCell.layer.shadowColor = UIColor.black.cgColor
            mainCell.layer.shadowOpacity = 0.3
            mainCell.layer.shadowRadius = 13
            
        }
    }
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    //navigation header
    @IBOutlet var navigationLabel: UILabel!
    
    

    @IBOutlet var tableViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var maintableView: UITableView!
    @IBOutlet var navigationTopBarHeight: NSLayoutConstraint!
    @IBOutlet var navigationTopBarHeightTwo: NSLayoutConstraint!
    @IBOutlet var universityOfWaterlooLogo: UIView!
    @IBOutlet var universityOfWaterlooLogoConstraint: NSLayoutConstraint!
    @IBOutlet var animatingAndMoreInfoView: UIView!
    
    
    //Tab Bar
    @IBOutlet var tabBar: UIVisualEffectView!
    @IBOutlet var dashBoardButton: UIButton!
    @IBOutlet var notificationButton: UIButton!
    @IBOutlet var settingsButton: UIButton!

    
    //Settings View
    @IBOutlet var settingsView: UIView!
    
    
    //animatingMoreInfoView
    @IBOutlet var centerTestingUIButton: UIButton!
    @IBOutlet var centerTestingProfileImage: UIImageView!
    
    //Top Notched View
    @IBOutlet var wholeNavigationBar: UIView!
    @IBOutlet var notificationView: UIView!
    @IBOutlet var initialLaunchView: UIView!
    @IBOutlet var notificationTableViewConstraint: NSLayoutConstraint!
    @IBOutlet var swipeUpLabel: UILabel!
    @IBOutlet var notificationHeight: NSLayoutConstraint!
    var timer = Timer()
    var up = false
    var down = true
    
    func donateInteraction(intentUsed: INIntent, suggestedPhrase: String!) {
        let intent = intentUsed
        
        intent.suggestedInvocationPhrase = suggestedPhrase
        
        let interaction = INInteraction(intent: intent, response: nil)
        
        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    //_log("Interaction donation failed: %@", log: OSLog.default, type: .error, error)
                    print(error)
                } else {
                    //_log("Successfully donated interaction")
                    print("success")

                }
            }
        }
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.timer = Timer.scheduledTimer(timeInterval: 1.6, target: self, selector: #selector(ViewController.swipeUpAnimation), userInfo: nil, repeats: true)

        notificationHeight.constant = UIWindow.init().bounds.height
        dashBoardButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        notificationButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        settingsButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit


        tableViewBottomConstraint.constant = -5
        navigationTopBarHeight.constant = UIWindow.init().bounds.height + 117
        navigationTopBarHeightTwo.constant = UIWindow.init().bounds.height + 117
 
            self.universityOfWaterlooLogo.alpha = 1

        self.maintableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        
        notificationTableViewConstraint.constant = UIWindow.init().bounds.height - 117 - 130
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {

            self.tableViewBottomConstraint.constant = 5

            self.navigationTopBarHeight.constant = 117
            self.navigationTopBarHeightTwo.constant =  117
            UIView.animate(withDuration: 0.65, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.universityOfWaterlooLogo.alpha = 0
                //set the new constraints
                self.view.layoutIfNeeded()
                self.wholeNavigationBar.transform = CGAffineTransform.init(translationX: 0, y: 0)

                self.tabBar.transform = CGAffineTransform.init(translationX: 0, y: 0)
                self.tabBar.alpha = 1
            }, completion: nil)

                
        }
        
   
        
        
        
    }
    
    

    
    @objc func swipeUpAnimation() {
        
        if up == false && down == true{
            
            UIView.animate(withDuration: 1.2, delay: 0.4, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                self.swipeUpLabel.alpha = 1
                self.swipeUpLabel.transform = CGAffineTransform.init(translationX: 0, y: -50)
            }, completion: nil)
            up = true
            down = false
            
        } else if down == false && up == true{
            
            UIView.animate(withDuration: 1.2, delay: 0.4, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                self.swipeUpLabel.alpha = 0
            }, completion: nil)
            
            UIView.animate(withDuration: 0.1, delay: 1.6, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                self.swipeUpLabel.transform = CGAffineTransform.init(translationX: 0, y: 0)
            }, completion: nil)
            up = false
            down = true
        }
        
        
    }
    
    
    
    @IBAction func goSettings() {
        dissolveLabel(label: navigationLabel, toString: "Settings")
        settingsView.alpha = 0
        settingsView.transform = CGAffineTransform.init(scaleX: 0.75, y: 0.75)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.settingsView.alpha = 1
            self.settingsView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            self.maintableView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.maintableView.alpha = 0

        }, completion: nil)
        
        donateInteraction(intentUsed: NextClassIntent(), suggestedPhrase: "What is the next class?")
        donateInteraction(intentUsed: RegistrarOfficeIntent(), suggestedPhrase: "Where is the Registrar's Office?")
        donateInteraction(intentUsed: RestaurantIntent(), suggestedPhrase: "Show me some restaurants on University of Waterloo")


    }
    
    @IBAction func goDashBoard() {
        dissolveLabel(label: navigationLabel, toString: "Dashboard")
        maintableView.alpha = 0
        maintableView.transform = CGAffineTransform.init(scaleX: 0.75, y: 0.75)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.settingsView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.settingsView.alpha = 0
            self.maintableView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            self.maintableView.alpha = 1

        }, completion: nil)
    }
    
    func centerOfScreenForHeight(objectSizeInHalf: CGFloat!)-> CGFloat! {
        
        
        return (UIWindow.init().bounds.height/2) - objectSizeInHalf
    }
    
    func centerOfScreenForWidth(objectSizeInHalf: CGFloat!)-> CGFloat! {
        
        
        return (UIWindow.init().bounds.width/2) - objectSizeInHalf
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBar.alpha =  0
        self.tabBar.transform = CGAffineTransform.init(translationX: 0, y: 200)
        animatingAndMoreInfoView.alpha = 0
        
        animatingAndMoreInfoView.layer.cornerRadius = 30
        animatingAndMoreInfoView.clipsToBounds = true
        
        //self.maintableView.layer.cornerRadius = 30
        //self.maintableView.clipsToBounds = true
        
    

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maintableView.delegate = self
        
        self.wholeNavigationBar.transform = CGAffineTransform.init(translationX: 0, y: 117)

        // corner radius
        
        self.maintableView.separatorStyle = .none
        universityOfWaterlooLogoConstraint.constant =  (UIWindow.init().bounds.height/2) - 27
        universityOfWaterlooLogo.alpha = 0

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //the height of the table view cell?
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //it will be 189 pixels
        return 520
    }
    @IBOutlet var refreshIndicator: UIActivityIndicatorView!
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        if (maintableView.contentOffset.y <= -100) {
            refreshAndShowNotification()
            self.refreshIndicator.alpha = 1
            
            swipeUpLabel.text = "Updating"
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                self.refreshIndicator.alpha = 0
                self.dissolveLabel(label: self.swipeUpLabel, toString: "Swipe up to dismiss")
                //self.maintableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
                
            }
            print("refresh")
        }
    }
    
    func refresh() {
        
        navigationTopBarHeight.constant = UIWindow.init().bounds.height + 117
        navigationTopBarHeightTwo.constant = UIWindow.init().bounds.height + 117
        self.tableViewBottomConstraint.constant = -117

        UIView.animate(withDuration: 0.65, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.universityOfWaterlooLogo.alpha = 1
            self.tabBar.transform = CGAffineTransform.init(translationX: 0, y: 200)
            //set the new constraints
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.navigationTopBarHeight.constant = 117
            self.navigationTopBarHeightTwo.constant =  117
            self.tableViewBottomConstraint.constant = 5

            UIView.animate(withDuration: 0.65, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.universityOfWaterlooLogo.alpha = 0
                self.tabBar.transform = CGAffineTransform.init(translationX: 0, y: 0)
                self.tabBar.alpha = 1

                //set the new constraints
                self.view.layoutIfNeeded()
                
            }, completion: nil)
            
            //self.maintableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)

        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.1) {
            self.notificationView.alpha = 1
            self.initialLaunchView.alpha = 0
            
            //self.maintableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
            
        }
        

        
    }
    
    
    func refreshAndShowNotification() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.05) {

           
            self.navigationTopBarHeight.constant = UIWindow.init().bounds.height + 117
            //self.navigationTopBarHeightTwo.constant = UIWindow.init().bounds.height + 117
            self.tableViewBottomConstraint.constant = 0
            
            //self.maintableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
            UIView.animate(withDuration: 0.65, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                 self.maintableView.frame = CGRect(x: self.maintableView.frame.minX, y: UIWindow.init().bounds.height + 117, width: self.maintableView.frame.width, height: self.maintableView.frame.height)
                self.wholeNavigationBar.transform = CGAffineTransform.init(translationX: 0, y: 117)

                
                self.universityOfWaterlooLogo.alpha = 1
                self.tabBar.transform = CGAffineTransform.init(translationX: 0, y: 200)
                //set the new constraints
                self.view.layoutIfNeeded()
                
            }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.universityOfWaterlooLogo.alpha = 0
                
            }, completion: nil)
        }


 
        
        

        

    }
    
    
    
    @IBAction func dismissNotification() {
        
        
            self.navigationTopBarHeight.constant = 117
            self.navigationTopBarHeightTwo.constant =  117
            self.tableViewBottomConstraint.constant = 5
            
            UIView.animate(withDuration: 0.65, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.universityOfWaterlooLogo.alpha = 0
                self.tabBar.transform = CGAffineTransform.init(translationX: 0, y: 0)
                self.tabBar.alpha = 1
                self.initialLaunchView.alpha = 1
                self.universityOfWaterlooLogo.alpha = 0
                //set the new constraints
                self.view.layoutIfNeeded()
                
            }, completion: nil)
            
            //self.maintableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
            
        

    }
    func dissolveLabel(label: UILabel!, toString: String!) {
        
        UIView.transition(with: label,duration: 0.75 ,options: .transitionCrossDissolve,animations: { [weak self] in
            label.text = toString
            }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashboardHeaderArray.count
    }
    
    var previousRect: CGRect!
    
    @IBAction func dismissMoreInfo() {
        UIView.animate(withDuration: 0.65, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.animatingAndMoreInfoView.frame = self.previousRect
            
            
        }, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.65) {
            
            self.animatingAndMoreInfoView.alpha = 0

            //self.view.sendSubviewToBack(self.animatingAndMoreInfoView)

            
        }

        
    }
    
    var correctRect: CGRect!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        maintableView.deselectRow(at: indexPath, animated: true)
        var rect = self.maintableView.rectForRow(at: indexPath)
        var rectInScreen = self.maintableView.convert(rect, to: self.maintableView.superview)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            
        self.centerTestingUIButton.frame = CGRect(x: ((rectInScreen.width - 40)/2) - (self.centerTestingUIButton.frame.width/2), y: self.centerOfScreenForHeight(objectSizeInHalf: self.centerTestingUIButton.frame.height/2), width: self.centerTestingUIButton.frame.width, height: self.centerTestingUIButton.frame.height)
            
        //self.centerTestingProfileImage.frame = CGRect(x: ((rectInScreen.width - 40)/2) - (self.centerTestingProfileImage.frame.width/2), y: self.centerOfScreenForHeight(objectSizeInHalf: self.centerTestingProfileImage.frame.height/2), width: self.centerTestingProfileImage.frame.width, height: self.centerTestingProfileImage.frame.height)
            
            //print(self.centerTestingProfileImage.frame)
            
            self.correctRect = CGRect(x: (UIWindow.init().bounds.width/2) - ((rectInScreen.width - 40)/2) , y: rectInScreen.minY + 25, width: rectInScreen.width - 40, height: 470)
        
            self.animatingAndMoreInfoView.frame = self.correctRect
            
            //self.centerTestingProfileImage.setNeedsUpdateConstraints()
            print(self.animatingAndMoreInfoView.frame)

            
        }
        //
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
            
            
            //self.view.bringSubviewToFront(self.animatingAndMoreInfoView)
            
            self.animatingAndMoreInfoView.alpha = 1
            
            self.previousRect = self.correctRect
            
            print(rectInScreen)
            print(self.previousRect)
            self.centerTestingProfileImage.updateConstraints()
            UIView.animate(withDuration: 0.65, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {

                //self.centerTestingProfileImage.layoutIfNeeded()
                self.animatingAndMoreInfoView.frame = CGRect(x: 0, y: 117, width: UIWindow.init().bounds.width, height: UIWindow.init().bounds.height - 117)
                          //self.centerTestingProfileImage.frame = CGRect(x: self.centerOfScreenForWidth(objectSizeInHalf: (self.centerTestingProfileImage.frame.width/2)), y: self.centerOfScreenForHeight(objectSizeInHalf: self.centerTestingProfileImage.frame.height/2), width: self.centerTestingProfileImage.frame.width, height: self.centerTestingProfileImage.frame.height)
                
                self.centerTestingUIButton.frame = CGRect(x: self.centerOfScreenForWidth(objectSizeInHalf: self.centerTestingUIButton.frame.width/2), y: self.centerOfScreenForHeight(objectSizeInHalf: self.centerTestingUIButton.frame.height/2), width: self.centerTestingUIButton.frame.width, height: self.centerTestingUIButton.frame.height)
                
                
  
            }, completion: nil)
            
            
        }
   
        //view.bringSubviewToFront(tabBar)
        
        //animatingAndMoreInfoView
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dashboardCell = maintableView.dequeueReusableCell(withIdentifier: "dashboardTableViewCell", for: indexPath) as!
        dashboardTableViewCell
        dashboardCell.headerTopLabel.text = dashboardHeaderArray[indexPath.row]
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        dashboardCell.selectedBackgroundView = backgroundView
        
        if dashboardCell.headerTopLabel.text == "Calendar" && dashboardHeaderArray[indexPath.row] == "Calendar" {
            dashboardCell.calendarView.alpha = 1
            dashboardCell.watIAMProfile.alpha = 0
            dashboardCell.weatherView.alpha = 0

        } else if dashboardCell.headerTopLabel.text == "watCard" && dashboardHeaderArray[indexPath.row] == "watCard" {
            
            dashboardCell.calendarView.alpha = 0
            dashboardCell.watIAMProfile.alpha = 1
            dashboardCell.weatherView.alpha = 0

//weatherView
        } else if dashboardCell.headerTopLabel.text == "Weather" && dashboardHeaderArray[indexPath.row] == "Weather" {
            dashboardCell.calendarView.alpha = 0
            dashboardCell.watIAMProfile.alpha = 0
            dashboardCell.weatherView.alpha = 1

        } else {
            dashboardCell.calendarView.alpha = 0
            dashboardCell.watIAMProfile.alpha = 0
            dashboardCell.weatherView.alpha = 0

        }
        
        if dashboardCell.headerTopLabel.text == "Weather" && dashboardHeaderArray[indexPath.row] == "Weather" && dashboardCell.headerTopLabel.text != "News" {
            dashboardCell.backgroundImageView.image = UIImage(named:"defaultBackground.png")
            dashboardCell.headerTopLabel.textColor = .white
            
        } else {
            
            dashboardCell.backgroundImageView.image = UIImage(named:"Screen Shot 2018-07-31 at 10.59.00 PM.png")
            dashboardCell.headerTopLabel.textColor = .black

        }
        return dashboardCell
    }
    
    
    
    
    var initialYLocation: CGFloat!
    
    //when the touch began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //touch input variable
        let touch = touches.first as UITouch?
        
        
        //touch location within mini player view
        var secondaryLocation = touch?.location(in: view)
        
        
        //y location of the touch input
        var ylocation = secondaryLocation!.y
        
        if touch!.view == notificationView {
            initialYLocation = ylocation
            
            UIView.animate(withDuration: 0.65, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.wholeNavigationBar.transform = CGAffineTransform.init(translationX: 0, y: 0)
                }, completion: nil)

                  // self.notificationView.transform = CGAffineTransform.init(translationX: 0, y:  -364)
            // moveOnValidNumber =  ((initialXLocation! - location!.y) / 280) + 1
            
        }

    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
        
        
        //touch location within mini player view
        var secondaryLocation = touch?.location(in: view)
        
        
        //y location of the touch input
        var ylocation = secondaryLocation!.y
        
        if touch!.view == notificationView {
            
            self.navigationTopBarHeight.constant = ylocation + 117
            //self.navigationTopBarHeightTwo.constant =  ylocation + 117
            self.tableViewBottomConstraint.constant = 5
            self.tabBar.transform = CGAffineTransform.init(translationX: 0, y: 0)
            //self.notificationView.alpha = ylocation / (UIWindow.init().bounds.height)
            self.initialLaunchView.alpha = 1
            self.universityOfWaterlooLogo.alpha = 0
            
            

            
            
            //print(-(UIWindow.init().bounds.height - (ylocation - self.notificationView.frame.height)))
            
            // moveOnValidNumber =  ((initialXLocation! - location!.y) / 280) + 1
            
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationTopBarHeight.constant = 117
        self.navigationTopBarHeightTwo.constant =  117
        self.tableViewBottomConstraint.constant = 5
        
        UIView.animate(withDuration: 0.65, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.universityOfWaterlooLogo.alpha = 0
            self.tabBar.transform = CGAffineTransform.init(translationX: 0, y: 0)
            self.tabBar.alpha = 1
            self.initialLaunchView.alpha = 1
            self.universityOfWaterlooLogo.alpha = 0
            //set the new constraints
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    


}

