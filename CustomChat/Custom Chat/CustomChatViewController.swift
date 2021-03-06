//
//  ChatViewController.swift
//  CustomChat
//
//  Created by Umair Afzal on 2/13/18.
//  Copyright © 2018 Umair Afzal. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class CustomChatViewController: UIViewController {

    @IBOutlet weak var pickImageButton: UIButton!
    @IBOutlet weak var inputToolBarView: UIView!
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var userId = "Me"

    var messages = [Message]()

    let imagePicker = UIImagePickerController()

    // MARK: - UIVIewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllerUI()
        loadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = false
        IQKeyboardManager.shared.enableAutoToolbar = false
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil) // To detect when keyboard is going to dismiss
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        NotificationCenter.default.removeObserver(self)
    }

    func setupViewControllerUI() {
        self.title = "Chat"

        imagePicker.delegate = self
        imagePicker.allowsEditing  = true
        tableView.keyboardDismissMode = .onDrag

        inputTextView.delegate = self
        inputTextView.layer.cornerRadius = 10
        inputTextView.layer.borderWidth = 1.0
        inputTextView.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 8, right: 5)
        inputTextView.layer.borderColor = UIColor.black.withAlphaComponent(0.3).cgColor
    }

    // MARK: - Selectors

    @objc func keyboardWillDisappear() {

        if inputTextView.text == "" {
            pickImageButton.isHidden = false
        }
    }

    // MARK: - IBActions

    @IBAction func sendButtonTapped(_ sender: Any) {
        if inputTextView.text.isEmpty { return }
        let message = Message()
        message.message = inputTextView.text
        message.senderId = "Me"
        messages.append(message)
        inputTextView.text = ""

        didFinishedSendingMessage()
    }

    @IBAction func pickImageTapped(_ sender: Any) {

        let alert = UIAlertController.init(title: "Select media for image", message: "", preferredStyle: UIAlertController.Style.actionSheet)

        let galleryAction = UIAlertAction(title: "Gallery", style: UIAlertAction.Style.default) { (action) in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }

        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default) { (action) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)

        alert.addAction(galleryAction)
        alert.addAction(cameraAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

    // MARK:  Private Methods

    func loadData() {
        populateDummyData()
        scrollToBttom()
    }

    private func populateDummyData() {
        var i = 0

        while i<30 {
            let message = Message()

            message.message = "\(i) \n Hi \n there  this is some long text here which is good for testing \n Its just a sample"
            message.senderId = "Me"

            if i%2 == 0 {
                message.senderId = "Other"
            }

            if i%4 == 0 && message.senderId == "Other" {
                message.messageType = .image

                if i%6 == 0 {
                    message.messageImage = #imageLiteral(resourceName: "telegram-icon")
                }
            }

            messages.append(message)
            i += 1
        }

        tableView.reloadData()
    }

    private func didFinishedSendingMessage() {

        let indexPathOfLastRow = IndexPath(row: self.messages.count - 1, section: 0)
        self.tableView.insertRows(at: [indexPathOfLastRow], with: .fade)
        self.tableView.scrollToRow(at: indexPathOfLastRow, at: .bottom, animated: false)

        // Resize TextView to default size
        DispatchQueue.main.async {
            self.inputTextView.isScrollEnabled = false
            self.inputTextView.text = " "
            //self.inputTextView.resignFirstResponder()
            self.inputTextView.frame.size.height = 35.0
            self.inputToolBarView.layoutIfNeeded()
            self.inputToolBarView.layoutSubviews()
            self.inputToolBarView.setNeedsDisplay()
            self.inputTextView.text = ""
        }
    }

    private func scrollToBttom() {

        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.messages.count-1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
}

extension CustomChatViewController: UITableViewDelegate, UITableViewDataSource {

    // MARK: - UITableView DataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if messages[indexPath.row].senderId != userId {

            if messages[indexPath.row].messageType == .image {
                let cell = InComingChatImageTableViewCell.cellForTableView(tableView: tableView, atIndexPath: indexPath)
                cell.messageImageView.image = messages[indexPath.row].messageImage
                return cell
            }

            let cell = InComingChatTableViewCell.cellForTableView(tableView: tableView, atIndexPath: indexPath)
            cell.configureCell()
            cell.messageLabel.text = messages[indexPath.row].message

            return cell

        } else {

            if messages[indexPath.row].messageType == .image {
                let cell = OutGoingChatImageTableViewCell.cellForTableView(tableView: tableView, atIndexPath: indexPath)
                cell.messageImageView.image = messages[indexPath.row].messageImage
                return cell
            }

            let cell = OutGoingChatTableViewCell.cellForTableView(tableView: tableView, atIndexPath: indexPath)
            cell.configureCell()
            cell.messageLabel.text = messages[indexPath.row].message
            return cell
        }
    }
}

extension CustomChatViewController: UITextViewDelegate {

    //  MARK: - UITextView Delegate

    func textViewDidBeginEditing(_ textView: UITextView) {
        pickImageButton.isHidden = true
    }

    func textViewDidEndEditing(_ textView: UITextView) {

        if textView.text == "" {
            pickImageButton.isHidden = false
        }
    }

    func textViewDidChange(_ textView: UITextView) {

        if textView.text.trimmingCharacters(in: .whitespaces).isEmpty {
            self.sendButton.isEnabled = false

        } else {
            self.sendButton.isEnabled = true
        }

        if textView.contentSize.height >= 100 { // Max height of textView
            textView.isScrollEnabled = true

        } else {
            textView.frame.size.height = textView.contentSize.height
            textView.isScrollEnabled = false
        }
    }
}

extension CustomChatViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            let message = Message()
            message.senderId = "Me"
            message.messageType = .image
            message.messageImage = pickedImage
            messages.append(message)
            inputTextView.text = ""

            self.didFinishedSendingMessage()
        }

        dismiss(animated: true, completion: nil)
    }
}
