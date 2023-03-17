//
//  model.swift
//  TryTheAnimation
//
//  Created by Kirill Kniga on 16.03.2023.
//

struct AnimationCollection {
    var preset: String
    var curve: String
    var force: Double
    var duration: Double
    var delay: Double
}

extension AnimationCollection {
    static func getCollection() -> [AnimationCollection] {
        [
            AnimationCollection(preset: "slideLeft",
                                curve: "easeInQuad",
                                force: 1.37,
                                duration: 1.50,
                                delay: 0.3),
            AnimationCollection(preset: "slideRight",
                                curve: "spring",
                                force: 2,
                                duration: 1.20,
                                delay: 0.5),
            AnimationCollection(preset: "slideDown",
                                curve: "linear",
                                force: 1.10,
                                duration: 1.10,
                                delay: 0.7)
        ]
    }
}


