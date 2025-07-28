#!/bin/bash

echo "Compiling Java FinancialFileReader..."
javac FinancialFileReader.java

if [ $? -eq 0 ]; then
    echo "Compilation successful. Running program..."
    echo ""
    java FinancialFileReader
else
    echo "Compilation failed!"
    exit 1
fi
