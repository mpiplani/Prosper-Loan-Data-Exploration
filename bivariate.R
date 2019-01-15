# Bivariate Plots Section
ld <- read.csv('prosperLoanData.csv')
ld2 <- data.frame(ld$ListingCreationDate,ld$ListingCategory..numeric., ld$IncomeRange, ld$CreditGrade, ld$Term, ld$LoanStatus, ld$ClosedDate, ld$BorrowerAPR,ld$LenderYield, ld$BorrowerState, ld$Occupation, ld$MonthlyLoanPayment, ld$StatedMonthlyIncome, ld$ProsperRating..Alpha., ld$ListingCategory..numeric.)
library(ggplot2)


ggplot(aes(x = ld.StatedMonthlyIncome,y = ld.MonthlyLoanPayment), data = ld2) +
  geom_point(color = "blue", alpha = 0.2, position = 'jitter') +
  xlim(0, quantile(ld2$ld.StatedMonthlyIncome, 0.99)) +
  ylim(0, quantile(ld2$ld.MonthlyLoanPayment, 0.99)) +
  geom_smooth(color = "red")



ggplot(aes(x = ld.BorrowerAPR, 
           y = ld.MonthlyLoanPayment), data = ld2) +
  geom_point(alpha = 0.2, position = 'jitter') +
  coord_cartesian(xlim = c(0, 0.6)) +
  geom_smooth(color = "red")


ggplot(aes(x = ld.Term, 
           y = ld.MonthlyLoanPayment), data = ld2) +
  geom_point() +
  scale_x_continuous(breaks = c(12,36,60))


ggplot(aes(x = ld.StatedMonthlyIncome, 
           y = ld.LenderYield), data = ld2) +
  geom_point(alpha = 0.2, position = 'jitter') +
  xlim(0, quantile(ld2$ld.StatedMonthlyIncome, 0.99)) +
  ylim(0, 0.4) +
  geom_smooth()


ld2$ld.MonthlyPaymentOfIncome <- ld2$ld.MonthlyLoanPayment/ld2$ld.StatedMonthlyIncome
ggplot(aes(x = ld.Occupation, 
           y = ld.MonthlyPaymentOfIncome), data = subset(ld2, !is.na(ld.Occupation) & ld.Occupation == "Professional" | ld.Occupation == "Computer Programmer" | ld.Occupation == "Executive" | ld.Occupation == "Teacher" | ld.Occupation == "Sales - Retail" | ld.Occupation == "Administrative Assistant")) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0,0.5))

ggplot(aes(x = ld.LoanStatus, 
           y = ld.MonthlyLoanPayment), data = subset(ld2, !is.na(ld.LoanStatus) & ld.LoanStatus == "Completed" | ld.LoanStatus == "Current" | ld.LoanStatus == "Chargedoff" | ld.LoanStatus == "Defaulted" | ld.LoanStatus == "Past Due (1-15 days)" | ld.LoanStatus == "Past Due (31-60 days)")) +
  geom_boxplot()

ggplot(aes(x = ld.Occupation, 
           y = ld.MonthlyLoanPayment), data = subset(ld2, !is.na(ld.Occupation) & ld.Occupation == "Professional" | ld.Occupation == "Computer Programmer" | ld.Occupation == "Executive" | ld.Occupation == "Teacher" | ld.Occupation == "Sales - Retail" | ld.Occupation == "Administrative Assistant")) +
  geom_boxplot()

table(ld2$ld.Occupation)

ggplot(aes(x = ld.Occupation, 
           y = ld.StatedMonthlyIncome), data = subset(ld2, ld.StatedMonthlyIncome < 30000 & !is.na(ld.Occupation) & ld.Occupation == "Professional" | ld.Occupation == "Computer Programmer" | ld.Occupation == "Executive" | ld.Occupation == "Teacher" | ld.Occupation == "Sales - Retail" | ld.Occupation == "Administrative Assistant")) +
  geom_boxplot() +
  ylim(0,20000)

