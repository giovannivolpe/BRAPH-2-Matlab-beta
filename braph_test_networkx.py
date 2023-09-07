import networkx as nx
import numpy as np

def in_out_assortativity(G):
    # Calculate the in-degree and out-degree sequences
    in_degrees = np.array([d for n, d in G.in_degree()])
    out_degrees = np.array([d for n, d in G.out_degree()])
    
    # Calculate average in-degree and out-degree
    avg_in_degree = np.mean(in_degrees)
    avg_out_degree = np.mean(out_degrees)
    
    # Initialize variables
    numerator = 0
    denominator = 0
    
    for i, j in G.edges():
        ki_in = G.in_degree(i)
        kj_out = G.out_degree(j)
        
        # Update numerator
        numerator += (G[i][j]['weight'] - ki_in * kj_out / G.number_of_edges()) * ki_in * kj_out
        
        # Update denominator
        denominator += (ki_in - avg_in_degree) * (kj_out - avg_out_degree)
        
    # Calculate in-out assortativity
    r = numerator / np.sqrt(denominator)
    
    return r

# Create a directed graph
G = nx.DiGraph()
G.add_edges_from([(1, 2), (2, 3), (2, 4), (3, 4), (4, 1)], weight=1)

# Calculate the in-out assortativity coefficient
r = in_out_assortativity(G)
print("In-Out Assortativity Coefficient:", r)
