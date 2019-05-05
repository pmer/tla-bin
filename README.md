# tla-bin

tla-bin is a wrapper around https://github.com/tlaplus/tlaplus that provides
command line binaries for pcal, tlc, and sany, making automation around TLA+
easy.

## Installation

```
$ git clone https://github.com/pmer/tla-bin.git
$ ./download_or_update_tla.sh
$ sudo ./install.sh
```

## Usage

### `pcal`, the PlusCal → TLA+ translator

```
$ pcal Euclid.tla
pcal.trans Version 1.8 of 18 Aug 2015
Labels added.
Parsing completed.
Translation completed.
New file Euclid.tla written.
New file Euclid.cfg written.
```

### `tlc`, the TLA+ model checker

```
$ tlc Euclid.tla
TLC2 Version 2.09 of 10 March 2017
Running in Model-Checking mode with 1 worker.
Parsing file Euclid.tla
Parsing file /var/folders/ml/qr7r1km5315bsm79wn1q60c00000gn/T/Integers.tla
Parsing file GCD.tla
Parsing file /var/folders/ml/qr7r1km5315bsm79wn1q60c00000gn/T/TLC.tla
Parsing file /var/folders/ml/qr7r1km5315bsm79wn1q60c00000gn/T/Naturals.tla
Parsing file /var/folders/ml/qr7r1km5315bsm79wn1q60c00000gn/T/Sequences.tla
Semantic processing of module Naturals
Semantic processing of module Integers
Semantic processing of module GCD
Semantic processing of module Sequences
Semantic processing of module TLC
Semantic processing of module Euclid
Starting... (2017-05-25 00:51:17)
Computing initial states...
Finished computing initial states: 1 distinct state generated.
Model checking completed. No error has been found.
  Estimates of the probability that TLC did not check all reachable states
  because two distinct states had the same fingerprint:
  calculated (optimistic):  val = 2.2E-19
  based on the actual fingerprints:  val = 8.7E-19
5 states generated, 4 distinct states found, 0 states left on queue.
The depth of the complete state graph search is 4.
Finished in 05s at (2017-05-25 00:51:23)
```

### `sany`, the TLA+ static analyzer

```
$ sany Euclid.tla

****** SANY2 Version 2.1 created 24 February 2014

Parsing file Euclid.tla
Parsing file /var/folders/ml/qr7r1km5315bsm79wn1q60c00000gn/T/Integers.tla
Parsing file GCD.tla
Parsing file /var/folders/ml/qr7r1km5315bsm79wn1q60c00000gn/T/TLC.tla
Parsing file /var/folders/ml/qr7r1km5315bsm79wn1q60c00000gn/T/Naturals.tla
Parsing file /var/folders/ml/qr7r1km5315bsm79wn1q60c00000gn/T/Sequences.tla
Semantic processing of module Naturals
Semantic processing of module Integers
Semantic processing of module GCD
Semantic processing of module Sequences
Semantic processing of module TLC
Semantic processing of module Euclid
```

### `tlatex`, the TLA+ pretty printer

```
$ tlatex Euclid.tla
tla2tex.TLA Version 1.0 created  12 Apr 2013
looking for file: Euclid
looking for file: Euclid.log
looking for file: Euclid
TLATeX dvi output written on Euclid.dvi.
Total execution time: 0.56 seconds
```
