//
//  TermsandConditionsView.swift
//  bitesize
//
//  Created by Michelle Annice on 10/11/23.
//

import SwiftUI

struct TermsandConditionsView: View {
    var body: some View {
        ScrollView{
            VStack{
                
                Text("Terms of Use")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .kerning(0.16)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .padding(.bottom, 12)
                    .padding(.top, 14)
                
                Text("Medical APP Disclaimer")
                    .font(
                        Font.custom("Inter", size: 22)
                            .weight(.medium)
                    )
                    .kerning(0.088)
                    .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                    .frame(width: 358, alignment: .leading)
                    .padding(.bottom, 16)
                
                Text("Medical Information Disclaimer")
                  .font(
                    Font.custom("Inter", size: 18)
                      .weight(.semibold)
                  )
                  .kerning(0.16)
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(width: 358, alignment: .leading)
                  .padding(.bottom, 4)
                
                Text("The information provided by Bitesize is intended for general informational purposes only. It is not a substitute for professional medical advice, diagnosis, or treatment. Always seek the advice of your physician or another qualified healthcare provider with any questions you may have regarding a medical condition.")
                  .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(width: 358, alignment: .leading)
                  .padding(.bottom, 16)
                
                Text("Never Disregard Professional Medical Advice")
                  .font(
                    Font.custom("Inter", size: 18)
                      .weight(.semibold)
                  )
                  .kerning(0.16)
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(width: 358, alignment: .leading)
                  .padding(.bottom, 4)
                
                Text("Never disregard professional medical advice or delay in seeking it because of something you have read on the App. If you think you may have a medical emergency, call your doctor immediately. The App does not recommend or endorse any specific tests, physicians, products, procedures, opinions, or other information that may be mentioned on the App.")
                  .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(width: 358, alignment: .leading)
                  .padding(.bottom, 16)
                
                Text("Reliance on Information")
                  .font(
                    Font.custom("Inter", size: 18)
                      .weight(.semibold)
                  )
                  .kerning(0.16)
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(width: 358, alignment: .leading)
                  .padding(.bottom, 4)
                
                Text("Reliance on any information provided by the App is solely at your own risk. The App is not responsible for the accuracy, completeness, or usefulness of any information made available through the App. Any reliance you place on such information is strictly at your own risk.")
                  .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(width: 358, alignment: .leading)
                  .padding(.bottom, 16)
                
                Text("Updates and Changes")
                  .font(
                    Font.custom("Inter", size: 18)
                      .weight(.semibold)
                  )
                  .kerning(0.16)
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(width: 358, alignment: .leading)
                  .padding(.bottom, 4)
                
                Text("The content on the App may be updated and changed periodically. While we strive to provide accurate and up-to-date information, no guarantee is given that the information provided on the App is correct, complete, or current.")
                  .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(width: 358, alignment: .leading)
                  .padding(.bottom, 16)
                
                Text("Liability")
                  .font(
                    Font.custom("Inter", size: 18)
                      .weight(.semibold)
                  )
                  .kerning(0.16)
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(width: 358, alignment: .leading)
                  .padding(.bottom, 4)
                
                Text("In no event shall the App, its creators, or its affiliates be liable for any direct, indirect, incidental, special, or consequential damages, or damages for loss of profits, revenue, data, or use incurred by you or any third party, whether in an action in contract or tort, arising from your access to, or use of, the App.")
                  .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(width: 358, alignment: .leading)
                  .padding(.bottom, 16)
                
                Text("Contact Us")
                  .font(
                    Font.custom("Inter", size: 18)
                      .weight(.semibold)
                  )
                  .kerning(0.16)
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(width: 358, alignment: .leading)
                  .padding(.bottom, 4)
                
                Text("If you have any questions or concerns about this disclaimer or the information provided by the App, please contact us at appBitesize@gmail.com By using the App, you acknowledge that you have read and understood this disclaimer and agree to its terms and conditions.")
                  .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.08, green: 0.12, blue: 0.12))
                  .frame(width: 358, alignment: .leading)
                  .padding(.bottom, 16)
                
                Text("Last updated: 10/10/2023\n-")
                  .font(Font.custom("Inter", size: 14))
                  .kerning(0.08)
                  .foregroundColor(Color(red: 0.5, green: 0.53, blue: 0.53))
                  .frame(width: 358, alignment: .leading)
                
            }
        }
    }
}

#Preview {
    TermsandConditionsView()
}
