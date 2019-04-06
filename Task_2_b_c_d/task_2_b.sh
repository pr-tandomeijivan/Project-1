#!/bin/bash

# activate deepdiva environemnt
source activate deepdiva

if [ -d datasets/mnist ]
then
    echo dataset found!
else
    echo no dataset found in folder 'datasets/mnist'
fi

export PYTHONPATH=.

python template/RunMe.py --ignoregit --dataset-folder datasets/mnist --no-cuda --model-name MLP --experiment-name MLP --output-folder output/mlp