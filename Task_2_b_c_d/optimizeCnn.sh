#!/bin/bash

# activate deepdiva environment
source activate deepdiva

if [ -d datasets/mnist ]
then
    echo dataset found!
else
    echo no dataset found in folder 'datasets/mnist'
fi

export PYTHONPATH=.

for i in 15 25
    do
    python template/RunMe.py --ignoregit --lr "0.001" --epochs "$i" --dataset-folder datasets/mnist --no-cuda --model-name PR_CNN --experiment-name cnn_bash --output-folder output/cnn_runs
    python template/RunMe.py --ignoregit --lr "0.005" --epochs "$i" --dataset-folder datasets/mnist --no-cuda --model-name PR_CNN --experiment-name cnn_bash --output-folder output/cnn_runs
    for ((j=1; j<10; j+=1))
        do
        echo "epochs "$i" lr 0.0$j"
        python template/RunMe.py --ignoregit --lr "0.0$j" --epochs "$i" --dataset-folder datasets/mnist --no-cuda --model-name PR_CNN --experiment-name cnn_bash --output-folder output/cnn_runs
        done
        echo "epochs "$i" lr 0.1"
        python template/RunMe.py --ignoregit --lr "0.1" --epochs "$i" --dataset-folder datasets/mnist --no-cuda --model-name PR_CNN --experiment-name cnn_bash --output-folder output/cnn_runs
    done