### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ d7e2e472-6aae-4d12-ab51-d8ed83a2d201
html"""
	<p align=left style="font-size:32px; font-family:family:Georgia"> <b> FINC 672: Workshop in Finance - Empirical Methods</b> <p>
	"""

# ╔═╡ 822f9a29-2599-4ad6-8902-ad9cc3aab263
begin 
	html"""
	<p style="padding-bottom:1cm"> </p>
	<div align=center style="font-size:25px; font-family:family:Georgia"> FINC-672: Workshop in Finance - Empirical Methods </div>
	<p style="padding-bottom:1cm"> </p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> <b> Time-Series Data and Missing Values </b> <p>
	<p style="padding-bottom:1cm"> </p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> Spring 2023 <p>
	<p style="padding-bottom:0.5cm"> </p>
	<div align=center style="font-size:20px; font-family:family:Georgia"> Prof. Matt Fleckenstein </div>
	<p style="padding-bottom:0.05cm"> </p>
	<div align=center style="font-size:20px; font-family:family:Georgia"> University of Delaware, 
	Lerner College of Business and Economics </div>
	<p style="padding-bottom:0.5cm"> </p>
	"""
end

# ╔═╡ a2953e7d-a163-4e1f-8c2c-54a6c31e3d1e
vspace

# ╔═╡ b9cb6ae7-67e2-4671-a49a-c6d2d10e6766
md"""
*Note: The material in this notebook are adapted from Kamiński, Bogumił (2023). Julia for Data Analysis. [https://www.manning.com/books/julia-for-data-analysis](https://www.manning.com/books/julia-for-data-analysis)*
"""

# ╔═╡ 64c2ee7d-a379-46d5-9bff-2152f57fa78c
TableOfContents(aside=true, depth=1)

# ╔═╡ f7428550-fe1b-4749-ad1d-6810f7f136c1
vspace

# ╔═╡ fcdb31f2-3f46-4959-99ef-5e1a2185dbf7
begin
html"""
<fieldset>      
<legend>Goals for today</legend>      
<br>
  <input type="checkbox" value="">Fetching data by using HTTP queries." <br>      
<br>
  <input type="checkbox" value="">Parsing JSON data.<br>
<br>
  <input type="checkbox" value="">Working with dates.<br>      
<br>
<input type="checkbox" value="">Handling missing values.<br>      
<br>
<input type="checkbox" value="">Plotting data with missing values.<br>      
<br>
<input type="checkbox" value="">Interpolating missing values.<br>      
</fieldset>      
"""
end

# ╔═╡ b68a17d2-a3e7-4379-a441-1ca20a8970c5
vspace

# ╔═╡ 389d2ee2-450b-44b3-bb4c-9d820b9ecba9
md"""
# Time-Series Data

- Imagine we want to analyze how the price of a certain stock or the exchange rate between two currencies evolves over time. 
- To be able to handle these questions in Julia, we need to know how to work with time-series data. 
- A frequent feature of real-life temporal data is that it contains missing data for some timestamps. 
- Therefore, the second major topic of this chapter is handling missing values in Julia.
"""

# ╔═╡ f823a6f8-05f3-4df2-8a05-381faecd4b98
vspace

# ╔═╡ 806aebe8-d7b8-4dde-b5a2-401ec631b444
md"""
# Exchange Rates

- The problem we tackle in this lecture is analyzing the PLN/USD exchange rate that is published by the National Bank of Poland (NBP). 
- The data is made available via a Web API, which is described at [https://api.nbp.pl/en.html](https://api.nbp.pl/en.html).
"""

# ╔═╡ 155f8b79-4163-4759-b4d6-2085be2dd77b
vspace

# ╔═╡ f3165fda-e453-495e-bd30-1d181e0fbe0f
md"""
We will perform our task via the following steps:
1. Understand the format of the data that the Web API exposes.
2. Fetch the data by using HTTP GET requests for a specified range of dates.
3. Handle errors when the requested data is not available.
4. Extract the PLN/USD exchange rate from the obtained result of the query.
5. Perform simple statistical analysis of the fetched data.
6. Plot the fetched data with a proper handling of missing values.
"""

# ╔═╡ 026a08b7-3fdd-4b8d-92a8-2fa2bd9d5047
vspace

# ╔═╡ 2807c946-1aca-47b7-9c0f-e5d8e6270a0a
md"""
# Web APIs
"""

# ╔═╡ 7d7c0d8e-9beb-420b-b9c2-ec40b5d15d9f
md"""
The full specification of the Web API is available at [link](https://api.nbp.pl/en.html). The API can be accessed both via a web browser and programmatically. We start by querying it using a web browser. For our purpose, it is enough to know one format of the request:

`https://api.nbp.pl/api/exchangerates/rates/a/usd/YYYY-MM-DD/?format=json`

"""

# ╔═╡ 03003007-7690-4b3c-ae88-6070c69c5534
vspace

# ╔═╡ 195bfdc0-3d41-44bc-b1e1-354d09db5bbe
md"""
In this request, you should replace the YYYY-MM-DD part with a specific date, first
passing four digits of a year, then two digits for the month, and finally two digits for the day. 
- Here is an example of getting data for June 1, 2020:

`https://api.nbp.pl/api/exchangerates/rates/a/usd/2020-06-01/?format=json`
"""

# ╔═╡ d5d035fb-2756-4a01-b343-819e90f55c36
vspace

# ╔═╡ 597a33a1-e073-4280-87e5-dd69ecd6f862
md"""
When we run this query in your web browser, we get the following response
(depending on the browser you use, the layout of the response might be a bit different):
"""

# ╔═╡ 16a77cbc-77fb-4583-a002-7e4cbde93be9
md"""

	{
	"table":"A",
	"currency":"dolar amerykański",
	"code":"USD",
	"rates":[
			 {
			  "no":"105/A/NBP/2020",
			  "effectiveDate":"2020-06-01",
			  "mid":3.9680
			 }
			]
	}
"""

# ╔═╡ 45293830-01ac-4d90-98b8-9718f286fcd7
vspace

# ╔═╡ 0124af48-f9ac-479f-a862-b6f77c168955
md"""
- The result is returned in `JSON` format. 
  - You can find the format specification at [www.json.org/json-en.html](www.json.org/json-en.html). 
  - Additionally, if you want to learn more about JSON, consider going through the MDN Web Docs tutorial at [http://mng.bz/DDKa](http://mng.bz/DDKa). 
- Here, we will concentrate on explaining how this specific JSON structure should be interpreted.
"""

# ╔═╡ d374ed0c-19c4-4ef8-a754-0277a87eada6
LocalResource("./JSONFormat.png")

# ╔═╡ 45e525b2-2be4-4ef0-83ca-36f3bc3a4730
vspace

# ╔═╡ 7f60398a-3c7a-4bc4-ab73-ba721b40905f
md"""
- The result contains one object with four fields: 
  - table
  - currency
  - code
  - rates. 
- The field that is interesting for us is `rates`, which contains an array holding a single object. 
- This single object has three fields: 
  - no
  - effectiveDate
  - mid. 
- For us, the important field is mid, which stores the PLN/USD exchange rate for the day we have queried. For June 1, 2020, the exchange rate was 3.960 PLN/USD.
"""

# ╔═╡ b08c9d32-4c15-4dfa-a551-46bd79de5652
vspace

# ╔═╡ 49bfc368-94e2-42a2-b4d3-213336629b28
md"""
# Web APIs using Julia
"""

# ╔═╡ a125d73b-25a7-4ac7-948c-49a81379ff6f
md"""
Now that we understand the structure of the data, we switch to Julia. 
- We will fetch the data from the NBP Web API by using the `HTTP.get` function from the `HTTP.jl` package.
- Next, we will parse this response by using the JSON reader provided by the function `JSON3.read` from the `JSON3.jl` package. 
"""

# ╔═╡ 859276d4-8b94-4e97-a7be-9e53a780c7d0
vspace

# ╔═╡ 971f2459-4f97-4e64-bd25-24d831a4d272
begin

end

# ╔═╡ 38bb278a-f905-4168-ab76-7370f0d3137f
 

# ╔═╡ 2ed05013-c555-4206-aa3e-02acd8809254
vspace

# ╔═╡ 3307f16d-b553-49dd-bd36-c517456d36f7
 

# ╔═╡ fb7e97cd-7aef-4578-82d5-6fbb66b23a93
md"""
The response object has several fields, and the one that is important for us is
body, which stores the vector of fetched bytes:
"""

# ╔═╡ b820ae55-443d-4b76-8d11-472fc5569a3c
md"""
Let's inspect the response object
"""

# ╔═╡ 7613e884-8392-4aff-991f-cdab4773f3aa
 

# ╔═╡ e840176c-dd24-4d1e-a8c9-69f599674301
md"""
We pass this vector of bytes to the JSON reader function JSON3.read.
"""

# ╔═╡ 5754bd79-5831-4c94-821b-d846bb6186f1
 

# ╔═╡ 8be0843e-af4a-4da2-ba5c-71c7604beb19
vspace

# ╔═╡ 425901b7-f1d1-4da9-a75e-ca3610d6799d
md"""
- Next, let’s turn to the json variable to which we have bound the return value of JSON3.read (response.body). 
- A nice feature of the JSON3.read function is that the object it returns can be queried just like any other object in Julia. 
- Therefore, use the dot (.) to access its fields:
"""

# ╔═╡ 46bb021a-a461-4848-b17b-2ba64fe9e295
 

# ╔═╡ 776cba9f-4cb9-4751-a183-543b1168c4a1
 

# ╔═╡ baa4746d-dee2-46d3-90db-933af5eee599
 

# ╔═╡ e1e59fdd-dc73-48cf-9108-28372ba50661
 

# ╔═╡ a69db56e-2da7-48f8-b38d-ff732455e1ec
vspace

# ╔═╡ 0eab5cc7-2e6b-4c27-8ef6-e1ea1d946930
md"""
- Similarly, JSON arrays, like the one stored in the json.rates field, can be accessed using 1-based indexing, just like any vector in Julia. 
- Therefore, to get the mid field of the first object stored in the json.rates, you can write this:
"""

# ╔═╡ c8b9dc7f-b4e0-4dbc-92ed-3cb300400669
 

# ╔═╡ b6c80a1a-3150-45d4-a3b5-acd7b5e17de6
vspace

# ╔═╡ 9db3d9fc-c848-4348-b6e2-1d46c5333870
md"""
## Handling cases when an Web API query fails
"""

# ╔═╡ 5600d079-e494-455e-967c-c33ec7ed55a5
md"""
- Before we proceed to fetching data for a wider range of dates, let’s discuss one more feature of the NBP Web API. 
- The scenario we want to consider is what happens if we do not have data on the PLN/USD exchange rate for a given day. 
- To illustrate,  execute the following query in your browser:

`https://api.nbp.pl/api/exchangerates/rates/a/usd/2020-06-06/?format=json`
"""

# ╔═╡ abd517a3-3e7e-4ca3-952f-d2d0db312cb3
vspace

# ╔═╡ ed1004db-2ce0-4e72-ae16-7cbf1e9b9d4b
md"""
We should get the following response:

	`404 NotFound - Not Found - Brak danych`

We see that in this case, the data has no date for June 6, 2020. Let’s see how this scenario is handled when we try to execute the query programmatically in the next listing.

"""

# ╔═╡ 5ae5f571-372b-4f3f-a34b-a36246650309
vspace

# ╔═╡ 9ac46275-0163-4123-95b7-bc8076d06a41
begin
 
end

# ╔═╡ 0ade2a38-f7dc-42dd-a89c-adff80ee7334
vspace

# ╔═╡ cced3ddf-b1d2-4894-b1a9-1fce29ce19d8
md"""
The HTTP.get function throws an exception in this case with a 404 error, informing
us that the requested page was not found. This is a new scenario that we have not
encountered yet
"""

# ╔═╡ ca49f09d-10a1-41c9-99eb-263319cc2de7
md"""
- Let’s discuss how to handle exceptions so that they do not terminate our program if we do not want them to. For this, we use the `try-catch-end` block.

- We proceed using the following steps
1. Tries to execute our query in the try part of the block
2. If the query succeeds, returns its result
3. If the query fails, executes the contents of the catch part of the block

- As we see below, for the valid date of June 1, 2020, we get the parsed value 3.968, and for the invalid date of June 6, 2020, a missing value is produced.
"""

# ╔═╡ 4690a578-2089-495a-af77-180aa4e1e143
vspace

# ╔═╡ 98956a7a-4e81-4d69-952e-1d387a9e8056
let
 
end

# ╔═╡ dab2d612-71e0-48df-83d0-da91bd681eb6
vspace

# ╔═╡ e9462030-da21-47ce-9a88-be35b54e09fe
let
 
end

# ╔═╡ 3f657ea2-b3f6-4281-97fb-d9b22b7475fd
vspace

# ╔═╡ a30f3bbd-326d-481d-92a5-dfd24c9b1759
md"""
## Getting time-series data from the NBP Web API
"""

# ╔═╡ 52db31ca-ba68-4e5b-b504-d71ab8dbbe5e
md"""
We are now ready to analyzing the PLN/USD exchange rate. For this example, assume we want to get the data for all days of June 2020. We will create a function that fetches the data from a single day and then apply it to all days in question. 
"""

# ╔═╡ 82c2c7f4-3e69-4800-bb2d-2b82d2403145
md"""
- To begin, we load the `Dates.jl` package.
"""

# ╔═╡ 0084413a-acae-4ccb-a38a-93c48243cfbc
 

# ╔═╡ 5fdb6824-5508-4d8e-a947-6b68fa1f9c04
md"""
- We already know how to construct a vector of dates for all days in a given month (e.g., June 2022) or between two dates.
- Recall that we accomplish this using `Date` ranges.
- For instance, to get the a range of dates from May 20, 2023 to July 5, 2023. we use
"""

# ╔═╡ edd1716f-a882-4678-982e-4ad1796c9ad4
 

# ╔═╡ 6a4c45b1-c5ab-48c1-b2d0-77f0ec9c2cc0
vspace

# ╔═╡ bc4a619f-bda2-4eaa-b56a-3ea9e2b93fc7
md"""
- Now that we’ve created a dates vector of dates for which we want to get the PLN/USD exchange rate data, let’s write a function that gets data for a specific date.
"""

# ╔═╡ 1d0dd4b6-6189-4986-a852-25a9e0177a0c
 

# ╔═╡ 288ce3c2-1a63-446e-9fd1-1c64fe752835
vspace

# ╔═╡ 62fb7d1d-fbd1-431b-9761-bb4b82b63a8d
md"""
Let's now use our function
"""

# ╔═╡ 8da702ce-fa95-4d97-882e-9a13a9b5c381
 

# ╔═╡ 4d7adfd5-7817-4cbb-a842-b3008d886801
vspace

# ╔═╡ d96c02f0-1e62-40ad-a691-10ed1d935798
md"""
- Note that we use the dot (.) after the get_rate function to apply it to all elements of the dates vector. 
- Additionally, the result is a Vector having the element type Union{Float64, Missing}, which means that in the result, we have a mixture of missing values and floating-point numbers.
"""

# ╔═╡ 4cc01d2f-e046-4eea-b945-6f54db2e7711
vspace

# ╔═╡ c8299e05-a65e-4393-b170-3a317594604a
md"""
# Analyzing Web API Data
"""

# ╔═╡ 0896da60-d72f-4474-b5ef-f1e95eb59273
md"""
- Given the data we just collected, we want to do the following:

1. Calculate basic summary statistics of the data: the mean and standard deviation of the rates vector
2. Analyze for which days of the week we encounter missing data in our vector
3. Display the PLN/USD exchange rate on a plot

"""

# ╔═╡ 406ff58f-6658-4d9a-8d9f-e25ec4a3f07a
vspace

# ╔═╡ 1c1c0d05-94f6-4fe8-a7c6-c5d2acd4ef20
md"""
- First, we want to calculate the mean and standard deviation of the rates vector.
"""

# ╔═╡ c268b7b0-609f-475a-9358-e99bb1a1284d
 

# ╔═╡ bcfd13c1-7f34-4f94-ae70-7409c4d3383c
 

# ╔═╡ 8788d094-c3f5-4855-b32c-42d7d37b60a3
 

# ╔═╡ 81db7812-75d4-4f83-bd54-96cca465e38c
vspace

# ╔═╡ d22920d4-38db-4a25-945e-713b274ae18a
md"""
- Unfortunately, this is not what we expect. 
- The reason for this is that we are dealing with missing data.
- Thus, we need to additionally use the `skipmissing` function which allows us to `skip` over missing observations such that we can compute means and standard deviations.
"""

# ╔═╡ c48f2bc6-1029-440a-86a7-4a17da90ba4b
 

# ╔═╡ c20b673f-676e-4004-9016-dd7837585df6
 

# ╔═╡ 32f2a06d-1a92-440e-9bc9-93c492719df1
vspace

# ╔═╡ 3e8c5879-86c1-46b8-acf4-6fb8d347637c
md"""
## Finding which days of the week have the most missing values
"""

# ╔═╡ 8c3c65e0-dad5-4d67-80c6-cf798486a216
md"""
- the `dayname` function returns the English name of the given day. 
- Therefore, we can use the `proptable` function from the `FreqTable.jl` package to get the desired result by cross-tabulating `dayname.(dates)` and `ismissing.(rates)`, as shown below.
"""

# ╔═╡ 88401a57-76dd-4f99-8515-522a1f6edfe7
begin
 
end

# ╔═╡ 5a92e307-4b31-4818-abd9-c596ca331ba7
vspace

# ╔═╡ 1be5bbaf-16d4-4d56-8f9d-8d44fc2ac651
md"""
- We can see that we always have missing data for Saturday and Sunday. 
- For all other days, no data is missing except for Thursday. 
- Let’s find which Thursdays are problematic. 
- For this, we create a Boolean vector that finds the indices in our vector that meet both conditions using broadcasting.
"""

# ╔═╡ 0c7ab1ce-0fbd-4a84-9735-e07c463bff79
 

# ╔═╡ 81883771-459b-4c7c-a529-457e5868fb4b
 

# ╔═╡ 97455b0e-da65-4dd7-9811-794a4c1c74c0
md"""
- We can see that a single day meets our condition. 
- It turns out that this date was a national holiday in Poland, so the result seems reasonable.
"""

# ╔═╡ dd053f81-18ad-4bc3-8b19-a9c1c0ebd1a1
vspace

# ╔═╡ 4e378fc9-b49f-4d57-851b-a735fadd5731
md"""
## Plotting the PLN/USD exchange rate
"""

# ╔═╡ f6303f92-d07d-4dad-97ae-9d1bc89b8ba9
md"""
- As a final step, let’s create a plot of the PLN/USD exchange rate. 
- We start with the simplest approach, passing the dates and rates vectors to the plot function.
"""

# ╔═╡ 17feaa79-2394-4cc8-995e-dec9510199e2
begin
 
end

# ╔═╡ d73f83b6-9d32-4c47-93dd-07856660232f
vspace

# ╔═╡ 6b063ab8-8e08-4711-9d45-4f8d890b23d3
md"""
- We can see that this resultdoes not look very nice, as it contains gaps in places where we have missing values in the rates vector.
- To fix the plot, let’s skip the days in both dates and rates vectors in places where the rates vector contains missing values. 
- We can again use the Boolean vector of valid indices. The syntax is slightly tricky.
"""

# ╔═╡ d7bda76c-9a0c-4760-9160-316f9bed705e
begin
 
end

# ╔═╡ 177c6de4-7da1-4b89-ae51-f508341951e5
vspace

# ╔═╡ c576246c-62a7-449c-8653-8c21d5c7d1ef
md"""
- We observe that on the plot’s x-axis, the observations are properly spaced according to their dates. This effectively means that we have linearly interpolated the values for the days for which the data was missing—that is, the dots in the plot are connected by straight lines.
- We can perform linear interpolation of our data by using the `Impute.interp` function from the `Impute.jl` package. 
- Given a vector, this function fills all missing values between two nonmissing values by using linear interpolation.
"""

# ╔═╡ 5412d08d-9232-44fe-aaa6-4970e0795bc9
begin
 
end

# ╔═╡ 41042388-1dd4-4460-941d-a16157432465
vspace

# ╔═╡ 44968590-9898-49f6-925c-864c08a59b76
md"""
- To conclude the analysis, let’s add a scatterplot of dates against the `rates_filled` vector.
"""

# ╔═╡ 6329e073-186a-47f2-b6bc-cb18b963a92a
 

# ╔═╡ 9104b977-144a-47bb-8b90-1864d9de9a47
vspace

# ╔═╡ 44a7664c-a09a-43fe-a1d1-7f80a718074e
md"""
- We can also make the plot prettier.
- Take a lookg at the `Plots.jl` package and the “Attributes” section of its manual at [https://docs.juliaplots.org/stable/attributes/](https://docs.juliaplots.org/stable/attributes/).
"""

# ╔═╡ 2d47eead-9131-44aa-b116-cc1688999945
 

# ╔═╡ 01e35936-1d6d-4ce8-bf38-c80fc22ca825
vspace

# ╔═╡ 53fa5b3c-f3a4-433e-9515-d8919bfc1f18
md"""
# Wrap-Up
"""

# ╔═╡ e3ec2296-6622-4aac-a42c-846d826448f8
begin
html"""
<fieldset>      
<legend>Goals for today</legend>      
<br>
  <input type="checkbox" value="" checked>Fetching data by using HTTP queries. <br>      
<br>
  <input type="checkbox" value="" checked>Parsing JSON data.<br>
<br>
  <input type="checkbox" value="" checked>Working with dates.<br>      
<br>
<input type="checkbox" value="" checked>Handling missing values.<br>      
<br>
<input type="checkbox" value="" checked>Plotting data with missing values.<br>      
<br>
<input type="checkbox" value="" checked>Interpolating missing values.<br>      
</fieldset>      
"""
end

# ╔═╡ 22934d73-3ad2-4e44-8a54-3b3ab6cea1a1
vspace

# ╔═╡ 35e6b686-2daa-40f6-b348-6987406ba95b
# ╠═╡ show_logs = false
begin

	#using Pkg
	#Pkg.upgrade_manifest()
	#Pkg.resolve()
	#Pkg.update()

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

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
LaTeXStrings = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
Logging = "56ddb016-857b-54e1-b83d-db4d58db5568"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
Printf = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[compat]
HypertextLiteral = "~0.9.4"
LaTeXStrings = "~1.3.0"
PlutoUI = "~0.7.34"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "2f3982e6790426a3b153c3898f3b1c946107f201"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Parsers]]
deps = ["Dates", "SnoopPrecompile"]
git-tree-sha1 = "b64719e8b4504983c7fca6cc9db3ebc8acc2a4d6"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "efc140104e6d0ae3e7e30d56c98c4a927154d684"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.48"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SnoopPrecompile]]
git-tree-sha1 = "f604441450a3c0569830946e5b33b78c928e1a85"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.1"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.URIs]]
git-tree-sha1 = "ac00576f90d8a259f2c9d823e91d1de3fd44d348"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─f5450eab-0f9f-4b7f-9b80-992d3c553ba9
# ╟─d7e2e472-6aae-4d12-ab51-d8ed83a2d201
# ╟─822f9a29-2599-4ad6-8902-ad9cc3aab263
# ╟─a2953e7d-a163-4e1f-8c2c-54a6c31e3d1e
# ╟─b9cb6ae7-67e2-4671-a49a-c6d2d10e6766
# ╟─64c2ee7d-a379-46d5-9bff-2152f57fa78c
# ╟─f7428550-fe1b-4749-ad1d-6810f7f136c1
# ╟─fcdb31f2-3f46-4959-99ef-5e1a2185dbf7
# ╟─b68a17d2-a3e7-4379-a441-1ca20a8970c5
# ╟─389d2ee2-450b-44b3-bb4c-9d820b9ecba9
# ╟─f823a6f8-05f3-4df2-8a05-381faecd4b98
# ╟─806aebe8-d7b8-4dde-b5a2-401ec631b444
# ╟─155f8b79-4163-4759-b4d6-2085be2dd77b
# ╟─f3165fda-e453-495e-bd30-1d181e0fbe0f
# ╟─026a08b7-3fdd-4b8d-92a8-2fa2bd9d5047
# ╟─2807c946-1aca-47b7-9c0f-e5d8e6270a0a
# ╟─7d7c0d8e-9beb-420b-b9c2-ec40b5d15d9f
# ╟─03003007-7690-4b3c-ae88-6070c69c5534
# ╟─195bfdc0-3d41-44bc-b1e1-354d09db5bbe
# ╟─d5d035fb-2756-4a01-b343-819e90f55c36
# ╟─597a33a1-e073-4280-87e5-dd69ecd6f862
# ╟─16a77cbc-77fb-4583-a002-7e4cbde93be9
# ╟─45293830-01ac-4d90-98b8-9718f286fcd7
# ╟─0124af48-f9ac-479f-a862-b6f77c168955
# ╟─d374ed0c-19c4-4ef8-a754-0277a87eada6
# ╟─45e525b2-2be4-4ef0-83ca-36f3bc3a4730
# ╟─7f60398a-3c7a-4bc4-ab73-ba721b40905f
# ╟─b08c9d32-4c15-4dfa-a551-46bd79de5652
# ╟─49bfc368-94e2-42a2-b4d3-213336629b28
# ╟─a125d73b-25a7-4ac7-948c-49a81379ff6f
# ╟─859276d4-8b94-4e97-a7be-9e53a780c7d0
# ╠═971f2459-4f97-4e64-bd25-24d831a4d272
# ╠═38bb278a-f905-4168-ab76-7370f0d3137f
# ╟─2ed05013-c555-4206-aa3e-02acd8809254
# ╠═3307f16d-b553-49dd-bd36-c517456d36f7
# ╟─fb7e97cd-7aef-4578-82d5-6fbb66b23a93
# ╟─b820ae55-443d-4b76-8d11-472fc5569a3c
# ╠═7613e884-8392-4aff-991f-cdab4773f3aa
# ╟─e840176c-dd24-4d1e-a8c9-69f599674301
# ╠═5754bd79-5831-4c94-821b-d846bb6186f1
# ╟─8be0843e-af4a-4da2-ba5c-71c7604beb19
# ╟─425901b7-f1d1-4da9-a75e-ca3610d6799d
# ╠═46bb021a-a461-4848-b17b-2ba64fe9e295
# ╠═776cba9f-4cb9-4751-a183-543b1168c4a1
# ╠═baa4746d-dee2-46d3-90db-933af5eee599
# ╠═e1e59fdd-dc73-48cf-9108-28372ba50661
# ╟─a69db56e-2da7-48f8-b38d-ff732455e1ec
# ╟─0eab5cc7-2e6b-4c27-8ef6-e1ea1d946930
# ╠═c8b9dc7f-b4e0-4dbc-92ed-3cb300400669
# ╟─b6c80a1a-3150-45d4-a3b5-acd7b5e17de6
# ╟─9db3d9fc-c848-4348-b6e2-1d46c5333870
# ╟─5600d079-e494-455e-967c-c33ec7ed55a5
# ╟─abd517a3-3e7e-4ca3-952f-d2d0db312cb3
# ╟─ed1004db-2ce0-4e72-ae16-7cbf1e9b9d4b
# ╟─5ae5f571-372b-4f3f-a34b-a36246650309
# ╠═9ac46275-0163-4123-95b7-bc8076d06a41
# ╟─0ade2a38-f7dc-42dd-a89c-adff80ee7334
# ╟─cced3ddf-b1d2-4894-b1a9-1fce29ce19d8
# ╟─ca49f09d-10a1-41c9-99eb-263319cc2de7
# ╟─4690a578-2089-495a-af77-180aa4e1e143
# ╠═98956a7a-4e81-4d69-952e-1d387a9e8056
# ╟─dab2d612-71e0-48df-83d0-da91bd681eb6
# ╠═e9462030-da21-47ce-9a88-be35b54e09fe
# ╟─3f657ea2-b3f6-4281-97fb-d9b22b7475fd
# ╟─a30f3bbd-326d-481d-92a5-dfd24c9b1759
# ╟─52db31ca-ba68-4e5b-b504-d71ab8dbbe5e
# ╟─82c2c7f4-3e69-4800-bb2d-2b82d2403145
# ╠═0084413a-acae-4ccb-a38a-93c48243cfbc
# ╟─5fdb6824-5508-4d8e-a947-6b68fa1f9c04
# ╠═edd1716f-a882-4678-982e-4ad1796c9ad4
# ╟─6a4c45b1-c5ab-48c1-b2d0-77f0ec9c2cc0
# ╟─bc4a619f-bda2-4eaa-b56a-3ea9e2b93fc7
# ╠═1d0dd4b6-6189-4986-a852-25a9e0177a0c
# ╟─288ce3c2-1a63-446e-9fd1-1c64fe752835
# ╟─62fb7d1d-fbd1-431b-9761-bb4b82b63a8d
# ╠═8da702ce-fa95-4d97-882e-9a13a9b5c381
# ╟─4d7adfd5-7817-4cbb-a842-b3008d886801
# ╟─d96c02f0-1e62-40ad-a691-10ed1d935798
# ╟─4cc01d2f-e046-4eea-b945-6f54db2e7711
# ╟─c8299e05-a65e-4393-b170-3a317594604a
# ╟─0896da60-d72f-4474-b5ef-f1e95eb59273
# ╟─406ff58f-6658-4d9a-8d9f-e25ec4a3f07a
# ╟─1c1c0d05-94f6-4fe8-a7c6-c5d2acd4ef20
# ╠═c268b7b0-609f-475a-9358-e99bb1a1284d
# ╠═bcfd13c1-7f34-4f94-ae70-7409c4d3383c
# ╠═8788d094-c3f5-4855-b32c-42d7d37b60a3
# ╟─81db7812-75d4-4f83-bd54-96cca465e38c
# ╟─d22920d4-38db-4a25-945e-713b274ae18a
# ╠═c48f2bc6-1029-440a-86a7-4a17da90ba4b
# ╠═c20b673f-676e-4004-9016-dd7837585df6
# ╟─32f2a06d-1a92-440e-9bc9-93c492719df1
# ╟─3e8c5879-86c1-46b8-acf4-6fb8d347637c
# ╟─8c3c65e0-dad5-4d67-80c6-cf798486a216
# ╠═88401a57-76dd-4f99-8515-522a1f6edfe7
# ╟─5a92e307-4b31-4818-abd9-c596ca331ba7
# ╟─1be5bbaf-16d4-4d56-8f9d-8d44fc2ac651
# ╠═0c7ab1ce-0fbd-4a84-9735-e07c463bff79
# ╠═81883771-459b-4c7c-a529-457e5868fb4b
# ╟─97455b0e-da65-4dd7-9811-794a4c1c74c0
# ╟─dd053f81-18ad-4bc3-8b19-a9c1c0ebd1a1
# ╟─4e378fc9-b49f-4d57-851b-a735fadd5731
# ╟─f6303f92-d07d-4dad-97ae-9d1bc89b8ba9
# ╠═17feaa79-2394-4cc8-995e-dec9510199e2
# ╟─d73f83b6-9d32-4c47-93dd-07856660232f
# ╟─6b063ab8-8e08-4711-9d45-4f8d890b23d3
# ╠═d7bda76c-9a0c-4760-9160-316f9bed705e
# ╟─177c6de4-7da1-4b89-ae51-f508341951e5
# ╟─c576246c-62a7-449c-8653-8c21d5c7d1ef
# ╠═5412d08d-9232-44fe-aaa6-4970e0795bc9
# ╟─41042388-1dd4-4460-941d-a16157432465
# ╟─44968590-9898-49f6-925c-864c08a59b76
# ╠═6329e073-186a-47f2-b6bc-cb18b963a92a
# ╟─9104b977-144a-47bb-8b90-1864d9de9a47
# ╟─44a7664c-a09a-43fe-a1d1-7f80a718074e
# ╠═2d47eead-9131-44aa-b116-cc1688999945
# ╟─01e35936-1d6d-4ce8-bf38-c80fc22ca825
# ╟─53fa5b3c-f3a4-433e-9515-d8919bfc1f18
# ╟─e3ec2296-6622-4aac-a42c-846d826448f8
# ╟─22934d73-3ad2-4e44-8a54-3b3ab6cea1a1
# ╟─35e6b686-2daa-40f6-b348-6987406ba95b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
