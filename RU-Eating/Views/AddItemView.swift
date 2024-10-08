//
//  ItemsView.swift
//  MenRU
//
//  Created by alex on 9/6/24.
//

import SwiftUI
import SwiftSoup

struct AddItemsView : View {
    @State var viewModel: AddItemsViewModel
    
    @Environment(\.dismiss) var dismiss
    @Environment(Settings.self) private var settings
    
    var body : some View {
        NavigationStack {
            VStack {
                if viewModel.rawItems.isEmpty {
                    if viewModel.fetched {
                        ContentUnavailableView("No Internet Connection", systemImage: "wifi.slash")
                    }
                    else {
                        ProgressView()
                    }
                }
                else {
                    List {
                        ForEach(viewModel.items, id: \.self) { item in
                            if !viewModel.meal.items.contains(item) {
                                Button {
                                    viewModel.addItem(item: item)
                                    dismiss()
                                } label: {
                                    Text(viewModel.getHighlightedName(item: item))
                                }
                                .foregroundStyle(.primary)
                            }
                        }
                    }
                }
            }
            .task {
                await viewModel.updateItems()
            }
            .navigationTitle("Add Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", action: { dismiss() })
                }
            }
        }
        .searchable(text: $viewModel.searchText)
        .searchScopes($viewModel.searchScope, activation: .onSearchPresentation) {
            ForEach(places.map { $0.shortenName }, id: \.self) { name in
                Text(name)
            }
        }
        .onChange(of: viewModel.searchScope) {
            settings.lastDiningHall = viewModel.searchScope
            Task {
                await viewModel.updateItems()
            }
        }
    }
}
