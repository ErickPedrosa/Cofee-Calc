//
//  CalcViewRouter.swift
//  Cofee
//
//  Created by coltec on 09/05/23.
//

import SwiftUI


enum CalcViewRouter{
    static func makeResultView(resultado: Bool) -> some View{
        let viewModel = ResultViewModel()
        return ResultView(viewModel: viewModel, result: resultado)
    }
}
