//
//  RequirementsPickerView.swift
//  bitesize
//
//  Created by Michelle Annice on 08/11/23.
//

import SwiftUI

enum RequirementsType {
    case eightChar, spacialChar, oneDigit, upperCaseChar, confirmation
    
    var description: LocalizedStringKey {
        switch self {
        case .eightChar:
            return "8 characters"
        case .spacialChar:
            return "1 special character"
        case .oneDigit:
            return "1 number"
        case .upperCaseChar:
           return "1 uppercase letter"
        case .confirmation:
            return "The password and confirmation must match"
        }
    }
}

struct RequirementsPickerView: View {
    var type: RequirementsType
    @Binding var toggleState: Bool
    
    var body: some View {
        HStack {
            Toggle("", isOn: $toggleState.animation(.easeInOut))
                .toggleStyle(CheckboxToggleStyle())
                .disabled(true)
                .frame(width: 16, height: 16)
            Text(type.description)
                .font(Font.custom("Inter", size: 11))
                .kerning(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(toggleState ? Color(red: 0.18, green: 0.56, blue: 0.42) : Color(red: 0.35, green: 0.38, blue: 0.37))
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

struct RequirementsPickerView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementsPickerView(type: .eightChar, toggleState: .constant(false))
    }
}
