#!/bin/bash

# activate deepdiva environment
source activate deepdiva

if [ -d datasets/mnist ]
then
    echo dataset found!
    export PYTHONPATH=.
    for i in 5 10 20
    do
    python template/RunMe.py --ignoregit --lr "0.001" --epochs "$i" --dataset-folder datasets/mnist --no-cuda --model-name PR_CNN --experiment-name cnn_bash --output-folder output/cnn_opt
    python template/RunMe.py --ignoregit --lr "0.05" --epochs "$i" --dataset-folder datasets/mnist --no-cuda --model-name PR_CNN --experiment-name cnn_bash --output-folder output/cnn_opt
    python template/RunMe.py --ignoregit --lr "0.1" --epochs "$i" --dataset-folder datasets/mnist --no-cuda --model-name PR_CNN --experiment-name cnn_bash --output-folder output/cnn_opt
    done
else
    echo no dataset found in folder 'datasets/mnist'
fi
