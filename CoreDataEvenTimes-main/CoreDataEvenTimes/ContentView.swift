//
//  ContentView.swift
//  CoreDataEvenTimes
//
//  Created by Parker Rushton on 10/3/22.

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        HStack {
                            Text(item.timestamp!, formatter: itemFormatter)
                            
                            Spacer()
                            
                            if item.hasEvenMinutesAndSeconds {
                                Image(systemName: "checkmark").foregroundColor(.green)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }
    
    private func addItem() {
        withAnimation {
            let now = Date.now
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.hasEvenMinutesAndSeconds = dateIsAllEven(now)
            try? viewContext.save()
        }
    }
    
    // Determines if the date passed in has an even number of minutes and seconds
    private func dateIsAllEven(_ date: Date) -> Bool {
        let minutes = Calendar.current.component(.minute, from: date)
        let seconds = Calendar.current.component(.second, from: date)
        let minutesAreEven = minutes % 2 == 0
        let secondsAreEven = seconds % 2 == 0
        return minutesAreEven && secondsAreEven
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            try? viewContext.save()
        }
    }
    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
