# SAS® Log Extractor

A tiny Java App that is intended to extract a SAS Program (actual source code) from a SAS Log. Was used as a part of the *toy-model* source code for SAS GF 2018 paper -- [SASLint: A SAS® Program Checker](https://files.aievolution.com/sas1801/events/19419/1000_Khorlo_2543_0320_051314.pdf).

## How to use

### MacOS/\*nix:

```sh
# Install ANTLR somewhere (can be any location)
cd /usr/local/lib
curl -O http://www.antlr.org/download/antlr-4.7.1-complete.jar
export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.7.1-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'

# Clone this repo somewhere
git clone https://github.com/sspkmnd/sas-log-extractor.git
cd sas-log-extractor

# Compile grammar and resulting Java
antlr4 SASLog.g4
javac *.java

# Use SAS Log Extractor
java LogExtractor sas-log-extractor-demo.log | tee sas-log-extracted.sas
java LogExtractor -mprint -source2 sas-log-extractor-demo.log | tee sas-log-extracted-mprint-source2.sas
```

### Windows 

¯\\\_(ツ)\_/¯

Do the same but using Windows command line utility be that cmd/powershell/etc. To install ANTLR follow [this guide](https://github.com/antlr/antlr4/blob/master/doc/getting-started.md).


1. Install ANTLR somewhere following the guide:

## Demo

[![asciicast](https://asciinema.org/a/dwybgV2EuYdTof47ZlRU4DqYk.png)](https://asciinema.org/a/dwybgV2EuYdTof47ZlRU4DqYk)

## Disclaimer

This utility was tested on a very basic logs and definitely not capable of extracting from arbitrary logs produced by SAS. If you found an example which is handled incorrectly please submit [an issue](https://github.com/sspkmnd/sas-log-extractor/issues/new) with details.

The utility is published temporarily for SAS-L question and will be become a part of [saslint](https://saslint.com/) when it will be released.
