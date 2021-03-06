# Simulated Annealing
![CI](https://github.com/majjoha/simulated-annealing/workflows/CI/badge.svg)

<img width="38%" align="right" src="https://github.com/majjoha/simulated-annealing/raw/main/demo.gif">

This repository contains an implementation of the [simulated
annealing](https://en.wikipedia.org/wiki/Simulated_annealing) optimization
algorithm which is here used to solve the [traveling salesman
problem](https://en.wikipedia.org/wiki/Travelling_salesman_problem).

As the algorithm runs, it stores each step of the optimization process in a tour
history, and once the algorithm has finished execution, it will animate these
steps using SDL2.

## Requirements
* [GHC](https://www.haskell.org/ghc/)
* [`cabal-install`](https://cabal.readthedocs.io/en/3.6/index.html)
* [SDL](https://www.libsdl.org/index.php)

## Usage
* Build the project: `cabal build`
* Run the algorithm: `cabal run simulated-annealing`

To run the test suite, run `cabal new-test`.

## License
See [LICENSE](./LICENSE).
