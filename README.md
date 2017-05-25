# tla-bin

A wrapper around https://github.com/tlaplus/tlaplus that provides command line
binaries for tlc, pcal, and sany.

## Installation

```
$ git clone https://github.com/pmer/tla-bin.git
$ ./download_or_update_tla.sh
$ sudo ./install.sh
```

## Usage

`pcal` runs the PlusCal → TLA+ translator on a TLA+ file. It edits the file in
the process of running.

`sany` is a static analyzer for TLA+.

`tlc` is the TLA+ model checker.

```
$ pcal Euclid.tla
$ sany Euclid.tla
$ tlc Euclid.tla
```
