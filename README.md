# tla-bin

tla-bin is a wrapper around https://github.com/tlaplus/tlaplus that provides
command line binaries for pcal, tlc, tlatex and sany, making automation around TLA+
easy.  Also provides a binary that starts the TLA+ REPL.

## Installation

```
$ git clone https://github.com/pmer/tla-bin.git
$ ./download_or_update_tla.sh
$ sudo ./install.sh
```

The `install.sh` scripts takes an optional location argument.  By default,
binaries and the tla jar file are installed below `/usr/local`.

## Usage

### `pcal`, the PlusCal → TLA+ translator

```
$ pcal Euclid.tla
pcal.trans Version 1.11 of 31 December 2020
Labels added.
Parsing completed.
Translation completed.
New file Euclid.tla written.
New file Euclid.cfg written.
```

### `tlc`, the TLA+ model checker

```
TLC2 Version 2.16 of 31 December 2020 (rev: cdddf55)
Running breadth-first search Model-Checking with fp 70 and seed -2731419115466680819 with 1 worker on 2 cores with 444MB heap and 64MB offheap memory [pid: 1039] (Linux 4.19.0-18-amd64 amd64, Debian 11.0.12 x86_64, MSBDiskFPSet, DiskStateQueue).
Parsing file /home/pdm/tla-bin/tla/MC.tla
Parsing file /home/pdm/tla-bin/tla/Euclid.tla
Labels added.
Parsing file /tmp/TLC.tla
Parsing file /tmp/Integers.tla
Parsing file /home/pdm/tla-bin/GCD.tla
Parsing file /tmp/Naturals.tla
Parsing file /tmp/Sequences.tla
Parsing file /tmp/FiniteSets.tla
Semantic processing of module Naturals
Semantic processing of module Integers
Semantic processing of module PaulGCD
Semantic processing of module Sequences
Semantic processing of module FiniteSets
Semantic processing of module TLC
Semantic processing of module PaulEuclid
Semantic processing of module MC
Starting... (2021-11-28 16:13:57)
Computing initial states...
Finished computing initial states: 1 distinct state generated at 2021-11-28 16:13:57.
Model checking completed. No error has been found.
  Estimates of the probability that TLC did not check all reachable states
  because two distinct states had the same fingerprint:
  calculated (optimistic):  val = 2.7E-19
6 states generated, 5 distinct states found, 0 states left on queue.
The depth of the complete state graph search is 5.
The average outdegree of the complete state graph is 1 (minimum is 0, the maximum 1 and the 95th percentile is 1).
Finished in 01s at (2021-11-28 16:13:57)
```

### `sany`, the TLA+ static analyzer

```
$ sany Euclid.tla

****** SANY2 Version 2.1 created 24 February 2014

Parsing file /home/pdm/tla-bin/Euclid.tla
Labels added.
Parsing file /tmp/Integers.tla
Parsing file /home/pdm/tla-bin/GCD.tla
Parsing file /tmp/TLC.tla
Parsing file /tmp/Naturals.tla
Parsing file /tmp/Sequences.tla
Parsing file /tmp/FiniteSets.tla
Semantic processing of module Naturals
Semantic processing of module Integers
Semantic processing of module GCD
Semantic processing of module Sequences
Semantic processing of module FiniteSets
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
Total execution time: 0.38 seconds
```

### `tlarepl`, the TLA+ REPL

```
$ tlarepl
Welcome to the TLA+ REPL!
TLC2 Version 2.16 of Day Month 20??
Enter a constant-level TLA+ expression.
(tla+)
```
