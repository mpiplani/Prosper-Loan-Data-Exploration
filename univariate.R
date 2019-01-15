
getwd()
ld <- read.csv('prosperLoanData.csv')
ld <- data.frame(ld)
summary(ld)
names(ld)
# Load the ggplot library
library(ggplot2)



# List of variables to be explored
# New data frame with only the columns of interest
ld2 <- data.frame(ld$ListingCreationDate,ld$ListingCategory..numeric., ld$IncomeRange, ld$CreditGrade, ld$Term, ld$LoanStatus, ld$ClosedDate, ld$BorrowerAPR,ld$LenderYield, ld$BorrowerState, ld$Occupation, ld$MonthlyLoanPayment, ld$StatedMonthlyIncome, ld$ProsperRating..Alpha., ld$ListingCategory..numeric.)
names(ld2)
summary(ld2)

# Univariate Plots Section


library(gridExtra)
p1 <- ggplot(aes(x = ld.Term), data = ld2) +
  geom_histogram()
p2 <- ggplot(aes(x = ld.BorrowerAPR), data = ld2) +
  geom_histogram()
p3 <- ggplot(aes(x = ld.LenderYield), data = ld2) +
  geom_histogram()
p4 <- ggplot(aes(x = ld.MonthlyLoanPayment), data = ld2) +
  geom_histogram()
p5 <- ggplot(aes(x = ld.StatedMonthlyIncome), data = ld2) +
  geom_histogram()
p6 <- ggplot(aes(x = ld.LoanStatus), data = ld2) +
  geom_bar()
p7 <- ggplot(aes(x = ld.Occupation), data = ld2) +
  geom_bar()
p8 <- ggplot(aes(x = ld.ProsperRating..Alpha.), data = ld2) +
  geom_bar()
grid.arrange(p1,p2,p3,p4,p5,p6,p7,p8)