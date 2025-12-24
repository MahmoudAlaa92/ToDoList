// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum AddTask {
    /// Add SubTask
    internal static let addSubtask = L10n.tr("Localizable", "addTask.addSubtask", fallback: "Add SubTask")
    /// Create Task
    internal static let createTask = L10n.tr("Localizable", "addTask.createTask", fallback: "Create Task")
    /// Enter description
    internal static let enterDescription = L10n.tr("Localizable", "addTask.enterDescription", fallback: "Enter description")
    /// Enter task name
    internal static let enterTaskName = L10n.tr("Localizable", "addTask.enterTaskName", fallback: "Enter task name")
    /// Enter task subtitle
    internal static let enterTaskSubtitle = L10n.tr("Localizable", "addTask.enterTaskSubtitle", fallback: "Enter task subtitle")
    /// Enter task title
    internal static let enterTaskTitle = L10n.tr("Localizable", "addTask.enterTaskTitle", fallback: "Enter task title")
    /// Task Description
    internal static let taskDescription = L10n.tr("Localizable", "addTask.taskDescription", fallback: "Task Description")
    /// Task Name
    internal static let taskName = L10n.tr("Localizable", "addTask.taskName", fallback: "Task Name")
    /// Task Subtitle
    internal static let taskSubtitle = L10n.tr("Localizable", "addTask.taskSubtitle", fallback: "Task Subtitle")
    /// Task Title
    internal static let taskTitle = L10n.tr("Localizable", "addTask.taskTitle", fallback: "Task Title")
    /// Add Task
    internal static let title = L10n.tr("Localizable", "addTask.title", fallback: "Add Task")
  }
  internal enum AssignedPersons {
    /// teenagerGirl
    internal static let teenagerGirl = L10n.tr("Localizable", "assignedPersons.teenagerGirl", fallback: "teenagerGirl")
    /// woman
    internal static let woman = L10n.tr("Localizable", "assignedPersons.woman", fallback: "woman")
    /// youngSmilingMan
    internal static let youngSmilingMan = L10n.tr("Localizable", "assignedPersons.youngSmilingMan", fallback: "youngSmilingMan")
  }
  internal enum Auth {
    /// Apply
    internal static let apply = L10n.tr("Localizable", "auth.apply", fallback: "Apply")
    /// Confirm
    internal static let confirm = L10n.tr("Localizable", "auth.confirm", fallback: "Confirm")
    /// Continue
    internal static let `continue` = L10n.tr("Localizable", "auth.continue", fallback: "Continue")
    /// Localizable.strings
    ///   ToDoList
    /// 
    ///   Created by Mahmoud Alaa on 22/12/2025.
    internal static let login = L10n.tr("Localizable", "auth.login", fallback: "Login")
    /// Reset
    internal static let reset = L10n.tr("Localizable", "auth.reset", fallback: "Reset")
    /// Sign Up
    internal static let signup = L10n.tr("Localizable", "auth.signup", fallback: "Sign Up")
    /// Welcome!
    internal static let welcome = L10n.tr("Localizable", "auth.welcome", fallback: "Welcome!")
    /// Welcome Back!
    internal static let welcomeBack = L10n.tr("Localizable", "auth.welcomeBack", fallback: "Welcome Back!")
    internal enum ForgotPassword {
      /// Reset Password
      internal static let resetButton = L10n.tr("Localizable", "auth.forgotPassword.resetButton", fallback: "Reset Password")
      /// Change Password
      internal static let subtitle = L10n.tr("Localizable", "auth.forgotPassword.subtitle", fallback: "Change Password")
      /// Forget the password
      internal static let title = L10n.tr("Localizable", "auth.forgotPassword.title", fallback: "Forget the password")
      internal enum ConfirmPassword {
        /// *******
        internal static let placeholder = L10n.tr("Localizable", "auth.forgotPassword.confirmPassword.placeholder", fallback: "*******")
        /// Confirm Password
        internal static let title = L10n.tr("Localizable", "auth.forgotPassword.confirmPassword.title", fallback: "Confirm Password")
      }
      internal enum CurrentPassword {
        /// *******
        internal static let placeholder = L10n.tr("Localizable", "auth.forgotPassword.currentPassword.placeholder", fallback: "*******")
        /// Current Password
        internal static let title = L10n.tr("Localizable", "auth.forgotPassword.currentPassword.title", fallback: "Current Password")
      }
      internal enum Error {
        /// Please fill in all fields
        internal static let emptyFields = L10n.tr("Localizable", "auth.forgotPassword.error.emptyFields", fallback: "Please fill in all fields")
        /// There exists invalid input
        internal static let invalidInput = L10n.tr("Localizable", "auth.forgotPassword.error.invalidInput", fallback: "There exists invalid input")
      }
      internal enum NewPassword {
        /// *******
        internal static let placeholder = L10n.tr("Localizable", "auth.forgotPassword.newPassword.placeholder", fallback: "*******")
        /// New Password
        internal static let title = L10n.tr("Localizable", "auth.forgotPassword.newPassword.title", fallback: "New Password")
      }
      internal enum Username {
        /// Enter your name here
        internal static let placeholder = L10n.tr("Localizable", "auth.forgotPassword.username.placeholder", fallback: "Enter your name here")
        /// User Name
        internal static let title = L10n.tr("Localizable", "auth.forgotPassword.username.title", fallback: "User Name")
      }
    }
    internal enum Login {
      /// Continue with Apple
      internal static let apple = L10n.tr("Localizable", "auth.login.apple", fallback: "Continue with Apple")
      /// Don't have an account?
      internal static let dontHaveAccount = L10n.tr("Localizable", "auth.login.dontHaveAccount", fallback: "Don't have an account?")
      /// Continue with Facebook
      internal static let facebook = L10n.tr("Localizable", "auth.login.facebook", fallback: "Continue with Facebook")
      /// Login Failed
      internal static let failed = L10n.tr("Localizable", "auth.login.failed", fallback: "Login Failed")
      /// Glad you're here!!
      internal static let gladYouHere = L10n.tr("Localizable", "auth.login.gladYouHere", fallback: "Glad you're here!!")
      /// Continue with Google
      internal static let google = L10n.tr("Localizable", "auth.login.google", fallback: "Continue with Google")
      /// Join with us
      internal static let joinWithUs = L10n.tr("Localizable", "auth.login.joinWithUs", fallback: "Join with us")
      /// please login or sign up to continue our app
      internal static let subtitle = L10n.tr("Localizable", "auth.login.subtitle", fallback: "please login or sign up to continue our app")
      /// Log In
      internal static let title = L10n.tr("Localizable", "auth.login.title", fallback: "Log In")
      /// Welcome to Daily Grind, your go-to app to organize, prioritize, and manage your tasks effectively.
      internal static let welcomeMessage = L10n.tr("Localizable", "auth.login.welcomeMessage", fallback: "Welcome to Daily Grind, your go-to app to organize, prioritize, and manage your tasks effectively.")
      /// Your Account
      internal static let yourAccount = L10n.tr("Localizable", "auth.login.yourAccount", fallback: "Your Account")
      /// Your Gmail
      internal static let yourGmail = L10n.tr("Localizable", "auth.login.yourGmail", fallback: "Your Gmail")
      /// Your Qr Code
      internal static let yourQrCode = L10n.tr("Localizable", "auth.login.yourQrCode", fallback: "Your Qr Code")
      internal enum Forgot {
        /// Forget the password
        internal static let password = L10n.tr("Localizable", "auth.login.forgot.password", fallback: "Forget the password")
      }
      internal enum Password {
        /// ***********
        internal static let placeholder = L10n.tr("Localizable", "auth.login.password.placeholder", fallback: "***********")
        /// Password
        internal static let title = L10n.tr("Localizable", "auth.login.password.title", fallback: "Password")
      }
      internal enum Username {
        /// Enter your user name
        internal static let placeholder = L10n.tr("Localizable", "auth.login.username.placeholder", fallback: "Enter your user name")
        /// User Name
        internal static let title = L10n.tr("Localizable", "auth.login.username.title", fallback: "User Name")
      }
    }
    internal enum Signup {
      /// Already have an account?
      internal static let alreadyHaveAccount = L10n.tr("Localizable", "auth.signup.alreadyHaveAccount", fallback: "Already have an account?")
      /// Create An Account
      internal static let createAccount = L10n.tr("Localizable", "auth.signup.createAccount", fallback: "Create An Account")
      /// Create an new account
      internal static let subtitle = L10n.tr("Localizable", "auth.signup.subtitle", fallback: "Create an new account")
      /// Sign Up
      internal static let title = L10n.tr("Localizable", "auth.signup.title", fallback: "Sign Up")
      internal enum ConfirmPassword {
        /// *******
        internal static let placeholder = L10n.tr("Localizable", "auth.signup.confirmPassword.placeholder", fallback: "*******")
        /// Confirm Password
        internal static let title = L10n.tr("Localizable", "auth.signup.confirmPassword.title", fallback: "Confirm Password")
      }
      internal enum Email {
        /// Enter your email here
        internal static let placeholder = L10n.tr("Localizable", "auth.signup.email.placeholder", fallback: "Enter your email here")
        /// Email
        internal static let title = L10n.tr("Localizable", "auth.signup.email.title", fallback: "Email")
      }
      internal enum FirstName {
        /// Enter your First name
        internal static let placeholder = L10n.tr("Localizable", "auth.signup.firstName.placeholder", fallback: "Enter your First name")
        /// First name
        internal static let title = L10n.tr("Localizable", "auth.signup.firstName.title", fallback: "First name")
      }
      internal enum LastName {
        /// Enter your last name
        internal static let placeholder = L10n.tr("Localizable", "auth.signup.lastName.placeholder", fallback: "Enter your last name")
        /// Last name
        internal static let title = L10n.tr("Localizable", "auth.signup.lastName.title", fallback: "Last name")
      }
      internal enum Password {
        /// *******
        internal static let placeholder = L10n.tr("Localizable", "auth.signup.password.placeholder", fallback: "*******")
        /// Password
        internal static let title = L10n.tr("Localizable", "auth.signup.password.title", fallback: "Password")
      }
      internal enum Phone {
        /// +(20) 112 201 201
        internal static let placeholder = L10n.tr("Localizable", "auth.signup.phone.placeholder", fallback: "+(20) 112 201 201")
        /// Phone Number
        internal static let title = L10n.tr("Localizable", "auth.signup.phone.title", fallback: "Phone Number")
      }
      internal enum Username {
        /// Enter your name here
        internal static let placeholder = L10n.tr("Localizable", "auth.signup.username.placeholder", fallback: "Enter your name here")
        /// User Name
        internal static let title = L10n.tr("Localizable", "auth.signup.username.title", fallback: "User Name")
      }
    }
    internal enum Success {
      /// You have successfully registered in
      /// our app and start working in it.
      internal static let message = L10n.tr("Localizable", "auth.success.message", fallback: "You have successfully registered in\nour app and start working in it.")
      /// Start Shopping
      internal static let startShopping = L10n.tr("Localizable", "auth.success.startShopping", fallback: "Start Shopping")
      /// Successful!
      internal static let title = L10n.tr("Localizable", "auth.success.title", fallback: "Successful!")
    }
  }
  internal enum Calendar {
    /// Fri
    internal static let friday = L10n.tr("Localizable", "calendar.friday", fallback: "Fri")
    /// Mon
    internal static let monday = L10n.tr("Localizable", "calendar.monday", fallback: "Mon")
    /// Sat
    internal static let saturday = L10n.tr("Localizable", "calendar.saturday", fallback: "Sat")
    /// Sun
    internal static let sunday = L10n.tr("Localizable", "calendar.sunday", fallback: "Sun")
    /// Thu
    internal static let thursday = L10n.tr("Localizable", "calendar.thursday", fallback: "Thu")
    /// Tue
    internal static let tuesday = L10n.tr("Localizable", "calendar.tuesday", fallback: "Tue")
    /// Wed
    internal static let wednesday = L10n.tr("Localizable", "calendar.wednesday", fallback: "Wed")
  }
  internal enum Comments {
    /// I think this is good
    internal static let iThinkGood = L10n.tr("Localizable", "comments.iThinkGood", fallback: "I think this is good")
    internal enum TimeAgo {
      /// %d min
      internal static func min(_ p1: Int) -> String {
        return L10n.tr("Localizable", "comments.timeAgo.min", p1, fallback: "%d min")
      }
    }
  }
  internal enum Error {
    /// Client ID not found
    internal static let clientIdNotFound = L10n.tr("Localizable", "error.clientIdNotFound", fallback: "Client ID not found")
    /// There is an empty field
    internal static let emptyField = L10n.tr("Localizable", "error.emptyField", fallback: "There is an empty field")
    /// Failed to retrieve Google ID token.
    internal static let googleTokenFailed = L10n.tr("Localizable", "error.googleTokenFailed", fallback: "Failed to retrieve Google ID token.")
    /// Invalid email or password
    internal static let invalidCredentials = L10n.tr("Localizable", "error.invalidCredentials", fallback: "Invalid email or password")
    /// Please enter both email and password
    internal static let missingEmailPassword = L10n.tr("Localizable", "error.missingEmailPassword", fallback: "Please enter both email and password")
    /// No access token
    internal static let noAccessToken = L10n.tr("Localizable", "error.noAccessToken", fallback: "No access token")
    /// Passwords do not match
    internal static let passwordsMismatch = L10n.tr("Localizable", "error.passwordsMismatch", fallback: "Passwords do not match")
    /// Registration failed: Please check your input
    internal static let registrationFailed = L10n.tr("Localizable", "error.registrationFailed", fallback: "Registration failed: Please check your input")
  }
  internal enum Form {
    internal enum Address {
      /// Enter your address
      internal static let placeholder = L10n.tr("Localizable", "form.address.placeholder", fallback: "Enter your address")
    }
    internal enum Comment {
      /// Enter your Comment
      internal static let placeholder = L10n.tr("Localizable", "form.comment.placeholder", fallback: "Enter your Comment")
    }
    internal enum Name {
      /// Enter your name
      internal static let placeholder = L10n.tr("Localizable", "form.name.placeholder", fallback: "Enter your name")
    }
    internal enum Phone {
      /// Enter your phone
      internal static let placeholder = L10n.tr("Localizable", "form.phone.placeholder", fallback: "Enter your phone")
    }
    internal enum Rating {
      /// Rating (1-5)
      internal static let placeholder = L10n.tr("Localizable", "form.rating.placeholder", fallback: "Rating (1-5)")
    }
  }
  internal enum General {
    /// Add
    internal static let add = L10n.tr("Localizable", "general.add", fallback: "Add")
    /// back
    internal static let back = L10n.tr("Localizable", "general.back", fallback: "back")
    /// Cancel
    internal static let cancel = L10n.tr("Localizable", "general.cancel", fallback: "Cancel")
    /// Close
    internal static let close = L10n.tr("Localizable", "general.close", fallback: "Close")
    /// Confirm
    internal static let confirm = L10n.tr("Localizable", "general.confirm", fallback: "Confirm")
    /// Delete
    internal static let delete = L10n.tr("Localizable", "general.delete", fallback: "Delete")
    /// done
    internal static let done = L10n.tr("Localizable", "general.done", fallback: "done")
    /// Edit
    internal static let edit = L10n.tr("Localizable", "general.edit", fallback: "Edit")
    /// Female
    internal static let female = L10n.tr("Localizable", "general.female", fallback: "Female")
    /// Gender
    internal static let gender = L10n.tr("Localizable", "general.gender", fallback: "Gender")
    /// Male
    internal static let male = L10n.tr("Localizable", "general.male", fallback: "Male")
    /// OK
    internal static let ok = L10n.tr("Localizable", "general.ok", fallback: "OK")
    /// Save
    internal static let save = L10n.tr("Localizable", "general.save", fallback: "Save")
    /// Setting
    internal static let setting = L10n.tr("Localizable", "general.setting", fallback: "Setting")
    /// Update
    internal static let update = L10n.tr("Localizable", "general.update", fallback: "Update")
  }
  internal enum Home {
    /// Calendar
    internal static let calendar = L10n.tr("Localizable", "home.calendar", fallback: "Calendar")
    /// Logout
    internal static let logout = L10n.tr("Localizable", "home.logout", fallback: "Logout")
    /// My Projects
    internal static let myProjects = L10n.tr("Localizable", "home.myProjects", fallback: "My Projects")
    /// No tasks for today
    internal static let noTasksToday = L10n.tr("Localizable", "home.noTasksToday", fallback: "No tasks for today")
    /// Home
    internal static let title = L10n.tr("Localizable", "home.title", fallback: "Home")
    /// Today's tasks
    internal static let todaysTasks = L10n.tr("Localizable", "home.todaysTasks", fallback: "Today's tasks")
    internal enum Menu {
      /// Notifications
      internal static let notifications = L10n.tr("Localizable", "home.menu.notifications", fallback: "Notifications")
      /// Profile
      internal static let profile = L10n.tr("Localizable", "home.menu.profile", fallback: "Profile")
    }
  }
  internal enum Nav {
    /// Add Address
    internal static let addAddress = L10n.tr("Localizable", "nav.addAddress", fallback: "Add Address")
    /// Add Information
    internal static let addInformation = L10n.tr("Localizable", "nav.addInformation", fallback: "Add Information")
    /// Add Review
    internal static let addReview = L10n.tr("Localizable", "nav.addReview", fallback: "Add Review")
    /// Info
    internal static let info = L10n.tr("Localizable", "nav.info", fallback: "Info")
    /// Payment
    internal static let payment = L10n.tr("Localizable", "nav.payment", fallback: "Payment")
  }
  internal enum Notifications {
    /// %@ assign to you in a new project
    internal static func assignedMessage(_ p1: Any) -> String {
      return L10n.tr("Localizable", "notifications.assignedMessage", String(describing: p1), fallback: "%@ assign to you in a new project")
    }
    /// Hossam Alaa
    internal static let hossamAlaa = L10n.tr("Localizable", "notifications.hossamAlaa", fallback: "Hossam Alaa")
    /// Mahmoud Alaa
    internal static let mahmoudAlaa = L10n.tr("Localizable", "notifications.mahmoudAlaa", fallback: "Mahmoud Alaa")
    /// Mohamed Samy
    internal static let mohamedSamy = L10n.tr("Localizable", "notifications.mohamedSamy", fallback: "Mohamed Samy")
    /// Sarah Samy
    internal static let sarahSamy = L10n.tr("Localizable", "notifications.sarahSamy", fallback: "Sarah Samy")
    /// Notifications
    internal static let title = L10n.tr("Localizable", "notifications.title", fallback: "Notifications")
    /// Today
    internal static let today = L10n.tr("Localizable", "notifications.today", fallback: "Today")
    /// Yesterday
    internal static let yesterday = L10n.tr("Localizable", "notifications.yesterday", fallback: "Yesterday")
  }
  internal enum Profile {
    /// download
    internal static let download = L10n.tr("Localizable", "profile.download", fallback: "download")
    /// Edit your photo
    internal static let editPhoto = L10n.tr("Localizable", "profile.editPhoto", fallback: "Edit your photo")
    /// Email
    internal static let email = L10n.tr("Localizable", "profile.email", fallback: "Email")
    /// Enter your email
    internal static let enterEmail = L10n.tr("Localizable", "profile.enterEmail", fallback: "Enter your email")
    /// Enter your full name
    internal static let enterFullName = L10n.tr("Localizable", "profile.enterFullName", fallback: "Enter your full name")
    /// FAQs
    internal static let faqs = L10n.tr("Localizable", "profile.faqs", fallback: "FAQs")
    /// Full Name
    internal static let fullName = L10n.tr("Localizable", "profile.fullName", fallback: "Full Name")
    /// Logout
    internal static let logout = L10n.tr("Localizable", "profile.logout", fallback: "Logout")
    /// My Card
    internal static let myCard = L10n.tr("Localizable", "profile.myCard", fallback: "My Card")
    /// My Favourites
    internal static let myFavourites = L10n.tr("Localizable", "profile.myFavourites", fallback: "My Favourites")
    /// My Order
    internal static let myOrder = L10n.tr("Localizable", "profile.myOrder", fallback: "My Order")
    /// Full Phone Number
    internal static let phoneNumber = L10n.tr("Localizable", "profile.phoneNumber", fallback: "Full Phone Number")
    /// Privacy Policy
    internal static let privacyPolicy = L10n.tr("Localizable", "profile.privacyPolicy", fallback: "Privacy Policy")
    /// Save info
    internal static let saveInfo = L10n.tr("Localizable", "profile.saveInfo", fallback: "Save info")
    /// Saving...
    internal static let saving = L10n.tr("Localizable", "profile.saving", fallback: "Saving...")
    /// Setting
    internal static let setting = L10n.tr("Localizable", "profile.setting", fallback: "Setting")
    /// Shipping Address
    internal static let shippingAddress = L10n.tr("Localizable", "profile.shippingAddress", fallback: "Shipping Address")
    /// Profile
    internal static let title = L10n.tr("Localizable", "profile.title", fallback: "Profile")
    /// Your QR Code
    internal static let yourQRCode = L10n.tr("Localizable", "profile.yourQRCode", fallback: "Your QR Code")
  }
  internal enum ProjectDetails {
    /// Add Your Comment
    internal static let addYourComment = L10n.tr("Localizable", "projectDetails.addYourComment", fallback: "Add Your Comment")
    /// Comment
    internal static let comment = L10n.tr("Localizable", "projectDetails.comment", fallback: "Comment")
    /// Description
    internal static let description = L10n.tr("Localizable", "projectDetails.description", fallback: "Description")
    /// Enter your comment
    internal static let enterComment = L10n.tr("Localizable", "projectDetails.enterComment", fallback: "Enter your comment")
    /// Submitting...
    internal static let submitting = L10n.tr("Localizable", "projectDetails.submitting", fallback: "Submitting...")
  }
  internal enum Projects {
    /// Add Project
    internal static let addProject = L10n.tr("Localizable", "projects.addProject", fallback: "Add Project")
    /// bag
    internal static let bag = L10n.tr("Localizable", "projects.bag", fallback: "bag")
    /// Swift
    internal static let swift = L10n.tr("Localizable", "projects.swift", fallback: "Swift")
    /// %d tasks
    internal static func tasksCount(_ p1: Int) -> String {
      return L10n.tr("Localizable", "projects.tasksCount", p1, fallback: "%d tasks")
    }
    /// My projects
    internal static let title = L10n.tr("Localizable", "projects.title", fallback: "My projects")
    /// To Do List
    internal static let toDoList = L10n.tr("Localizable", "projects.toDoList", fallback: "To Do List")
  }
  internal enum Settings {
    /// Age
    internal static let age = L10n.tr("Localizable", "settings.age", fallback: "Age")
    /// Email
    internal static let email = L10n.tr("Localizable", "settings.email", fallback: "Email")
    /// Help Center
    internal static let helpCenter = L10n.tr("Localizable", "settings.helpCenter", fallback: "Help Center")
    /// Language
    internal static let language = L10n.tr("Localizable", "settings.language", fallback: "Language")
    /// Name
    internal static let name = L10n.tr("Localizable", "settings.name", fallback: "Name")
    /// Notification
    internal static let notification = L10n.tr("Localizable", "settings.notification", fallback: "Notification")
    /// Upload Image
    internal static let uploadImage = L10n.tr("Localizable", "settings.uploadImage", fallback: "Upload Image")
  }
  internal enum Tasks {
    /// All
    internal static let all = L10n.tr("Localizable", "tasks.all", fallback: "All")
    /// Backend API
    internal static let backendAPI = L10n.tr("Localizable", "tasks.backendAPI", fallback: "Backend API")
    /// Client Review & Feedback
    internal static let clientReview = L10n.tr("Localizable", "tasks.clientReview", fallback: "Client Review & Feedback")
    /// Client Review
    internal static let clientReviewShort = L10n.tr("Localizable", "tasks.clientReviewShort", fallback: "Client Review")
    /// Code Review Session
    internal static let codeReviewSession = L10n.tr("Localizable", "tasks.codeReviewSession", fallback: "Code Review Session")
    /// Task Created Successfully
    internal static let createdTaskSuccessfully = L10n.tr("Localizable", "tasks.createdTaskSuccessfully", fallback: "Task Created Successfully")
    /// Design System Updates
    internal static let designSystemUpdates = L10n.tr("Localizable", "tasks.designSystemUpdates", fallback: "Design System Updates")
    /// There is an empty field
    internal static let emptyField = L10n.tr("Localizable", "tasks.emptyField", fallback: "There is an empty field")
    /// Friday
    internal static let friday = L10n.tr("Localizable", "tasks.friday", fallback: "Friday")
    /// High Priority
    internal static let highPriority = L10n.tr("Localizable", "tasks.highPriority", fallback: "High Priority")
    /// Low Priority
    internal static let lowPriority = L10n.tr("Localizable", "tasks.lowPriority", fallback: "Low Priority")
    /// Medium Priority
    internal static let mediumPriority = L10n.tr("Localizable", "tasks.mediumPriority", fallback: "Medium Priority")
    /// Monday
    internal static let monday = L10n.tr("Localizable", "tasks.monday", fallback: "Monday")
    /// Not Priority
    internal static let notPriority = L10n.tr("Localizable", "tasks.notPriority", fallback: "Not Priority")
    /// Redesign App
    internal static let redesignApp = L10n.tr("Localizable", "tasks.redesignApp", fallback: "Redesign App")
    /// Saturday
    internal static let saturday = L10n.tr("Localizable", "tasks.saturday", fallback: "Saturday")
    /// See All
    internal static let seeAll = L10n.tr("Localizable", "tasks.seeAll", fallback: "See All")
    /// Today
    internal static let today = L10n.tr("Localizable", "tasks.today", fallback: "Today")
    /// Today's Task
    internal static let todaysTask = L10n.tr("Localizable", "tasks.todaysTask", fallback: "Today's Task")
    /// Tomorrow
    internal static let tomorrow = L10n.tr("Localizable", "tasks.tomorrow", fallback: "Tomorrow")
    /// UI Components
    internal static let uiComponents = L10n.tr("Localizable", "tasks.uiComponents", fallback: "UI Components")
  }
  internal enum Time {
    /// am
    internal static let am = L10n.tr("Localizable", "time.am", fallback: "am")
    /// iphone sound
    internal static let iphoneSound = L10n.tr("Localizable", "time.iphoneSound", fallback: "iphone sound")
    /// pm
    internal static let pm = L10n.tr("Localizable", "time.pm", fallback: "pm")
    /// Select Time
    internal static let selectTime = L10n.tr("Localizable", "time.selectTime", fallback: "Select Time")
    /// Snooze
    internal static let snooze = L10n.tr("Localizable", "time.snooze", fallback: "Snooze")
    /// 10 min to 20 min
    internal static let snoozeRange = L10n.tr("Localizable", "time.snoozeRange", fallback: "10 min to 20 min")
    /// Sound
    internal static let sound = L10n.tr("Localizable", "time.sound", fallback: "Sound")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
