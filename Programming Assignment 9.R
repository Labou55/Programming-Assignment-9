
# Name: Labour Modi
# Course: COP2073C
# Assignment: Module 9
# Date: November 9, 2026

# Step 1: Plot the data

data(mtcars)

plot(mtcars$wt, mtcars$mpg,
     main = "Fuel Efficiency vs. Vehicle Weight",
     xlab = "Vehicle Weight (Thousands of Pounds)",
     ylab = "Miles Per Gallon",
     pch = 19,
     col = "blue")

# Step 2: Fit the linear regression model

model <- lm(mpg ~ wt, data = mtcars)

# Step 3: Add the regression line

abline(model, col = "red", lwd = 2)

# Step 4: Display regression results

summary(model)

# Calculate the confidence interval

confint(model, level = 0.95)

# Extract and display the slope and p-value

slope <- coef(model)["wt"]
p_value <- summary(model)$coefficients["wt", "Pr(>|t|)"]

cat("Estimated slope:", slope, "\n")
cat("P-value:", p_value, "\n")

# Step 5: Create a new data frame for a 6,000-pound vehicle

new_car <- data.frame(wt = 6)

# Step 6: Predict MPG with a 95% prediction interval

prediction <- predict(model,
                      newdata = new_car,
                      interval = "prediction",
                      level = 0.95)

cat("Predicted MPG and 95% Prediction Interval:\n")
print(prediction)

# Step 7: Evaluate the prediction

cat("Vehicle weight range in mtcars:\n")
print(range(mtcars$wt))

cat("A 6,000-pound vehicle is outside the dataset range.")
cat(" This prediction involves extrapolation.\n")
cat("Interpret the prediction with caution.\n")

