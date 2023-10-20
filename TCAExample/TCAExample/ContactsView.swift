//
//  ContactsView.swift
//  TCAExample
//
//  Created by Sunrizz on 20.10.2023.
//

import SwiftUI
import ComposableArchitecture

struct ContactsView: View {
    let store: StoreOf<ContactsFeature>
    
    var body: some View {
        NavigationStack {
            WithViewStore(self.store, observe: \.contacts) { viewStore in
                List {
                    ForEach(viewStore.state) { contact in
                        HStack {
                          Text(contact.name)
                          Spacer()
                          Button {
                            viewStore.send(.deleteButtonTapped(id: contact.id))
                          } label: {
                            Image(systemName: "trash")
                              .foregroundColor(.red)
                          }
                        }
                    }
                }
                .navigationTitle("Contacts")
                .toolbar {
                    ToolbarItem {
                        Button(action: {
                            viewStore.send(.addButtonTapped)
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                }
            }
        }
        .sheet(
            store: self.store.scope(
                state: \.$addContact,
                action: { .addContact($0) }
            )
        ) { addContactStore in
            NavigationStack {
                AddContactView(store: addContactStore)
            }
        }
        .alert(
            store: self.store.scope(
                state: \.$alert,
                action: { .alert($0) }
            )
        )
    }
}

#Preview {
    ContactsView(
        store: Store(
            initialState: ContactsFeature.State(
                contacts: [
                    Contact(id: UUID(), name: "Bob"),
                    Contact(id: UUID(), name: "Dilan"),
                    Contact(id: UUID(), name: "Mary"),
                    Contact(id: UUID(), name: "Jorge")
                ]), reducer: {
                    ContactsFeature()
                })
    )
}
