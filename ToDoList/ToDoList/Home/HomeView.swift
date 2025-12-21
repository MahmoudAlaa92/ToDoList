//
//  Home.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 31/10/2025.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @StateObject private var viewModel: HomeViewModel
    @State private var showMenu: Bool = false
    private weak var coordinator: CoordinatorProtocol?
    
    // MARK: - Init
    init(viewModel: HomeViewModel, coordinator: CoordinatorProtocol?) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.coordinator = coordinator
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            AnimatedSideBar(
                rotatesWhenExpands: true,
                disablesInteraction: true,
                sideMenuWidth: 250,
                cornerRadius: 25,
                showMenu: $showMenu
            ) { safeArea in
                mainContent(safeArea: safeArea)
            } menuView: { safeArea in
                sideBarMenuView(safeArea)
            } background: {}
        }
        .onAppear {
            viewModel.viewDidLoad()
        }
    }
}
// MARK: - Main Content
//
extension HomeView {
    @ViewBuilder
    private func mainContent(safeArea: UIEdgeInsets) -> some View {
        VStack {
            HomeNavBar(
                onTappedNotification: { handleNotificationTapped() },
                onTappedProfilePicture: { coordinator?.pushProfileView(for: .home) },
                onTappedMenu: { showMenu.toggle() }
            )
            .padding(.top, safeArea.top + 8)
            
            ScrollView {
                calendarSection
                AnnouncementCard()
                todaysTasksSection
                myProjectsSection
                Spacer()
            }
            .scrollIndicators(.hidden)
            .padding(.bottom, safeArea.bottom + 44)
        }
        .padding(.horizontal, 20)
    }
}
// MARK: - View Components
//
extension HomeView {
    @ViewBuilder
    private var calendarSection: some View {
        HeaderView(name: "Calendar", seeAll: "")
        
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
        .scrollIndicators(.hidden)
        .padding(.bottom, 24 * .deviceFontScale)
    }
    
    @ViewBuilder
    private var todaysTasksSection: some View {
        HeaderView(name: "Today's tasks")
        
        if viewModel.todaysTasks.isEmpty {
            emptyTasksView
        } else {
            tasksList
        }
    }
    
    @ViewBuilder
    private var tasksList: some View {
        List {
            ForEach(Array(viewModel.todaysTasks.enumerated()), id: \.offset) { index, task in
                TaskCard(
                    taskCardModel: task,
                    onDelete: { viewModel.deleteTask(at: index) }
                )
                .onTapGesture { handleTaskTapped(task) }
            }
        }
        .listStyle(.plain)
        .scrollDisabled(true)
        .frame(height: CGFloat(viewModel.todaysTasks.count) * 150 * .deviceFontScale)
    }
    
    @ViewBuilder
    private var emptyTasksView: some View {
        VStack(spacing: 12) {
            Text("No tasks for today")
                .font(.customfont(.medium, fontSize: 16))
                .foregroundColor(.LightGray)
        }
        .frame(height: 100)
    }
    
    @ViewBuilder
    private var myProjectsSection: some View {
        HeaderView(name: "My Projects") {
            coordinator?.myProjectsView(for: .home)
        }
        
        ForEach(viewModel.projects.indices, id: \.self) { index in
            ProjectCell(projectItem: viewModel.projects[index])
                .onTapGesture { handleProjectTapped(viewModel.projects[index]) }
        }
    }
    
    @ViewBuilder
    private func sideBarMenuView(_ safeArea: UIEdgeInsets) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            profileHeader
            
            Divider()
                .background(.primary.opacity(0.3))
                .padding(.vertical, 8)
            
            menuItems
            
            Spacer()
            
            MenuButton(image: "Lock", title: "Logout") {
                handleLogout()
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
    
    @ViewBuilder
    private var profileHeader: some View {
        HStack {
            Image("ProfilePicture2")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            
            Text("Mahmoud Alaa")
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.primary)
        }
    }
    
    @ViewBuilder
    private var menuItems: some View {
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
    }
}
// MARK: - Actions
//
extension HomeView {
    private func handleTaskTapped(_ task: PlannedModel) {
        coordinator?.pushProjectDetails(for: .home, taskCard: task)
    }
    
    private func handleProjectTapped(_ project: PlannedModel) {
        coordinator?.pushCreatedTaskView(for: .home, taskCard: project)
    }
    
    private func handleNotificationTapped() {
        coordinator?.pushNotification(for: .home)
    }
    
    private func handleLogout() {
        coordinator?.logout()
        showMenu = false
    }
}
// MARK: - Preview
//
#Preview {
    HomeFactory.create(coordinator: nil, taskStore: TaskStore())
}
