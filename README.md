For my Masters' thesis, I am working on the application of machine learning models to predict the percolation threshold of large networks.
The percolation threshold is an essential indicator of the resilience of a network to random attacks. However, computing the percolation
threshold is computationally expensive, and the existing methods for estimating the percolation threshold are prone to significant errors.
I plan to use machine learning algorithms to estimate the percolation threshold of a given network as a function of various statistical
and structural properties that affect the percolation threshold (like mean, variance, range, clustering coefficient, planarity, etc.).
I have created a dataset of over 2000 real and synthetic networks; the data-set consists of statistical and structural properties that
can affect the percolation threshold, as features and the percolation threshold of networks, as the output attribute. I aim to apply a
shallow neural network regression model to this data-set, which would significantly reduce the cost of estimating the percolation threshold
of a network and increase the accuracy of the estimate. Further analysis of the model will also help in the identification of the features
(structural and statistical properties) that give rise to resilient networks.

Following is the description of the codes used-

file2net.m - To convert a .txt file containing the edge list to an adjacency matrix for the corresponding unweighted undirected network

gensynnet.net - To generate networks following the network evolution process described in the paper, 'Uncovering the role of elementary 
processes in network evolution' by Prof. A-L Barabasi

listdis.m - To find the size of the second largest component of a graph

listdismantle.m - To find the sizes of all the disconnected components of a graph

makeER.m - To generate E-R networks of given size and mean degree

makePR.m - To generate networks based on the preferential attachment algorithm

percolate.m - To find percolation threshold of a network (by susceptibility method)

percolate2.m - To find percolation threshold of a network (by second largest component method)

preprocess.m - To remove directed edges, self-loops, and other irregularities

SW.m - To generate small-world networks
