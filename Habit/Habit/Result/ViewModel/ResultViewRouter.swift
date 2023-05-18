//
//  ResultViewRouter.swift
//  Cofee
//
//  Created by coltec on 09/05/23.
//

import SwiftUI


enum ResultViewRouter{
    static func makeCalcView() -> some View{
        let viewModel = CalcViewModel()
        return CalcView(viewModel: viewModel)
    }
}
