import numpy as np

def get_col(m, i):
    return np.array([[row[i]] for row in m])

def get_row(m, j):
    return m[j]

def get_unit_basis_vector(index, size):
    return np.array([1.0 if i == index else 0.0 for i in range(size)])

def generate_unit_basis_vectors(size):
    return [get_unit_basis_vector(i, size) for i in range(size)]

def add(x, y):
    return np.array([xi + yi for (xi, yi) in zip(x, y)])

def subtract(x, y):
    return np.array([xi - yi for (xi, yi) in zip(x, y)])

def scale(x, alpha):
    return np.array([xi * alpha for xi in x])

def dot(x, y):
    return sum([xi * yi for (xi, yi) in zip(x, y)])

def length(x):
    return np.sqrt(dot(x, x))

def norm(x):
    return length(x)

x = np.array([1, 2, 3])
y = np.array([7, 8, 9])

