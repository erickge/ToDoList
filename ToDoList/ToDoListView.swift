//
//  ContentView.swift
//  ToDoList
//
//  Created by Gary Erickson on 5/5/25.
//

import SwiftUI

struct ToDoListView: View {
    var toDos = ["Learn Swift", "Build Apps","Change the world",
                 "Bring  the Awesome", "Taka a Vacation"]
    @State private var sheetIsPresented = false
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(toDos, id:\.self) { toDo in
                    
                    NavigationLink {
                        DetailView(toDo: toDo )
                    } label: {
                        Text(toDo)
                    }
                    .font(.title2)
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: "")
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
    
}
