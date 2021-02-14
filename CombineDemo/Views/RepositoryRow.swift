//
//  RepositoryView.swift
//  CombineDemo
//
//  Created by Łukasz Kuczborski on 14/02/2021.
//

import SwiftUI

struct RepositoryRow: View {
    let viewModel: RepositoryViewModel
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                (Text(Image(systemName: viewModel.isPrivate ? "lock" : "lock.open")) +
                Text(" \(viewModel.name)"))
                    .titleBold()
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    
                HStack {
                    Text(Image(systemName: "star")) + Text(" \(viewModel.starsCount.description)")
                    Text(Image(systemName: "tuningfork")) + Text(" \(viewModel.forksCount.description)")
                }
                .font(.caption)
                .padding(.top, -6)
                
                if let description = viewModel.description {
                    Text(description)
                        .description()
                        .multilineTextAlignment(.center)
                        .padding(.top, -2)
                }
            }
            .padding([.top, .bottom])
            Spacer()
        }
        .background(Color.black.opacity(0.05))
        .cornerRadius(6)
        .padding([.leading, .trailing])
    }
}

struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryRow(viewModel: RepositoryViewModel.preview)
    }
}