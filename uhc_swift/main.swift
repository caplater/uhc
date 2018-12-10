//
//  main.swift
//  uhc_swift
//
//  Created by Charles Plater on 12/9/18.
//  Copyright © 2018 Charles Plater. All rights reserved.
//

import Foundation

let size = 12

func checkIfSafe(_ v: Int, _ graph: [[Int]], _ path: [Int], _ position: Int) -> Bool {
    if (graph [path[position-1]][v] == 0) {
        return false;
    }
    for i in 0..<position {
        if (path[i] == v) {
            return false
        }
    }
    return true
}

func checkPosition(_ graph: [[Int]], _ path: inout [Int], _ position: Int) -> Bool {
    
    if (position == size) {
        if (graph[path[position-1]][path[0]] == 1) {
            return true
        }
        else {
            return false
        }
    }
    for v in 1..<size {
        if (checkIfSafe(v, graph, path, position)) {
            path[position] = v
            if (checkPosition(graph, &path, position+1) == true) {
                return true;
            }
            path[position] = -1;
        }
    }
    return false
}

func checkForHamiltonCycle(_ graph: [[Int]])->Bool {
    
    var path = [Int]()
    for _ in 0..<size {
        path.append(-1)
    }
    path[0] = 0
    
    if (checkPosition(graph, &path, 1) == false) {
        print("No Soluition")
        return false
    }
    print("Solution Found!")
    print("A Hamiltonian Cycle:")
    for i in 0..<size {
        print("\(path[i]+1) ", terminator:"")
    }
    print ("\(path[0]+1)")
    return true
}

let graph = [
    [0,1,1,1,1,0,0,0,1,0,0,0],// Vertex 1
    [1,0,1,0,0,0,1,1,1,0,0,0],// Vertex 2
    [1,1,0,0,1,1,1,0,0,0,0,0],// Vertex 3
    [1,0,0,0,1,0,0,0,1,1,0,1],// Vertex 4
    [1,0,1,1,0,1,0,0,0,0,0,1],// Vertex 5
    [0,0,1,0,1,0,1,0,0,0,1,1],// Vertex 6
    [0,1,1,0,0,1,0,1,0,0,1,0],// Vertex 7
    [0,1,0,0,0,0,1,0,1,1,1,0],// Vertex 8
    [1,1,0,1,0,0,0,1,0,1,0,0],// Vertex 9
    [0,0,0,1,0,0,0,1,1,0,1,1],// Vertex 10
    [0,0,0,0,0,1,1,1,0,1,0,1],// Vertex 11
    [0,0,0,1,1,1,0,0,0,1,1,0] // Vertex 12
]

if (checkForHamiltonCycle(graph)) {
    exit(0)
}
else {
    exit(-1)
}

