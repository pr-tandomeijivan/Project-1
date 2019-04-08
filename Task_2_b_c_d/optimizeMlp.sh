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

for i in 10 20 5
    do
    for h in 10 50 100
        do
        python template/RunMe.py --ignoregit --lr 0.001 --epochs "$i" --hidden-nodes "$h" --dataset-folder datasets/mnist --no-cuda --model-name MLP --experiment-name mlp --output-folder output/mlp
        python template/RunMe.py --ignoregit --lr 0.05 --epochs "$i" --hidden-nodes "$h" --dataset-folder datasets/mnist --no-cuda --model-name MLP --experiment-name mlp --output-folder output/mlp
        python template/RunMe.py --ignoregit --lr 0.1 --epochs "$i" --hidden-nodes "$h" --dataset-folder datasets/mnist --no-cuda --model-name MLP --experiment-name mlp --output-folder output/mlp
        done
    done