# 🗺 Simulated annealing
![CI](https://github.com/majjoha/simulated-annealing/workflows/CI/badge.svg)

This repository contains an implementation of the [simulated
annealing](https://en.wikipedia.org/wiki/Simulated_annealing) optimization
algorithm which is here used to solve the [traveling salesman
problem](https://en.wikipedia.org/wiki/Travelling_salesman_problem).

## Requirements
* [GHC](https://www.haskell.org/ghc/)
* [`cabal-install`](https://cabal.readthedocs.io/en/3.6/index.html)

## Usage
* Build the project: `cabal update`
* Run the algorithm: `cabal run simulated-annealing`

To run the test suite, run `cabal new-test`.

## License
See [LICENSE](./LICENSE).
