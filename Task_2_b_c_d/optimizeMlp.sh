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

for i in 10 20 30
    do
    for h in 10 50 100
        do
        echo "epochs "$i" hidden_nodes "$h" lr 0.001"
        python template/RunMe.py --ignoregit --lr 0.001 --epochs "$i" --dataset-folder datasets/mnist --no-cuda --model-name PR_CNN --experiment-name cnn_bash --output-folder output/mlp
        echo "epochs "$i" hidden_nodes "$h" lr 0.005 "
        python template/RunMe.py --ignoregit --lr 0.005 --epochs "$i" --hidden_nodes "$h" --dataset-folder datasets/mnist --no-cuda --model-name PR_CNN --experiment-name cnn_bash --output-folder output/mlp
        for ((j=1; j<10; j+=1))
            do
            echo "epochs "$i" hidden_nodes "$h" lr "0.0$j""
            python template/RunMe.py --ignoregit --lr "0.0$j" --epochs "$i" --dataset-folder datasets/mnist --no-cuda --model-name PR_CNN --experiment-name cnn_bash --output-folder output/mlp
            done
        done
    done