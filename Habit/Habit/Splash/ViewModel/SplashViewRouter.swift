//
//  SplashViewRouter.swift
//  Habit
//
//  Created by Virginia Mota on 10/04/22.
//

import SwiftUI


enum SplashViewRouter{
    
    static func makeCalcView() -> some View{
        let viewModel = CalcViewModel()
        return CalcView(viewModel: viewModel)
    }
}
