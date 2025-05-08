//
//  ContentView.swift
//  ToDoList
//
//  Created by Gary Erickson on 5/5/25.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @Query var toDos: [ToDo]
//    var toDos = ["Learn Swift", "Build Apps","Change the world",
//                 "Bring  the Awesome", "Taka a Vacation"]
    @State private var sheetIsPresented = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(toDos) { toDo in
                    
                    VStack (alignment: .leading) {
                        HStack {
                            Image(systemName: toDo.isComplete ? "checkmark.rectangle" : "rectangle")
                                .onTapGesture {
                                    toDo.isComplete.toggle()
                                    guard let _ = try? modelContext.save() else {
                                        print("😡 ERROR: Save after .toggle on ToDoListView did not work.")
                                        return
                                    }
                                }
                            
                            NavigationLink {
                                DetailView(toDo: toDo )
                            } label: {
                                Text(toDo.item)
                            }
                            .font(.title2)
                            .swipeActions {
                                Button("Delete", role: .destructive){
                                    modelContext.delete(toDo)
                                    guard let _ = try? modelContext.save() else {
                                        print("😡 ERROR: Save after .delete on ToDoListView did not work.")
                                        return
                                    }
                                }
                            }
                        }
                    }
                    .font(.title2)
                    
                    HStack {
                        Text(toDo.dueDate.formatted(date: .abbreviated, time: .shortened))
                            .foregroundStyle(.secondary)
                        if toDo.reminderIsOn {
                            Image(systemName: "calendar.badge.clock")
                                .symbolRenderingMode(.multicolor)
                        }
                    }
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: ToDo())
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            
            //                Section {
            //
            //
            //                    NavigationLink {
            //                        DetailView()
            //                    } label: {
            //                        //  Image(systemName: "eye")
            //                        Text("Winter")
            //                    }
            //                    //.buttonStyle(.borderedProminent)
            //                    .font(.largeTitle)
            //
            //                    NavigationLink {
            //                        DetailView()
            //                    } label: {
            //                        //  Image(systemName: "eye")
            //                        Text("Spring")
            //                    }
            //                    //.buttonStyle(.borderedProminent)
            //                    .font(.largeTitle)
            //                } header: {
            //                    Text("Semesters")
            //                }
            //                Section {
            //
            //
            //                    NavigationLink {
            //                        DetailView()
            //                    } label: {
            //                        //  Image(systemName: "eye")
            //                        Text("Summer")
            //                    }
            //                    //.buttonStyle(.borderedProminent)
            //                    .font(.largeTitle)
            //
            //                    NavigationLink {
            //                        DetailView()
            //                    } label: {
            //                        //  Image(systemName: "eye")
            //                        Text("Fall")
            //                    }
            //                    //.buttonStyle(.borderedProminent)
            //                    .font(.largeTitle)
            //                } header: {
            //                    Text("BSemesters")
            //                }
            //            }
            //            .navigationTitle("School Year")
            //            .navigationBarTitleDisplayMode(.automatic)
            //            .listStyle(.plain)
            //
        }
        
    }
    //}
    
    //.padding()
}
//}

#Preview {
    
    ToDoListView()
//        .modelContainer(for: ToDo.self, inMemory: true)
        .modelContainer(ToDo.preview)
    
}
