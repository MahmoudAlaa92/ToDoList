//
//  Home.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showMenu: Bool = false
    @StateObject var viewModel: HomeViewModel
    weak var coordinator: CoordinatorProtocol?
    
    var body: some View {
        VStack {
            AnimatedSideBar(
                rotatesWhenExpands: true,
                disablesInteraction: true,
                sideMenuWidth: 250,
                cornerRadius: 25,
                showMenu: $showMenu
            ) { safeArea in
                // Main Content
                VStack {
                    HomeNavBar(
                        onTappedNotification: { onTappedNotification() },
                        onTappedProfilePicture: { coordinator?.pushProfileView(for: .home) },
                        onTappedMenu: { showMenu.toggle() }
                    )
                    .padding(.top, safeArea.top + 8)

                    ScrollView {
                        calenderSection()
                        AnnouncementCard()
                        toDaysTasksSection()
                        myProjectsSection()
                        Spacer()
                    }
                    .scrollIndicators(.hidden)
                    .padding(.bottom, safeArea.bottom + 40)
                }
                .padding(.horizontal, 20)
            } menuView: { safeArea in
                sideBarMenuView(safeArea)
            } background: {
               
            }
        }
    }
    
}

// MARK: - Views
extension HomeView {
    
    @ViewBuilder
    fileprivate func calenderSection() -> some View {
        HeaderView(name: "Calender", seeAll: "")
        
        ScrollView(.horizontal) {
            HStack(spacing: 24 * .deviceFontScale) {
                ForEach(viewModel.days, id: \.self) { item in
                    CalenderCard(
                        title: item.day,
                        number: item.number,
                        progress: item.progress
                    )
                }
            }
            .padding([.horizontal, .vertical], 8 * .deviceFontScale)
        }
        .padding(.bottom, 24 * .deviceFontScale)
    }
    
    @ViewBuilder
    fileprivate func toDaysTasksSection() -> some View {
        HeaderView(name: "To day's tasks")
        
        List {
            ForEach(Array(viewModel.todaysTask.enumerated()), id: \.offset) { index, item in
                TaskCard(taskCardModel: item,
                         onDelete: { viewModel.deleteItems(at: index) })
                
                .onTapGesture { onTappedTodaysTask(task: item) }
            }
        }
        .listStyle(.plain)
        .scrollDisabled(true)
        .frame(height: CGFloat(viewModel.todaysTask.count) * 150 * .deviceFontScale)
    }
    
    @ViewBuilder
    fileprivate func myProjectsSection() -> some View {
        HeaderView(name: "My Projects")
        
        ForEach(viewModel.projectCells.enumerated(), id: \.offset) { (index, item) in
            ProjectCell(projectItem: item)
                .onTapGesture { onTappedProject(task: item) }
        }
    }
    
    @ViewBuilder
    func sideBarMenuView(_ safeArea: UIEdgeInsets) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image("ProfilePicture2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                
                Text("Mahmoud Alaa")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.primary)
            }
            Divider()
                .background(.primary.opacity(0.3))
                .padding(.vertical, 8)
            
            // Add your menu items here
            MenuButton(image: "home", title: "Home") {
                showMenu = false
            }
            
            MenuButton(image: "Account", title: "Profile") {
                coordinator?.pushProfileView(for: .home)
                showMenu = false
            }
            
            MenuButton(image: "allTasks", title: "Notifications") {
                coordinator?.pushNotification(for: .home)
                showMenu = false
            }
            
            MenuButton(image: "flag2", title: "Priorities") {
                coordinator?.pushNotification(for: .home)
                showMenu = false
            }
            
            MenuButton(image: "planned", title: "Planned") {
                showMenu = false
            }
            
            Spacer()
            
            MenuButton(image: "Lock", title: "Logout") {
                showMenu = false
            }
            Spacer()
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 20)
        .padding(.top, safeArea.top)
        .padding(.bottom, safeArea.bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .environment(\.colorScheme, .dark)
        .background(Color.darkPrimaryApp)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

// MARK: - Actions
extension HomeView {
    fileprivate func onTappedTodaysTask(task: PlannedModel) {
        coordinator?.pushProjectDetails(for: .home, taskCard: task)
    }
    
    fileprivate func onTappedNotification() {
        coordinator?.pushNotification(for: .home)
    }
    
    fileprivate func onTappedProject(task: PlannedModel) {
        coordinator?.pushCreatedTaskView(for: .home, taskCard: task)
    }
}

// MARK: - Preview
#Preview {
    HomeView(viewModel: HomeViewModel())
}
