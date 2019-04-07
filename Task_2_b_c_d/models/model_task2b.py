"""
CNN with 3 conv layers and a fully connected classification layer
PATTERN RECOGNITION EXERCISE:
Fix the three lines below marked with PR_FILL_HERE
"""

import torch.nn as nn


class Flatten(nn.Module):
    """
    Flatten a convolution block into a simple vector.

    Replaces the flattening line (view) often found into forward() methods of networks. This makes it
    easier to navigate the network with introspection
    """
    def forward(self, x):
        x = x.view(x.size()[0], -1)
        return x


class MLP(nn.Module):
    """
    Simple feed forward neural network with one hidden layer

    Attributes
    ----------
    expected_input_size : tuple(int,int)
        Expected input size (width, height)
    fc : torch.nn.Linear
        Final classification fully connected layer

    """

    def __init__(self, hidden_nodes=50, **kwargs):
        """
        Creates an MLP model from the scratch.

        Parameters
        ----------
        output_channels : int
            Number of neurons in the last layer
        input_channels : int
            Dimensionality of the input, typically 3 for RGB
        """
        super(MLP, self).__init__()

        # Here you have to put the expected input size in terms of width and height of your input image
        self.expected_input_size = (28, 28)

        self.fc_input = nn.Sequential(
            Flatten(),
            #  width and height of your input image and number of rgb channels, output channels
            nn.Linear(28 * 28 * 3, hidden_nodes)
        )

        self.fc_hidden = nn.Sequential(
            Flatten(),
            #  width and height of your input image and number of rgb channels, output channels
            nn.Linear(hidden_nodes, 10)
        )

    def forward(self, x):
        """
        Computes forward pass on the network

        Parameters
        ----------
        x : Variable
            Sample to run forward pass on. (input to the model)

        Returns
        -------
        Variable
            Activations of the fully connected layer
        """

        x = self.fc_input(x)
        x = self.fc_hidden(x)
        return x
