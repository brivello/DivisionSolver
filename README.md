# Division Solver (swift)

Division Solver is a framework that solves arbitrary serial division problems represented as nested arrays of doubles.

```
[[16,[8,2],4],2,80]
```
represents:

```
[ [ 16 ÷ [ 8 ÷ 2 ] ÷ 4 ] ÷ 2 ÷ 80 ]
```

## Getting Started

To view the source code and run tests, clone the project from github:

git clone https://github.com/brivello/DivisonSolver.git

and then open the project in Xcode


The framework is also available for download if you would like to incorperate this library into existing projects.


## How To Use

The only external facing function is Array.divide( ). Just call it on your valid input array and it will return the correct soltution.

```
let solution = [[16,[8,2],4],2,80].divide()
```

This is possible to acheive by creating the ``` Divisible``` protocol and extending both ```Double``` and ```Array```

```
protocol Divisible {
    func divideBy(denominator: Divisible) -> Divisible
    func divide() -> Double
}
```
## Approach
### Advantages
    - clean, easy to use syntax
    - easily extended to add other data types (int, float etc.)
    - framework allows easy inclusion in any project
### Disadvantages
    - recursive design means additional memory allocated in stack for each element in the array.
    
## Complexity
```O(n)``` where n = number of doubles + number of arrays


