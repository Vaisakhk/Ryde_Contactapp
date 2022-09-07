# Ryde_Contactapp

### Architecture
     - VIPER

### Local Database
     - Coredata

### Requirements
     - iOS 15.0 and above
     - Xcode Version 13.4.1
     
### Assemptions
     - While editing and adding new contact no need to capture and save user profile image, email and phone number
     - Once new contact added it will list at the bottom of the table view
     
### Approach
     - Home view is designed with Table view to show the contact list, and provided left and right bar buttons for group (no action) and add new contact navigation 
     - On clicking the tableview view item, the detail screen displayed with more information.
     - On clicking plus button from home screen will show Add contact screen
     - On clicking edit button from detail screen will show edit contact screen
     
### Features
    - Home screen
        - By default populated  the zero index contact details, and data will be saved in local db
        - once scroll to bottom of the screen next page will load
        - User can click on list item and navigate to detail screen
        - User can click on plus button navigate to add contact screen

    - Detail screen
        - Contact details such as phone number and email populated
        - User can click on edit button navigate to edit contact screen
        
    - Edit contact screen
        - Contact details such as phone number and email pre populated and allowed user to change
    
    - Add contact screen
        - Contact details such as first name and last name captured and saved in Api and local db
        - And populated same in Home lsiting screen
        
    - Test cases
        - Test cases for Home, detail, Edit and add contact interactor added 
        - Created UI test cases for Home, detail, Edit and add contact views
        - 67 % code coverage able to achieve
       
### Dependency
    - Used Swift package manager for dependency
    - PKHud 
          - TO show progress hud in UI
    - SDWebimage
          -TO load profile image asynchronously 

### Unit Testing
    - Created Unit test for business logic (Home, detail, Edit and add contact interactor )
    - Created UI test cases for Home, detail, Edit and add contact views
