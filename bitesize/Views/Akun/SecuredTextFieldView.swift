//
//  SecuredTextFieldView.swift
//  bitesize
//
//  Created by Michelle Annice on 07/11/23.
//

import SwiftUI

/// The identity of the TextField and the SecureField.
enum Field: Hashable {
    case showPasswordField
    case hidePasswordField
}

enum UserFormType {
    case password, repeatPassword
    
    var title: String {
        switch self {
        case .password:
            return "Input your password"
        case .repeatPassword:
            return "Retype your Password"
        }
    }
}

/// This view supports for have a secured filed with show / hide functionality.
///
/// We have managed show / hide functionality by using
/// A SecureField for hide the text, and
/// A TextField for show the text.
///
/// Please note that,
/// hide -> show -> hide senario with reset the text by the new input value.
/// It's common even in the other apps. eg: LinkedIn, MoneyGram
struct SecuredTextFieldView: View {

    /// Options for opacity of the fields.
    enum Opacity: Double {

        case hide = 0.0
        case show = 1.0

        /// Toggle the field opacity.
        mutating func toggle() {
            switch self {
            case .hide:
                self = .show
            case .show:
                self = .hide
            }
        }
    }

    /// The property wrapper type that can read and write a value that
    /// SwiftUI updates as the placement of focus.
    @FocusState private var focusedField: Field?

    /// The show / hide state of the text.
    @State private var isSecured: Bool = true

    /// The opacity of the SecureField.
    @State private var hidePasswordFieldOpacity = Opacity.show

    /// The opacity of the TextField.
    @State private var showPasswordFieldOpacity = Opacity.hide

    /// The text value of the SecureFiled and TextField which can be
    /// binded with the @State property of the parent view of SecuredTextFieldView.
    @Binding var text: String
    
    /// Parent view of this SecuredTextFieldView.
    /// Also this is a struct and structs are value type.
    @State var parent: SecuredTextFieldParentProtocol
    
    var type: UserFormType

    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                securedTextField
            }
        }.padding(.horizontal, 16)
        .onAppear {
            self.parent.hideKeyboard = hideKeyboard
        }
    }

    /// Secured field with the show / hide capability.
    var securedTextField: some View {
        Group {
            SecureField("\(type.title)", text: $text)
                .textInputAutocapitalization(.never)
                .keyboardType(.asciiCapable) // This avoids suggestions bar on the keyboard.
                .autocorrectionDisabled(true)
                .padding(.leading, 16)
                .padding(.vertical, 13)
                .frame(width: 358, height: 50, alignment: .leading)
                .background(.white)

                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.25)
                        .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                )
                .padding(.bottom, 16)
                .focused($focusedField, equals: .hidePasswordField)
                .opacity(hidePasswordFieldOpacity.rawValue)
                .overlay(
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        performToggle()
                                    }) {
                                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                            .accentColor(.gray)
                                    }
                                    .padding(.trailing, 15)
                                }
                            )

            TextField("\(type.title)", text: $text)
                .textInputAutocapitalization(.never)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled(true)
                .padding(.leading, 16)
                .padding(.vertical, 13)
                .frame(width: 358, height: 50, alignment: .leading)
                .background(.white)

                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.25)
                        .stroke(Color(red: 0.71, green: 0.73, blue: 0.73), lineWidth: 0.5)
                )
                .padding(.bottom, 16)
                .focused($focusedField, equals: .showPasswordField)
                .opacity(showPasswordFieldOpacity.rawValue)
                .overlay(
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        performToggle()
                                    }) {
                                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                            .accentColor(.gray)
                                    }
                                    .padding(.trailing, 15)
                                }
                            )
        }
    }
    
    /// This supports the parent view to perform hide the keyboard.
    func hideKeyboard() {
        self.focusedField = nil
    }
    
    /// Perform the show / hide toggle by changing the properties.
    private func performToggle() {
        isSecured.toggle()

        if isSecured {
            focusedField = .hidePasswordField
        } else {
            focusedField = .showPasswordField
        }

        hidePasswordFieldOpacity.toggle()
        showPasswordFieldOpacity.toggle()
    }
}
