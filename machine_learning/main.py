import numpy as np

def calculate_slope(Xs, Ys):
    x_hat = np.mean(Xs)
    y_hat = np.mean(Ys)
    num, den = [], []
    for x, y in zip(Xs, Ys):
        num.append(((x-x_hat) * (y-y_hat)))
        den.append((x-x_hat)**2)
    return sum(num)/sum(den)

data = np.array([
    [2.0, 4, 8.5, 196],
    [2.4, 4, 9.6, 221],
    [1.5, 4, 5.9, 136],
    [3.5, 6, 11.1, 255],
    [3.5, 6, 10.6, 244],
    [3.5, 6, 10.0, 230],
    [3.5, 6, 10.1, 232],
    [3.7, 6, 11.1, 255],
    [3.7, 6, 11.6, 267],
    ])

theta_1 = calculate_slope([p[2] for p in data], [p[3] for p in data])
theta_0 = np.mean([x[3] for x in data]) - theta_1 * np.mean([x[0] for x in data])

print("y = %.2f + %.2fx" % (theta_0, theta_1))
