import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

from sklearn.preprocessing import PolynomialFeatures
from sklearn import linear_model
from sklearn.metrics import r2_score

from .. import constants

SHOW_PLOTS = False
df = pd.read_csv(constants.get_data_path("FuelConsumption.csv"))

### GET ONLY THE FEATURES WE WANT ###
target_features = ["ENGINESIZE", "CYLINDERS", "FUELCONSUMPTION_COMB", "CO2EMISSIONS"]
cdf = df[target_features]

if SHOW_PLOTS:
    plt.scatter(cdf.ENGINESIZE, cdf.CO2EMISSIONS, color="blue")
    plt.xlabel("Engine Size")
    plt.ylabel("Emission")
    plt.show()

msk = np.random.rand(len(df)) < 0.8
train = cdf[msk]
test = cdf[~msk]

train_x = np.asanyarray(train[["ENGINESIZE"]])
train_y = np.asanyarray(train[["CO2EMISSIONS"]])
test_x = np.asanyarray(test[["ENGINESIZE"]])
test_y = np.asanyarray(test[["CO2EMISSIONS"]])

poly = PolynomialFeatures(degree=2)
train_x_poly = poly.fit_transform(train_x)

print("Training the model")
model = linear_model.LinearRegression()
train_y_ = model.fit(train_x_poly, train_y)
print("Coefficients:", model.coef_)
print("Intercept:", model.intercept_)
if SHOW_PLOTS:
    plt.scatter(train.ENGINESIZE, train.CO2EMISSIONS, color="blue")
    model_Xs = np.arange(0.0, 10.0, 0.1)
    model_Ys = model.intercept_[0] + model.coef_[0][1]*model_Xs \
               + model.coef_[0][2] * np.power(model_Xs, 2)
    plt.plot(model_Xs, model_Ys, '-r')
    plt.xlabel("Engine size")
    plt.ylabel("Emission")
    plt.show()

print("Using the model to predict")
test_x_poly = poly.fit_transform(test_x)
test_y_ = model.predict(test_x_poly)
print("Mean Absolute Error: %.2f" % np.mean(np.absolute(test_y_ - test_y)))
print("Residual sum of squares (MSE): %.2f" % np.mean((test_y_ - test_y) ** 2))
print("R2-score: %.2f" % r2_score(test_y_, test_y))





