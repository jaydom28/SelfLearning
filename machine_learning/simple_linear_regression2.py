import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from sklearn import datasets, linear_model
from sklearn.metrics import mean_squared_error, r2_score

print("Reading the data...")
data = pd.read_csv("data/ex1data1.txt", header=None, names=["Population", "Profit"])

X, y = np.array(data["Population"]).reshape(-1, 1), np.array(data["Profit"]).reshape(-1, 1)

split_point = 15
X_train = X[:-split_point]
y_train = y[:-split_point]

X_test = X[-split_point:]
y_test = y[-split_point:]

model = linear_model.LinearRegression()
print("Training the model...")
model.fit(X_train, y_train)
print("Using the model to predict...")
predicted = model.predict(X_test)

print("Coefficients:", model.coef_)
print("MSE:", mean_squared_error(y_test, predicted))
print("r2 Score:", r2_score(y_test, predicted))

plt.scatter(X_test, y_test, color='black')
plt.plot(X_test, predicted, color='blue', linewidth=3)

plt.xticks(())
plt.yticks(())

plt.show()


"""
diabetes_X = diabetes_X[:, np.newaxis, 2]

diabetes_X_train = diabetes_X[:-20]
diabetes_X_test = diabetes_X[-20:]

diabetes_y_train = diabetes_y[:-20]
diabetes_y_test = diabetes_y[-20:]

model = linear_model.LinearRegression()
model.fit(diabetes_X_train, diabetes_y_train)

predicted_vals = model.predict(diabetes_X_test)
"""


