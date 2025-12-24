//
//  SelectTime.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 05/11/2025.
//

import SwiftUI

struct SelectTimeView: View {
    // MARK: - Properties
    @StateObject private var viewModel: SelectTimeViewModel
    
    // MARK: - Init
    init(viewModel: SelectTimeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            SelectTimeNavBar(onCloseTapped: {
                viewModel.closeTapped()
            })
            
            HeaderSelectedTime(time: viewModel.formattedTime)
            
            timePickerSection
            
            alertSection
            
            actionButtons
            
            Spacer()
        }
        .padding(20)
        .onAppear {
            viewModel.viewDidLoad()
        }
    }
}
// MARK: - SubViews
//
extension SelectTimeView {
    private var timePickerSection: some View {
        HStack(spacing: 12) {
            MinutePickerView(
                selectedMinute: Binding(
                    get: { viewModel.hour },
                    set: { viewModel.updateHour($0) }
                ),
                fromTo: Array(0...23)
            )
            
            Text(":")
                .foregroundStyle(Color.LightGray)
            
            MinutePickerView(
                selectedMinute: Binding(
                    get: { viewModel.minute },
                    set: { viewModel.updateMinute($0) }
                ),
                fromTo: Array(0...59)
            )
            
            Text(viewModel.hour >= 12 ? "pm" : "am")
                .font(.customfont(.medium, fontSize: 16))
                .foregroundStyle(Color.LightGray)
        }
    }
    
    private var alertSection: some View {
        Group {
            AlertRow(
                imageName: "Alarm",
                title: L10n.Time.sound,
                subTitle: viewModel.soundTitle
            )
            
            AlertRow(
                imageName: "Sound",
                title: L10n.Time.snooze,
                subTitle: viewModel.snoozeTitle
            )
        }
    }
    
    private var actionButtons: some View {
        HStack {
            SecondaryButton(
                title: L10n.General.back,
                width: (.screenWidth * 0.5 - 30.0),
                action: { viewModel.backTapped() }
            )
            
            Spacer()
            
            PrimaryButton(
                title: L10n.General.done,
                width: (.screenWidth * 0.5 - 30.0),
                action: { viewModel.doneTapped() }
            )
        }
        .padding(.top, 24)
    }
}
// MARK: - Preview
//
#Preview {
    SelectTimeFactory.create(coordinator: nil)
}
