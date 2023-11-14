### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ e86c095f-b440-4935-9f60-9cdcd54ffb43
html"""
	<p align=left style="font-size:32px; font-family:family:Georgia"> <b> FINC 672: Workshop in Finance - Empirical Methods</b> <p>
	"""

# ╔═╡ ce1be57b-3d94-4f28-a307-8bafc01d9651
	html"""
	<p style="padding-bottom:1cm"> </p>
	<div align=center style="font-size:25px; font-family:family:Georgia"> FINC-672: Workshop in Finance - Empirical Methods </div>
	<p style="padding-bottom:1cm"> </p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> <b> Assignment 01 - Julia Fundamentals </b> <p>
	<p style="padding-bottom:1cm"> </p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> Spring 2023 <p>
	<p style="padding-bottom:0.5cm"> </p>
	<div align=center style="font-size:20px; font-family:family:Georgia"> Prof. Matt Fleckenstein </div>
	<p style="padding-bottom:0.05cm"> </p>
	<div align=center style="font-size:20px; font-family:family:Georgia"> University of Delaware, 
	Lerner College of Business and Economics </div>
	<p style="padding-bottom:0.5cm"> </p>
	"""

# ╔═╡ 83806080-8c00-11ec-0f46-01e9cff3af6f
vspace

# ╔═╡ 99902ed5-59aa-4984-a2d0-f31bfa28da34
md"""
*Note: The exercises below are adapted from Kamiński, Bogumił (2023). Julia for Data Analysis. [https://www.manning.com/books/julia-for-data-analysis](https://www.manning.com/books/julia-for-data-analysis)*
"""

# ╔═╡ df2605a4-7651-403b-9d1d-8b1fd4b42df1
vspace

# ╔═╡ 1c14adad-358d-469a-9f8a-697710ae9e0e
md"""
### Exercise 1
"""

# ╔═╡ 9609264e-b4ce-4390-adc0-7821175b7e60
md"""
Suppose you would like to calculate the highest and the lowest price of a stock from a time-series of stock prices. Write a function `highlow` that takes any vector and returns the difference between the largest and the smallest element in this vector.
"""

# ╔═╡ f499ea41-c1ce-4ad1-9579-1aae4a535a58
#Type your solution here




# ╔═╡ 669f5626-f17f-4b58-abb8-0dcb25c14895
vspace

# ╔═╡ 3580b62d-fe8a-499c-8551-cac1a81d1b55
md"""
### Exercise 2
"""

# ╔═╡ f6c7b4fa-ec5d-4f16-816f-0c0327bf76b7
md"""
Create a matrix of shape 2x3 containing numbers from 1 to 6 (fill the matrix columnwise with consecutive numbers). Next calculate sum, mean and standard deviation of each row and each column of this matrix. This example illustrates standard calculations that we need later in the course when we analyze stock prices, stock portfolios, etc.
"""

# ╔═╡ 0370fa97-a539-4f44-b8f5-155e8c430e74
#Type your solution here




# ╔═╡ 14422ed6-189b-4c88-aa9d-a6798ca25138
vspace

# ╔═╡ d803b6e7-5ea0-4e48-99a5-00cebe720621
md"""
### Exercise 3
"""

# ╔═╡ f94c5f9c-b943-4d5e-8dfc-ab7f03c0a2fc
md"""
For each column of the matrix created in Exercise 2 compute its range (i.e., the difference between maximum and minimum element stored in it).

*Hint: Use a `comprehension` and `eachcol`.*
"""

# ╔═╡ 45c59b5e-6b7b-4b7c-97fc-65855792f9fe
#Type your solution here




# ╔═╡ 5263fd14-1e9a-465e-8e24-1d7a5cd5f343
vspace

# ╔═╡ c6fcd024-9691-42cc-964e-b027ba211b37
md""" 
### Exercise 4
"""

# ╔═╡ c75cb5d1-d0d3-488c-8199-c5f75b11bb83
md"""
Write a function that accepts two vectors (of stock prices, for instance) and returns true if they have equal length and otherwise returns false.
"""

# ╔═╡ 1fc81663-edaf-46f1-ab94-bf4960a84648
#Type your solution here




# ╔═╡ 994a949e-8139-422b-8d63-09f38d6341a1
vspace

# ╔═╡ 05cef98d-14dd-4ada-9bf1-62e4a5d48444
md"""
### Exercise 5
"""

# ╔═╡ 300ef710-c93b-4448-b834-d4488f73c69c
md"""
Create a vector containing named tuples representing elements of a 4x4 grid. So the first element of this vector should be (x=1, y=1) and last should be (x=4, y=4). Store the vector in variable `v`. This technique is useful for storing information about pairs of stocks, for instance.

*Hint: use a `comprehension` to solve this question.*
"""

# ╔═╡ 6784b1e6-4971-4245-b382-1518900eca51
#Type your solution here




# ╔═╡ 590427f3-22e9-4027-aca2-8b4627330807
vspace

# ╔═╡ 11eec2ac-ceb9-4a00-b0c0-b7670c9fdf18
md"""
### Exercise 6
"""

# ╔═╡ eccd3fe4-42e3-4f7d-a2da-8e1287c1f11a
md"""
Take a vector s = ["1.5", "2.5", missing, "4.5", "5.5", missing] and parse strings stored in it as Float64, while keeping missing values unchanged.

*Hint: use `passmissing` from the Missings.jl package and `parse`.*
"""

# ╔═╡ b73de587-ae67-4613-acbc-c8584a9b530f
#Type your solution here




# ╔═╡ e7b61bc1-5358-488c-b725-89c4e70197ec
vspace

# ╔═╡ b529a747-0969-49f8-88e4-0e7f146cea8e
md"""
### Exercise 7
"""

# ╔═╡ bda85a0b-8704-45a5-a655-d4ffe97827b1
md"""
Print to the terminal all days in January 2023 that are Mondays.

*Hint: to check whether a Date is a Monday, use `dayofweek(Date)==1`.*
"""

# ╔═╡ 27f0cef0-9897-4f07-8d54-b898b62b5bad
#Type your solution here




# ╔═╡ 3103f40d-ea2e-4d0a-b333-75306a85d423
vspace

# ╔═╡ de545d82-1c47-40ef-bb5e-baa4827d572a
md"""
### Exercise 8
"""

# ╔═╡ 60e3605d-8571-453f-8646-87bfb07bae14
md"""
Compute the dates that are one month later than January 15, 2020, February 15 2020, March 15, 2020, and April 15, 2020. How many days pass during this one month. Print the results to the screen.

*Hint: use String interpolation and `println`.*
"""

# ╔═╡ db201906-acb3-4850-b0ad-97f0360abacf
#Type your solution here




# ╔═╡ a5e8ddd3-e9fa-48d5-9254-ce515786a63c
vspace

# ╔═╡ 6f2da2f0-d61c-4226-b6a8-c7772b7bc0db
md"""
### Exercise 9
"""

# ╔═╡ c67dcbb9-fcf0-445b-9d08-e65938a2da88
md"""
Take a vector v = [1.5, 2.5, missing, 4.5, 5.5, missing] and replace all missing values in it by the mean of the non-missing values. *Note: this technique is useful when we are working financial market data with missing observations.*
"""

# ╔═╡ 4e63012c-7b52-41ad-a1fb-8f03d5fd48d3
#Type your solution here




# ╔═╡ 1034efe3-0b04-4aef-bf72-c0eeab75d46c
vspace

# ╔═╡ a27bbc12-e20f-46d0-9e27-78e51d06a5e3
md"""
### Exercise 10
"""

# ╔═╡ e68b67db-65f6-4106-86b7-037ddb19cf42
md"""
Write a function that tries to parse a string as an integer. If it succeeds it should return the integer, otherwise it should return 0 but print an error message. Test whether your function works. *Note: this technique is useful for converting financial market data that is stored in text form to numeric data that can be used in analyses.*
"""

# ╔═╡ ec8d7c70-4766-41f6-a59f-7e583a47d2ea
#Type your solution here




# ╔═╡ 92d9dd36-fd12-44ce-8950-d771738b1d54
vspace

# ╔═╡ 11d3d256-fd44-4708-b388-537ebfd6b413
md"""
### Exercise 11
"""

# ╔═╡ 7312423e-a373-4848-a239-f8fa3506de43
md"""
Given a vector m = [missing, 1, missing, 3, missing, missing, 6, missing]. Use linear interpolation for filling missing values. For the extreme values use nearest available observation (you will need to consult Impute.jl documentation to find all required functions). *Note: this technique is useful when we are working with missing financial market data and we think that missing data between any given observations is likely somewhere between the data points we actually observe.*
"""

# ╔═╡ 154ebc56-81db-4456-a7eb-8e797e33c5c4
#Type your solution here




# ╔═╡ 7e058bd0-2c50-4acf-8fad-73a7205b7d1c
vspace

# ╔═╡ eb12000d-1b58-4399-8bc0-1cb795e22393
md"""
### Exercise 12
"""

# ╔═╡ cab48b19-435d-4750-918a-77bd19a34122
md"""
Below are two time series of monthly returns for the period from January 2010 to November 2022. The first column is the monthly returns on a global equity index (excluding the U.S.). The second column shows the monthly returns of the portfolio of U.S. stocks. The unit of the returns data is in percent. *The data are from 
[AQR](https://www.aqr.com/Insights/Datasets/Betting-Against-Beta-Equity-Factors-Monthly)*.
1. Load the returns data loaded into a matrix (or a DataFrame). 
2. Create a scatterplot of the data.
3. Consult the documentation of the Plots.jl package (see [Link](https://docs.juliaplots.org/stable/)) and find out how you can add a regression line to the scatter plot. Add the regression line to the scatterplot.
"""

# ╔═╡ a336149d-8d29-44d1-9e7e-6e81f83f0ef0
Foldable("Returns Data",md"""
	Global  US
	-4.09	-3.96
	-0.19	3.76
	6.24	6.59
	-0.56	2.15
	-10.47	-7.93
	-0.76	-5.34
	8.54	7.16
	-2.84	-4.20
	9.92	9.31
	3.52	4.02
	-3.82	0.78
	7.73	7.01
	1.80	1.85
	2.93	4.19
	-1.03	0.25
	5.01	2.70
	-2.50	-1.65
	-1.74	-2.07
	-1.24	-2.17
	-8.45	-5.80
	-10.69	-9.18
	9.63	11.62
	-5.33	-0.85
	-1.11	0.24
	6.19	5.52
	5.87	4.20
	-1.11	1.96
	-1.33	-0.62
	-11.11	-7.06
	5.54	3.68
	0.85	1.10
	2.56	2.85
	3.62	2.78
	0.92	-1.41
	1.88	0.46
	3.12	1.30
	5.07	5.23
	-0.92	0.65
	0.44	3.44
	4.31	1.27
	-2.00	1.87
	-3.94	-1.76
	5.18	5.47
	-0.76	-2.49
	7.18	3.80
	3.25	3.99
	0.74	2.37
	1.28	2.63
	-3.37	-3.09
	5.13	4.70
	-0.37	0.48
	0.78	0.31
	1.79	1.92
	1.55	3.13
	-1.26	-2.00
	0.14	3.98
	-4.40	-2.86
	-1.29	1.81
	0.88	2.04
	-2.80	-0.39
	-0.08	-3.27
	5.53	5.80
	-1.01	-1.17
	5.67	1.27
	-0.60	0.74
	-2.54	-1.93
	0.20	0.79
	-7.04	-6.09
	-4.17	-3.53
	7.16	7.26
	-1.60	0.14
	-1.11	-2.58
	-7.24	-5.76
	-1.09	0.34
	7.52	7.32
	2.77	1.56
	-0.88	1.17
	-2.86	0.28
	4.93	3.87
	0.40	0.25
	1.59	0.33
	-1.92	-2.18
	-1.87	4.22
	2.38	1.86
	3.40	2.27
	1.38	2.95
	2.41	0.16
	2.30	0.64
	3.65	0.72
	0.28	1.13
	3.33	2.01
	0.49	0.04
	2.30	2.46
	1.60	1.70
	1.01	2.62
	1.86	1.27
	5.36	4.70
	-4.64	-4.27
	-1.46	-1.98
	1.56	0.52
	-1.37	2.53
	-1.87	0.41
	1.33	2.93
	-1.83	2.82
	0.44	-0.06
	-8.97	-7.69
	0.50	1.52
	-5.25	-9.47
	6.66	9.07
	2.29	3.25
	0.52	0.98
	2.47	3.58
	-5.18	-6.36
	5.27	6.78
	-1.27	0.93
	-2.88	-2.23
	2.22	1.46
	3.13	1.63
	1.10	3.46
	3.89	2.81
	-2.56	-0.34
	-7.96	-8.12
	-13.34	-14.94
	7.45	13.51
	4.07	5.42
	4.08	2.72
	3.64	5.64
	5.47	6.98
	-2.43	-3.58
	-2.26	-2.25
	12.86	12.79
	4.63	4.63
	0.18	-0.21
	2.13	3.01
	1.45	3.23
	3.35	4.82
	2.73	0.88
	-1.05	2.36
	-1.27	1.00
	1.46	2.58
	-2.98	-4.12
	2.45	6.62
	-4.67	-1.94
	3.68	3.39
	-4.77	-5.94
	-1.99	-2.13
	0.25	3.32
	-6.24	-8.96
	0.69	-0.29
	-8.12	-8.78
	3.50	8.95
	-4.17	-3.75
	-10.34	-9.46
	2.63	7.79
	11.60	4.79

""")

# ╔═╡ ebbc453e-cc29-40dd-87f9-c3cdf5d5adeb
#Type your solution to part 1 here




# ╔═╡ 43e4fbf2-fffc-4478-9ec0-238bb6c1b2c1
#Type your solution to part 2 and 3 here




# ╔═╡ b2eccd80-f3f4-497a-86d7-0df802dc8467
vspace

# ╔═╡ db8f0eb9-362e-420e-a01f-90b5567aeab4
md"""
### Exercise 13
"""

# ╔═╡ 0f67af16-7f25-450c-903a-335f993a0362
md"""
The filter function allows you to select some values of an input collection. Check its documentation first. Next, use it to keep from the vector `v` from Exercise 5 only elements whose sum is even. *Note this technique is useful to select a subset of stocks satisfying certain criteria, e.g. small-cap, large-cap etc.*
- *Hint: To get help on the filter function write `?filter`.*
"""

# ╔═╡ 9a5bfb7f-a6a2-4b11-9f13-3475d61983cd
#Type your solution here




# ╔═╡ 17e71f9a-c323-4b35-bb2d-ffd65d2d83eb
vspace

# ╔═╡ 8d5acbff-969d-4d81-8588-71fb6841df9a
md"""
### Exercise14
"""

# ╔═╡ 67960933-a009-43c7-8774-b4cff51d5046
md"""
Write a function that takes a number `n`. Next it generates two independent random vectors of length `n` and returns their correlation coefficient. Run this function 10000 times for `n` equal to 10, 100, 1000, and 10000. Create a plot with four histograms of distribution of computed Pearson correlation coefficient. *Note: This technique is a a first step into simulating stock prices, for instance.*
- *Hint: Check in the Plots.jl package which function can be used to plot histograms.*
"""

# ╔═╡ 648ba0f6-3514-4072-8fac-c9062d1eb177
#Type your solution here




# ╔═╡ 52503992-9d0d-4c93-8eb8-15a4712082d4
vspace

# ╔═╡ 3eecc376-f59b-47a6-9c3e-82793d5f3b32
md"""
### Exercise 15
"""

# ╔═╡ b2fcedd0-1a3e-4812-9e47-879a4d044113
md"""
Write a function that takes a vector of integer values and returns a dictionary giving information how many times each integer was present in the passed vector.
*Note: this technique is useful to list the strike prices from a time-series of options.*
- Test this function on vectors v1 = [1, 2, 3, 2, 3, 3], v2 = [true, false], and v3 = 3:5.
"""

# ╔═╡ 8b312e78-3ff6-4244-9ab9-da23ac60389b
#Type your solution here




# ╔═╡ 383fe559-803f-4155-8bd8-a334b463b123
vspace

# ╔═╡ 34ed1291-d607-4e18-ad29-f9cb5b77d53b
md"""
### Exercise 16
"""

# ╔═╡ 09f170a0-1edf-4f75-882f-29eb5178f63a
md"""
Download the file https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data as iris.csv to your local folder.
"""

# ╔═╡ 3cfa4679-85d6-48fd-b73e-fd4dc4fdcba1
#Type your solution here




# ╔═╡ d43bf9aa-f192-4870-b1a8-5bd71949c4ff
vspace

# ╔═╡ 57ac236b-eb12-4483-b19d-90327c60d14b
vspace

# ╔═╡ 60b54e82-4bb8-4baf-b8ba-af80232b142f
md"""
### Exercise 17
"""

# ╔═╡ a999374d-7f81-4cc7-9758-7d0109b17ead
md"""
1.) Create a DataFrame `df` of stock returns and volatilities as shown below.

	4×2 DataFrame
	 Row │ return  volatility
	     │ Int64   Int64
	─────┼────────────────
	   1 │      1       2
	   2 │      2       4
	   3 │      3       9
	   4 │      4      16
"""

# ╔═╡ b93b682f-58f9-4988-a576-b2c5aa53b223
#Type your solution here




# ╔═╡ c32e1cc5-2032-4f72-bbd2-e3025eb8fd76
vspace

# ╔═╡ 69487145-98d0-449e-a214-dcc28014f308
md"""
2.) Get the number of rows, columns, column names and summary statistics of the df data frame from Part 1.
"""

# ╔═╡ 681cc260-0f46-4868-b23e-fc77c85836f6
#Type your solution here




# ╔═╡ 29e45e12-ed93-44f5-a542-e4171c762284
vspace

# ╔═╡ 4e6eeb2e-014d-400a-ae59-e23cc96fd634
md"""
3.) Make a plot of the return against the volatility column of the `df` data frame.
"""

# ╔═╡ 762e21e0-d6db-4679-8fcf-421ac3d8c48b
#Type your solution here




# ╔═╡ 6b0f74fb-33cb-41bf-8b9c-ddd855a74444
vspace

# ╔═╡ 2fc76469-2c86-4c6d-8c45-b59baaa6850b
md"""
4.) Add a column to the `df` data frame with name *`name string`* containing the string representation of numbers in column number, i.e. ["one", "two", "three", "four"].
"""

# ╔═╡ 8e3f2bf3-97ac-4f9d-922e-b6d193f74a61
#Type your solution here




# ╔═╡ efbcd3c6-e3fc-4b13-9d1f-a18b9abde64e
vspace

# ╔═╡ ec0203fc-2cf6-404b-aa26-239fb2772c0e
md"""
5.) Check if df contains column square2.
"""

# ╔═╡ f9015786-043c-4ccb-b9af-5087a06c9e48
#Type your solution here




# ╔═╡ b20e5a56-302f-4c2b-8513-e14b71f49b1e
vspace

# ╔═╡ 653a2085-8af3-42f8-9add-ab15a209db3a
md"""
### Exercise 18
"""

# ╔═╡ f52b2e99-da8e-46b5-93e5-68b92d94ac69
md"""
1.) In the `Random` module the `randexp` function is defined that samples numbers from exponential distribution with scale 1. Draw two 100,000 element samples from this distribution store them in `x` and `y` vectors. Plot histograms of the maximum of pairs of sampled values and the sum of vector `x` and half of vector `y`.
"""

# ╔═╡ f71b00ac-393a-4473-aabd-27f370c2c91b
#Type your solution here




# ╔═╡ 4f734240-1a70-4105-80be-2933b252a8f3
vspace

# ╔═╡ 2b0dd760-ed44-475b-9539-c9f145512ba6
md"""
2.) Using vectors x and y from Part 1 create a dataframe (call it `df`) to store vector x and vector y, as well as the maximum of pairs of sampled values and the sum of vector x and half of vector y. Compute all standard descriptive statistics of columns of this data frame.
"""

# ╔═╡ 15d6ca5f-5235-478f-9375-b3fd33f281b7
#Type your solution here




# ╔═╡ 1ef21887-6491-4b0a-983c-7361ad47ae34
vspace

# ╔═╡ cf5ec18f-7648-4970-8136-707eea646d45
md"""
### Exercise 19
"""

# ╔═╡ feb22fd8-5a9e-48d5-a2fd-47da0c53f8c5
md"""
1.) Create two DataFrames df1 and df2 as shown below.

	DataFrame df1
	
	 Row │ a      b
	     │ Int64  Int64
	─────┼──────────────
	   1 │     1     11
	   2 │     2     12

	DataFrame df2
	
	 Row │ a      c
	     │ Int64  Int64
	─────┼──────────────
	   1 │     1    101
	   2 │     2    102

"""

# ╔═╡ 87594fcf-4c9a-4177-980e-199a73cbb42f
vspace

# ╔═╡ b2e4628a-2474-4d43-91c6-d179dfa78208
md"""
2.) Vertically concatenate df1 and df2 so that only columns that are present in both data frames are kept. Check the documentation of vcat to see how to do it.
"""

# ╔═╡ f03dc8fe-5e9a-41b7-a1e0-fb91fae4c044
#Type your solution here




# ╔═╡ 7a644a5f-0aab-45f8-9231-44807f1987df
vspace

# ╔═╡ 94b24d8e-b8b6-4328-9dd3-4422cb85ffb5
md"""
3.) Now append the df2 dataframe to df1, but add only the columns from df2 that are present in df1. Check the documentation of append! to see how to do it.
"""

# ╔═╡ 4adff33d-40f2-4594-ba83-36e42d804294
#Type your solution here




# ╔═╡ 4d67aa70-a883-4bcf-9591-5acb80935492
vspace

# ╔═╡ a9e7e894-9ad7-40f7-921c-e32312c10dbc
md"""
###  Exercise 20
"""

# ╔═╡ b38c5534-11a2-4f54-9765-5804b1295227
md"""
Suppose you have the following data of stock returns for two stocks (unit is in percent),

	
	"stock1","stock2"
	0.139279,0.138829
	0.456779,0.441059
	0.344034,0.337287
	0.140253,0.139794
	0.848344,0.750186
	0.977512,0.829109
	0.032737,0.032731
	0.702750,0.646318
	0.422339,0.409895
	0.393878,0.383772
	
1.) Load this data into dataframe and call it `testdf`.
Use the string representation of the data in the cell below.

"""

# ╔═╡ f1d59914-e6a0-4a22-baa1-f6f37b76b31e
teststr = """
"x","sinx"
0.139279,0.138829
0.456779,0.441059
0.344034,0.337287
0.140253,0.139794
0.848344,0.750186
0.977512,0.829109
0.032737,0.032731
0.702750,0.646318
0.422339,0.409895
0.393878,0.383772
"""

# ╔═╡ 9987b712-8f86-490c-af75-1e98eec96409
#Type your solution here




# ╔═╡ af205e13-a7be-4a28-8e4e-6f0ae304feb0
vspace

# ╔═╡ 0cb84a4f-a6d0-4314-a9a3-61eede5dce42
md"""
For the next questions, suppose you are given an extended version of the testdf dataframe above, but only for one stock `x`. This dataframe is called `df`. The cell below generates this dataframe for you. Use it to answer the next questions.
"""

# ╔═╡ cc1b2530-6453-4fde-a7d9-3afc1b89c2d6
begin
	using DataFrames
	df = DataFrame(x=rand(100_000))
end

# ╔═╡ 4727eb92-5e72-4d90-9d18-272a60f9eea9
vspace

# ╔═╡ 8b0b41e1-4d46-49d1-a1b3-e2791d12935c
md"""
2.) Group data in data frame df into buckets of 0.1 width and store the result in gdf data frame (sort the groups). Use the cut function from CategoricalArrays.jl to do it (check its documentation to learn how to do it). Check the number of values in each group.
"""

# ╔═╡ 9a8a4dc8-6bbf-4c28-b03a-3f0287ba67f2
#Type your solution here




# ╔═╡ dc220a53-008e-4122-84bd-b7f45a44b0b8
vspace

# ╔═╡ 17b59552-368c-4951-9980-93f14915b985
md"""
3.) Display the grouping keys in gdf grouped data frame. Show them as named tuples. Check what would be the group order if you asked not to sort them.
"""

# ╔═╡ 5e7fcdbb-e8b0-4f9a-9128-025170e1929d
#Type your solution here




# ╔═╡ c5b7d71c-500a-46dd-a18b-94bbd72d6b29
vspace

# ╔═╡ 169a09e9-6388-4c14-bdf8-5fc71d967043
md"""
4.) Compute average number of observations `n` for each group in the grouped dataframe from Part 2.
"""

# ╔═╡ 4543a91f-da80-439f-a172-3b288d22d8f2
#Type your solution here




# ╔═╡ 355ecb67-878d-4960-bec0-af9855aaedf2
vspace

# ╔═╡ 35e6b686-2daa-40f6-b348-6987406ba95b
# ╠═╡ show_logs = false
begin
using PlutoUI, Printf, LaTeXStrings, HypertextLiteral

	
	#Define html elements
	nbsp = html"&nbsp" #non-breaking space
	vspace = html"""<div style="margin-bottom:2cm;"></div>"""
	br = html"<br>"

	#Sets the height of displayed tables
	html"""<style>
		pluto-output.scroll_y {
			max-height: 650px; /* changed this from 400 to 550 */
		}
		"""
	
	#Two-column cell
	struct TwoColumn{A, B}
		left::A
		right::B
	end
	
	function Base.show(io, mime::MIME"text/html", tc::TwoColumn)
		write(io,
			"""
			<div style="display: flex;">
				<div style="flex: 50%;">
			""")
		show(io, mime, tc.left)
		write(io,
			"""
				</div>
				<div style="flex: 50%;">
			""")
		show(io, mime, tc.right)
		write(io,
			"""
				</div>
			</div>
		""")
	end

	#Creates a foldable cell
	struct Foldable{C}
		title::String
		content::C
	end
	
	function Base.show(io, mime::MIME"text/html", fld::Foldable)
		write(io,"<details><summary>$(fld.title)</summary><p>")
		show(io, mime, fld.content)
		write(io,"</p></details>")
	end
	
	html"""<style>
		main {
			max-width: 900px;
		}
	"""
	
	#helper functions
	#round to digits, e.g. 6 digits then prec=1e-6
	roundmult(val, prec) = (inv_prec = 1 / prec; round(val * inv_prec) / inv_prec); 

	using Logging
	global_logger(NullLogger())
	display("")
end

# ╔═╡ bafa86e5-b340-4b99-b3d6-c31908824eaa
# ╠═╡ show_logs = false
begin
	
#------------------------------------------------------------------------------
"""
    printmat([fh::IO],x...;colNames=[],rowNames=[],
             width=10,prec=3,NoPrinting=false,StringFmt="",cell00="")
Print all elements of a matrix (or several) with predefined formatting. It can also handle
OffsetArrays. StringFmt = "csv" prints using a csv format.
# Input
- `fh::IO`:            (optional) file handle. If not supplied, prints to screen
- `x::Array(s)`:       (of numbers, dates, strings, ...) to print
- `colNames::Array`:   of strings with column headers
- `rowNames::Array`:   of strings with row labels
- `width::Int`:        (keyword) scalar, minimum width of printed cells
- `prec::Int`:         (keyword) scalar, precision of printed cells
- `NoPrinting::Bool`:  (keyword) bool, true: no printing, just return formatted string [false]
- `StringFmt::String`: (keyword) string, "", "csv"
- `cell00::String`:    (keyword) string, for row 0, column 0
# Output
- str         (if NoPrinting) string, (otherwise nothing)
# Examples
```
x = [11 12;21 22]
printmat(x)
```
```
x = [1 "ab"; Date(2018,10,7) 3.14]
printmat(x,width=20,colNames=["col 1","col 2"])
```
```
printmat([11,12],[21,22])
```
Can also call as
```
opt = Dict(:rowNames=>["1";"4"],:width=>10,:prec=>3,:NoPrinting=>false,:StringFmt=>"")
printmat(x;colNames=["a","b"],opt...)     #notice ; and ...
```
(not all keywords are needed)
# Requires
- fmtNumPs
# Notice
- The prefixN and suffixN could potentially be made function inputs. This would allow
a fairly flexible way to format tables.
Paul.Soderlind@unisg.ch
"""
function printmat(fh::IO,x...;colNames=[],rowNames=[],
                  width=10,prec=3,NoPrinting=false,StringFmt="",cell00="")

  isempty(x) && return nothing                         #do nothing is isempty(x)

  typeTestQ = any(!=(eltype(x[1])),[eltype(z) for z in x])  #test if eltype(x[i]) differs
  if typeTestQ                                      #create matrix from tuple created by x...
    x = hcat(Matrix{Any}(hcat(x[1])),x[2:end]...)   #preserving types of x[i]
  else
    x = hcat(x...)
  end

  (m,n) = (size(x,1),size(x,2))

  (length(rowNames) == 1 < m) && (rowNames = [string(rowNames[1],i) for i = 1:m])  #"ri"
  (length(colNames) == 1 < n) && (colNames = [string(colNames[1],i) for i = 1:n])  #"ci"

  if StringFmt == "csv"
    (prefixN,suffixN)   = (fill("",n),vcat(fill(",",n-1),""))  #prefix and suffix for column 1:n
    (prefixC0,suffixC0) = ("",",")                             #prefix and suffix for column 0
  else
    (prefixN,suffixN) = (fill("",n),fill("",n))
    (prefixC0,suffixC0) = ("","")
  end

  if length(rowNames) == 0                         #width of column 0 (cell00 and rowNames)
    col0Width = 0
  else
    col0Width = maximum(length,vcat(cell00,rowNames)) + length(prefixC0) + length(suffixC0)
  end

  colWidth = [width + length(prefixN[j]) + length(suffixN[j]) for j=1:n]  #widths of column 1:n

  iob = IOBuffer()

  if !isempty(colNames)                                #print (cell00,colNames), if any
    !isempty(cell00) ?  txt0 = string(prefixC0,cell00,suffixC0) : txt0 = ""
    print(iob,rpad(txt0,col0Width))
    for j = 1:n                                #loop over columns
      print(iob,lpad(string(prefixN[j],colNames[j],suffixN[j]),colWidth[j]))
    end
    print(iob,"\n")
  end
                                                       #print rowNames and x
  (i0,j0) = (1 - first(axes(x,1)),1 - first(axes(x,2)))   #i+i0,j+j0 give traditional indices
  for i in axes(x,1)                           #loop over rows
    !isempty(rowNames) && print(iob,rpad(string(prefixC0,rowNames[i+i0],suffixC0),col0Width))
    for j in axes(x,2)                         #loop over columns
      print(iob,fmtNumPs(x[i,j],width,prec,"right",prefix=prefixN[j+j0],suffix=suffixN[j+j0]))
    end
    print(iob,"\n")
  end
  str = String(take!(iob))

  if NoPrinting                              #no printing, just return str
    return str
  else                                       #print, return nothing
    print(fh,str,"\n")
    return nothing
  end

end
                        #when fh is not supplied: printing to screen
printmat(x...;colNames=[],rowNames=[],width=10,prec=3,NoPrinting=false,StringFmt="",cell00="") =
    printmat(stdout::IO,x...;colNames,rowNames,width,prec,NoPrinting,StringFmt,cell00)
#------------------------------------------------------------------------------


#------------------------------------------------------------------------------
"""
    printlnPs([fh::IO],z...;width=10,prec=3)
Subsitute for println, with predefined formatting.
# Input
- `fh::IO`:    (optional) file handle. If not supplied, prints to screen
- `z::String`: string, numbers and arrays to print
Paul.Soderlind@unisg.ch
"""
function printlnPs(fh::IO,z...;width=10,prec=3)

  for x in z                              #loop over inputs in z...
    if isa(x,AbstractArray)
      iob = IOBuffer()
      for i = 1:length(x)
        print(iob,fmtNumPs(x[i],width,prec,"right"))
      end
      print(fh,String(take!(iob)))
    else
      print(fh,fmtNumPs(x,width,prec,"right"))
    end
  end

  print(fh,"\n")

end
                      #when fh is not supplied: printing to screen
printlnPs(z...;width=10,prec=3) = printlnPs(stdout::IO,z...;width,prec)
#------------------------------------------------------------------------------


#------------------------------------------------------------------------------
"""
    fmtNumPs(z,width=10,prec=2,justify="right";prefix="",suffix="")
Create a formatted string of a float (eg, "%10.4f"), nothing (""),
while other values are passed through. Strings are right (or left) justified
and can optionally be given prefix and suffix (eg, ",")
# Notice
- With prec > 0 and isa(z,Integer), then the string is padded with 1+prec spaces
to align with the printing of floats with the same prec.
# Requires
- Printf (for 1.6-), fmtNumPsC (for < 1.6)
"""
function fmtNumPs(z,width=10,prec=2,justify="right";prefix="",suffix="")

  isa(z,Bool) && (z = convert(Int,z))             #Bool -> Int

  if isa(z,AbstractFloat)                         #example: 101.0234, prec=3
    if VERSION < v"1.6-"
      fmt    = "%$(width).$(prec)f"
      zRound = round(z,digits=prec)
      strLR  = fmtNumPsC(fmt,zRound)                #C fallback solution
    else
      fmt   = Printf.Format("%$(width).$(prec)f")
      strLR = Printf.format(fmt,z)
    end
  elseif isa(z,Nothing)
    strLR = ""
  elseif isa(z,Integer) && prec > 0               #integer followed by (1+prec spaces)
    strLR = string(z," "^(1+prec))
  else                                            #Int, String, Date, Missing, etc
    strLR = string(z)
  end

  strLR = string(prefix,strLR,suffix)

  if justify == "left"                            #justification
    strLR = rpad(strLR,width+length(prefix)+length(suffix))
  else
    strLR = lpad(strLR,width+length(prefix)+length(suffix))
  end

  return strLR

end
#------------------------------------------------------------------------------


#------------------------------------------------------------------------------
"""
    fmtNumPsC(fmt,z)
c fallback solution for formatting of floating point number. Used if VERSION < v"1.6-"
"""
function fmtNumPsC(fmt,z)                           #c fallback solution
  if ismissing(z) || isnan(z) || isinf(z)    #asprintf does not work for these cases
    str = string(z)
  else
    strp = Ref{Ptr{Cchar}}(0)
    len = ccall(:asprintf,Cint,(Ptr{Ptr{Cchar}},Cstring,Cdouble...),strp,fmt,z)
    str = unsafe_string(strp[],len)
    Libc.free(strp[])
  end
  return str
end
#------------------------------------------------------------------------------


#------------------------------------------------------------------------------
function printblue(x...)
  foreach(z->printstyled(z,color=:blue,bold=true),x)
  print("\n")
end
function printred(x...)
  foreach(z->printstyled(z,color=:red,bold=true),x)
  print("\n")
end
function printmagenta(x...)
  foreach(z->printstyled(z,color=:magenta,bold=true),x)
  print("\n")
end
function printyellow(x...)
  foreach(z->printstyled(z,color=:yellow,bold=true),x)
  print("\n")
end
#------------------------------------------------------------------------------

display("Custom Printing functions")
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
LaTeXStrings = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
Logging = "56ddb016-857b-54e1-b83d-db4d58db5568"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
Printf = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[compat]
DataFrames = "~1.4.4"
HypertextLiteral = "~0.9.4"
LaTeXStrings = "~1.3.0"
PlutoUI = "~0.7.49"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "00a2cccc7f098ff3b66806862d275ca3db9e6e5a"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.5.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[DataAPI]]
git-tree-sha1 = "e8119c1a33d267e16108be441a287a6981ba1630"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.14.0"

[[DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Random", "Reexport", "SnoopPrecompile", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "d4f69885afa5e6149d0cab3818491565cf41446d"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.4.4"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[InvertedIndices]]
git-tree-sha1 = "82aec7a3dd64f4d9584659dc0b62ef7db2ef3e19"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.2.0"

[[IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "f66bdc5de519e8f8ae43bdc598782d35a25b1272"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.1.0"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "13468f237353112a01b2d6b32f3d0f80219944aa"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.2"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "eadad7b14cf046de6eb41f13c9275e5aa2711ab6"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.49"

[[PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "a6062fe4063cdafe78f4a0a81cfffb89721b30e7"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.2"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[PrettyTables]]
deps = ["Crayons", "Formatting", "LaTeXStrings", "Markdown", "Reexport", "StringManipulation", "Tables"]
git-tree-sha1 = "96f6db03ab535bdb901300f88335257b0018689d"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "2.2.2"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SnoopPrecompile]]
deps = ["Preferences"]
git-tree-sha1 = "e760a70afdcd461cf01a575947738d359234665c"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.3"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "a4ada03f999bd01b3a25dcaa30b2d929fe537e00"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.1.0"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[StringManipulation]]
git-tree-sha1 = "46da2434b41f41ac3594ee9816ce5541c6096123"
uuid = "892a3eda-7b42-436c-8928-eab12a02cf0e"
version = "0.3.0"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits", "Test"]
git-tree-sha1 = "c79322d36826aa2f4fd8ecfa96ddb47b174ac78d"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.10.0"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─f5450eab-0f9f-4b7f-9b80-992d3c553ba9
# ╟─e86c095f-b440-4935-9f60-9cdcd54ffb43
# ╟─ce1be57b-3d94-4f28-a307-8bafc01d9651
# ╟─83806080-8c00-11ec-0f46-01e9cff3af6f
# ╟─99902ed5-59aa-4984-a2d0-f31bfa28da34
# ╟─df2605a4-7651-403b-9d1d-8b1fd4b42df1
# ╟─1c14adad-358d-469a-9f8a-697710ae9e0e
# ╟─9609264e-b4ce-4390-adc0-7821175b7e60
# ╠═f499ea41-c1ce-4ad1-9579-1aae4a535a58
# ╟─669f5626-f17f-4b58-abb8-0dcb25c14895
# ╟─3580b62d-fe8a-499c-8551-cac1a81d1b55
# ╟─f6c7b4fa-ec5d-4f16-816f-0c0327bf76b7
# ╠═0370fa97-a539-4f44-b8f5-155e8c430e74
# ╟─14422ed6-189b-4c88-aa9d-a6798ca25138
# ╟─d803b6e7-5ea0-4e48-99a5-00cebe720621
# ╟─f94c5f9c-b943-4d5e-8dfc-ab7f03c0a2fc
# ╠═45c59b5e-6b7b-4b7c-97fc-65855792f9fe
# ╟─5263fd14-1e9a-465e-8e24-1d7a5cd5f343
# ╟─c6fcd024-9691-42cc-964e-b027ba211b37
# ╟─c75cb5d1-d0d3-488c-8199-c5f75b11bb83
# ╠═1fc81663-edaf-46f1-ab94-bf4960a84648
# ╟─994a949e-8139-422b-8d63-09f38d6341a1
# ╟─05cef98d-14dd-4ada-9bf1-62e4a5d48444
# ╟─300ef710-c93b-4448-b834-d4488f73c69c
# ╠═6784b1e6-4971-4245-b382-1518900eca51
# ╟─590427f3-22e9-4027-aca2-8b4627330807
# ╟─11eec2ac-ceb9-4a00-b0c0-b7670c9fdf18
# ╟─eccd3fe4-42e3-4f7d-a2da-8e1287c1f11a
# ╠═b73de587-ae67-4613-acbc-c8584a9b530f
# ╟─e7b61bc1-5358-488c-b725-89c4e70197ec
# ╟─b529a747-0969-49f8-88e4-0e7f146cea8e
# ╟─bda85a0b-8704-45a5-a655-d4ffe97827b1
# ╠═27f0cef0-9897-4f07-8d54-b898b62b5bad
# ╟─3103f40d-ea2e-4d0a-b333-75306a85d423
# ╟─de545d82-1c47-40ef-bb5e-baa4827d572a
# ╟─60e3605d-8571-453f-8646-87bfb07bae14
# ╠═db201906-acb3-4850-b0ad-97f0360abacf
# ╟─a5e8ddd3-e9fa-48d5-9254-ce515786a63c
# ╟─6f2da2f0-d61c-4226-b6a8-c7772b7bc0db
# ╟─c67dcbb9-fcf0-445b-9d08-e65938a2da88
# ╠═4e63012c-7b52-41ad-a1fb-8f03d5fd48d3
# ╟─1034efe3-0b04-4aef-bf72-c0eeab75d46c
# ╟─a27bbc12-e20f-46d0-9e27-78e51d06a5e3
# ╟─e68b67db-65f6-4106-86b7-037ddb19cf42
# ╠═ec8d7c70-4766-41f6-a59f-7e583a47d2ea
# ╟─92d9dd36-fd12-44ce-8950-d771738b1d54
# ╟─11d3d256-fd44-4708-b388-537ebfd6b413
# ╟─7312423e-a373-4848-a239-f8fa3506de43
# ╠═154ebc56-81db-4456-a7eb-8e797e33c5c4
# ╟─7e058bd0-2c50-4acf-8fad-73a7205b7d1c
# ╟─eb12000d-1b58-4399-8bc0-1cb795e22393
# ╟─cab48b19-435d-4750-918a-77bd19a34122
# ╟─a336149d-8d29-44d1-9e7e-6e81f83f0ef0
# ╠═ebbc453e-cc29-40dd-87f9-c3cdf5d5adeb
# ╠═43e4fbf2-fffc-4478-9ec0-238bb6c1b2c1
# ╟─b2eccd80-f3f4-497a-86d7-0df802dc8467
# ╟─db8f0eb9-362e-420e-a01f-90b5567aeab4
# ╟─0f67af16-7f25-450c-903a-335f993a0362
# ╠═9a5bfb7f-a6a2-4b11-9f13-3475d61983cd
# ╟─17e71f9a-c323-4b35-bb2d-ffd65d2d83eb
# ╟─8d5acbff-969d-4d81-8588-71fb6841df9a
# ╟─67960933-a009-43c7-8774-b4cff51d5046
# ╠═648ba0f6-3514-4072-8fac-c9062d1eb177
# ╟─52503992-9d0d-4c93-8eb8-15a4712082d4
# ╟─3eecc376-f59b-47a6-9c3e-82793d5f3b32
# ╟─b2fcedd0-1a3e-4812-9e47-879a4d044113
# ╠═8b312e78-3ff6-4244-9ab9-da23ac60389b
# ╟─383fe559-803f-4155-8bd8-a334b463b123
# ╟─34ed1291-d607-4e18-ad29-f9cb5b77d53b
# ╟─09f170a0-1edf-4f75-882f-29eb5178f63a
# ╠═3cfa4679-85d6-48fd-b73e-fd4dc4fdcba1
# ╟─d43bf9aa-f192-4870-b1a8-5bd71949c4ff
# ╟─57ac236b-eb12-4483-b19d-90327c60d14b
# ╟─60b54e82-4bb8-4baf-b8ba-af80232b142f
# ╟─a999374d-7f81-4cc7-9758-7d0109b17ead
# ╠═b93b682f-58f9-4988-a576-b2c5aa53b223
# ╟─c32e1cc5-2032-4f72-bbd2-e3025eb8fd76
# ╟─69487145-98d0-449e-a214-dcc28014f308
# ╠═681cc260-0f46-4868-b23e-fc77c85836f6
# ╟─29e45e12-ed93-44f5-a542-e4171c762284
# ╟─4e6eeb2e-014d-400a-ae59-e23cc96fd634
# ╠═762e21e0-d6db-4679-8fcf-421ac3d8c48b
# ╟─6b0f74fb-33cb-41bf-8b9c-ddd855a74444
# ╟─2fc76469-2c86-4c6d-8c45-b59baaa6850b
# ╠═8e3f2bf3-97ac-4f9d-922e-b6d193f74a61
# ╟─efbcd3c6-e3fc-4b13-9d1f-a18b9abde64e
# ╟─ec0203fc-2cf6-404b-aa26-239fb2772c0e
# ╠═f9015786-043c-4ccb-b9af-5087a06c9e48
# ╟─b20e5a56-302f-4c2b-8513-e14b71f49b1e
# ╟─653a2085-8af3-42f8-9add-ab15a209db3a
# ╟─f52b2e99-da8e-46b5-93e5-68b92d94ac69
# ╠═f71b00ac-393a-4473-aabd-27f370c2c91b
# ╟─4f734240-1a70-4105-80be-2933b252a8f3
# ╟─2b0dd760-ed44-475b-9539-c9f145512ba6
# ╠═15d6ca5f-5235-478f-9375-b3fd33f281b7
# ╟─1ef21887-6491-4b0a-983c-7361ad47ae34
# ╟─cf5ec18f-7648-4970-8136-707eea646d45
# ╟─feb22fd8-5a9e-48d5-a2fd-47da0c53f8c5
# ╟─87594fcf-4c9a-4177-980e-199a73cbb42f
# ╟─b2e4628a-2474-4d43-91c6-d179dfa78208
# ╠═f03dc8fe-5e9a-41b7-a1e0-fb91fae4c044
# ╟─7a644a5f-0aab-45f8-9231-44807f1987df
# ╟─94b24d8e-b8b6-4328-9dd3-4422cb85ffb5
# ╠═4adff33d-40f2-4594-ba83-36e42d804294
# ╟─4d67aa70-a883-4bcf-9591-5acb80935492
# ╟─a9e7e894-9ad7-40f7-921c-e32312c10dbc
# ╟─b38c5534-11a2-4f54-9765-5804b1295227
# ╠═f1d59914-e6a0-4a22-baa1-f6f37b76b31e
# ╠═9987b712-8f86-490c-af75-1e98eec96409
# ╟─af205e13-a7be-4a28-8e4e-6f0ae304feb0
# ╟─0cb84a4f-a6d0-4314-a9a3-61eede5dce42
# ╠═cc1b2530-6453-4fde-a7d9-3afc1b89c2d6
# ╟─4727eb92-5e72-4d90-9d18-272a60f9eea9
# ╟─8b0b41e1-4d46-49d1-a1b3-e2791d12935c
# ╠═9a8a4dc8-6bbf-4c28-b03a-3f0287ba67f2
# ╟─dc220a53-008e-4122-84bd-b7f45a44b0b8
# ╟─17b59552-368c-4951-9980-93f14915b985
# ╠═5e7fcdbb-e8b0-4f9a-9128-025170e1929d
# ╟─c5b7d71c-500a-46dd-a18b-94bbd72d6b29
# ╟─169a09e9-6388-4c14-bdf8-5fc71d967043
# ╠═4543a91f-da80-439f-a172-3b288d22d8f2
# ╟─355ecb67-878d-4960-bec0-af9855aaedf2
# ╟─35e6b686-2daa-40f6-b348-6987406ba95b
# ╟─bafa86e5-b340-4b99-b3d6-c31908824eaa
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
