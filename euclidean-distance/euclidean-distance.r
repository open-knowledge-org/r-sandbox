# Install and load required packages if not already installed
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# Define the points
x1 <- -72.74015046752004
y1 <- 78.74014769710817
x2 <- -36.77164602033851
y2 <- 78.7401500471852

# Calculate the Euclidean distance
distance <- sqrt((x2 - x1)^2 + (y2 - y1)^2)
cat("Distance: ", distance, "\n")

# Create a data frame for plotting
data <- data.frame(
  x = c(x1, x2),
  y = c(y1, y2),
  label = c("Point 1", "Point 2")
)

# Generate the plot using ggplot2
plot <- ggplot(data, aes(x = x, y = y)) +
  geom_point(aes(color = label), size = 4) +                 # Plot the points
  geom_line(aes(x = c(x1, x2), y = c(y1, y2)), color = "green", linetype = "dashed", size = 1) +  # Draw the line
  geom_text(aes(label = label), vjust = -1) +                # Add point labels
  annotate("text", x = (x1 + x2) / 2, y = (y1 + y2) / 2,     # Display distance in the middle of the line
           label = paste("Distance =", round(distance, 2)), size = 5, color = "black") +
  xlim(min(x1, x2) - 10, max(x1, x2) + 10) +                 # Set plot limits for better view
  ylim(min(y1, y2) - 0.01, max(y1, y2) + 0.01) +
  labs(title = "Point Plot with Distance", x = "X", y = "Y") +  # Add labels and title
  theme_minimal()

# Display the plot
print(plot)
