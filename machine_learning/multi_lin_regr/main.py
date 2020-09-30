import matplotlib.pyplot as plt
import pandas as pd
import pylab as pl
import numpy as np

from sklearn import linear_model

df = pd.read_csv("FuelConsumption.csv")
print("Loading data...")
print(df.head())
print("\n\n")

# get just the features to use for regression
print("Getting just the features we want.")
cdf = df[["ENGINESIZE", "CYLINDERS", "FUELCONSUMPTION_CITY", "FUELCONSUMPTION_HWY", "FUELCONSUMPTION_COMB", "CO2EMISSIONS"]]
print(cdf.head(9))


### Plotting Emission values with respect to engine size ###
print("Plotting emission values with respect to engine size")
plt.scatter(cdf.ENGINESIZE, cdf.CO2EMISSIONS, color="blue")
plt.xlabel("Engine Size")
plt.ylabel("Emission")
plt.show()

mask = np.random.rand(len(df)) < 0.8
train = cdf[mask]
test = cdf[~mask]

plt.scatter(train.ENGINESIZE, train.CO2EMISSIONS, color="blue")
plt.xlabel("Engine size")
plt.ylabel("Emission")
plt.show()


model = linear_model.LinearRegression()
target_features = ["ENGINESIZE", "CYLINDERS", "FUELCONSUMPTION_COMB"]
x = np.asanyarray(train[target_features])
y = np.asanyarray(train[["CO2EMISSIONS"]])
print("Training the model on parameters,", target_features)
model.fit(x, y)
print("Coefficients:", model.coef_)


### GET PREDICTIONS FROM THE MODEL ###
predictions = model.predict(test[target_features])
x = np.asanyarray(test[target_features])
y = np.asanyarray(test[["CO2EMISSIONS"]])
print("Residual sum of squares: %.2f" % np.mean(predictions-y) ** 2)
print("Variance score: %.2f" % model.score(x, y))


### GET PREDICTIONS USING THE ALTERNATIVE FEATURES ###
model = linear_model.LinearRegression()
target_features = ["ENGINESIZE", "CYLINDERS", "FUELCONSUMPTION_CITY", "FUELCONSUMPTION_HWY"]
x = np.asanyarray(train[target_features])
y = np.asanyarray(train["CO2EMISSIONS"])
print("Training the model on parameters,", target_features)
model.fit(x, y)
print("Coefficients:", model.coef_)

### GET PREDICTIONS FROM THE MODEL ###
predictions = model.predict(test[target_features])
x = np.asanyarray(test[target_features])
y = np.asanyarray(test[["CO2EMISSIONS"]])
print("Residual sum of squares: %.2f" % np.mean(predictions-y) ** 2)
print("Variance score: %.2f" % model.score(x, y))



