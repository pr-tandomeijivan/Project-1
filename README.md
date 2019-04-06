# Group Work Pattern Regocognition 2019

## Group name: Tandomeijivan
```
Members:
Tanja Küry
Jiyoung Lee
Dominik Seliner
Ivan Kravchenko
Mei Ling Wong
```
-----------------------------------------------------------------------------------------------------------------

# Instructions:

## Task 2a)
File Format: .ipynb
Use Jupyter Notebook to run the SVM.

## Task 2b)


## Task 2c
1) Prepare:
``` shell
source activate deepdiva
```

2) Dataset:  
Add the mnist folder provided on ilias (in mnist-png-format) to the dataset folder

2) Run Model:
``` shell
python template/RunMe.py --dataset-folder datasets/mnist --no-cuda --ignoregit --model-name PR_CNN
```

3) Results on Tensorboard (Visualization): 
``` shell
tensorboard --logdir output --port 9009
```

(Other outputs with different learning rate and epoch values from us are also available in the output folder and the plots can be seen on the tensorboard)

## Task 2d

