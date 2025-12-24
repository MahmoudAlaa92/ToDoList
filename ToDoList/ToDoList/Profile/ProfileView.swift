//
//  ProfileView.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 03/11/2025.
//

import SwiftUI

struct ProfileView<ViewModel: ProfileViewModelType>: View {
    
    // MARK: - Properties
    @StateObject var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                navigationBar()
                profileImageSection()
                profileFieldsSection()
                qrCodeSection()
                saveButton()
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .padding(.horizontal, 20)
    }
}

// MARK: - SubViews
extension ProfileView {
    func navigationBar() -> some View {
        BackAndEllipsesNavBar(
            onTappedBack: { viewModel.didTapBack() },
            onTappedEllipse: { viewModel.didTapMoreOptions() }
        )
        .padding(.top, 20 * .deviceFontScale)
    }
    
    func profileImageSection() -> some View {
        VStack {
            ZStack {
                Image(viewModel.profileImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: 260 * .deviceFontScale,
                        height: 180 * .deviceFontScale
                    )
                
                Image("Edit")
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: 50 * .deviceFontScale,
                        height: 40 * .deviceFontScale
                    )
                    .padding(10)
                    .background(Circle().fill(Color.white))
                    .offset(y: 80 * .deviceFontScale)
                    .onTapGesture {
                        viewModel.didTapEditPhoto()
                    }
            }
            .frame(height: 200 * .deviceFontScale)
            
            Text(L10n.Profile.editPhoto)
                .font(.customfont(.medium, fontSize: 16 * .deviceFontScale))
                .foregroundStyle(Color.darkGray)
        }
        .padding(.bottom, 8)
    }
    
    func profileFieldsSection() -> some View {
        VStack(spacing: 16 * .deviceFontScale) {
            CustomTextField(
                title: L10n.Profile.fullName,
                placeholder: L10n.Profile.enterFullName,
                text: Binding(
                    get: { viewModel.fullName },
                    set: { viewModel.updateFullName($0) }
                )
            )
            
            CustomTextField(
                title: L10n.Profile.email,
                placeholder: L10n.Profile.enterEmail,
                text: Binding(
                    get: { viewModel.email },
                    set: { viewModel.updateEmail($0) }
                )
            )
            
            CustomTextField(
                title: L10n.Profile.phoneNumber,
                placeholder: "+20 1142128919",
                text: Binding(
                    get: { viewModel.phoneNumber },
                    set: { viewModel.updatePhoneNumber($0) }
                )
            )
        }
    }
    
    func qrCodeSection() -> some View {
        HStack {
            Text(L10n.Profile.yourQRCode)
                .font(.customfont(.regular, fontSize: 12 * .deviceFontScale))
            
            Text(L10n.Profile.download)
                .foregroundStyle(Color.primaryApp)
                .font(.customfont(.regular, fontSize: 12 * .deviceFontScale))
                .onTapGesture {
                    viewModel.didTapDownloadQRCode()
                }
            
            Spacer()
        }
    }
    
    func saveButton() -> some View {
        PrimaryButton(
            title: viewModel.isSaving ? L10n.Profile.saving : L10n.Profile.saveInfo,
            action: { viewModel.saveProfile() }
        )
        .padding(.top, 24)
        .disabled(viewModel.isSaving || !viewModel.hasChanges)
        .opacity(viewModel.isSaving || !viewModel.hasChanges ? 0.6 : 1.0)
    }
}
