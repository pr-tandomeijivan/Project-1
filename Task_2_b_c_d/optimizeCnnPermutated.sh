#!/bin/bash

# activate deepdiva environment
source activate deepdiva

if [ -d datasets/mnist_permutated ]
then
    echo dataset found!
    export PYTHONPATH=.

    for i in 5 10 20
    do
    python template/RunMe.py --ignoregit --lr "0.001" --epochs "$i" --dataset-folder datasets/mnist_permutated --no-cuda --model-name PR_CNN --experiment-name cnn_opt_per --output-folder output/cnn_opt
    python template/RunMe.py --ignoregit --lr "0.05" --epochs "$i" --dataset-folder datasets/mnist_permutated --no-cuda --model-name PR_CNN --experiment-name cnn_opt_per --output-folder output/cnn_opt
    python template/RunMe.py --ignoregit --lr "0.1" --epochs "$i" --dataset-folder datasets/mnist_permutated --no-cuda --model-name PR_CNN --experiment-name cnn_opt_per --output-folder output/cnn_opt
    done
else
    echo no dataset found in folder 'datasets/mnist_permutated'
fi
