### A Pluto.jl notebook ###
# v0.19.19

using Markdown
using InteractiveUtils

# ╔═╡ cddc45e1-7547-4d34-bc12-b08a5320a62c
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

# ╔═╡ 3e72d672-8f55-4958-af43-6a43c3bbf830
#add button to trigger presentation mode
html"<button onclick='present()'>present</button>"

# ╔═╡ c60f08e1-972d-4591-80f7-c190a671a076
html"""
	<p align=left style="font-size:32px; font-family:family:Georgia"> <b> FINC 672: Workshop in Finance - Empirical Methods</b> <p>
	"""

# ╔═╡ c10cd397-71c5-434f-9588-e2e773fc7a54
html"""
	<p style="padding-bottom:1cm"> </p>
	<div align=center style="font-size:25px; font-family:family:Georgia"> FINC-672: Workshop in Finance - Empirical Methods </div>
	<p style="padding-bottom:1cm"> </p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> <b> Dates and Missing Values </b> <p>
	<p style="padding-bottom:1cm"> </p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> Spring 2023 <p>
	<p style="padding-bottom:0.5cm"> </p>
	<div align=center style="font-size:20px; font-family:family:Georgia"> Prof. Matt Fleckenstein </div>
	<p style="padding-bottom:0.05cm"> </p>
	<div align=center style="font-size:20px; font-family:family:Georgia"> University of Delaware, 
	Lerner College of Business and Economics </div>
	<p style="padding-bottom:0.5cm"> </p>
	"""

# ╔═╡ ab6ac8d0-6d8a-11ed-0400-1b357312718e
vspace

# ╔═╡ 42d2dc69-c5e8-4cb8-809b-19cae75e479d
begin
	html"""
	<fieldset>      
    <legend><b>Learning Objectives</b></legend>      
	<br>
	<input type="checkbox" value=""> Dates
	<br>
	<input type="checkbox" value=""> Operations with Date Types
	<br>
	<input type="checkbox" value=""> Missing Values
	<br>
	<br>
	</fieldset>      
	"""
end

# ╔═╡ a8f53dc1-ab88-4a6c-bf47-c8c23ce10db5
vspace

# ╔═╡ bc94035a-795b-4d08-aab2-87519b4ffd65
md"""
# Dates
"""

# ╔═╡ 25a404ef-b21a-4d43-b87b-f4348d9bb219
md"""
- To work with dates in Julia, we import the `Dates` module from the Julia standard library by calling: `using Dates`.
- The Dates standard library module has two types for working with dates: 
  - `Date`: representing time in days; and
  - `DateTime`: representing time in millisecond precision.
- We construct `Date` and `DateTime` with the default constructor by specifying an integer to represent year, month, day, hours and so on.
- Let’s do a few examples.
"""

# ╔═╡ 208ceabf-48cf-4156-8169-5eb50629dfed
md"""
#
"""

# ╔═╡ 92484abd-8f77-479a-a7df-34aec0e7471a


# ╔═╡ 3cce218e-2f82-4e4f-9c29-c21f6ae30070


# ╔═╡ 1cd244de-d00e-4fb5-bafd-3cbc981a0e55


# ╔═╡ 202263bb-7da6-40d4-8386-e3c3a2c93e6b


# ╔═╡ 5ed0aace-5cea-4658-8879-0ebb1781270a
md"""
#
"""

# ╔═╡ ee3f943a-a988-479c-86d3-dc9252f88a03


# ╔═╡ 34aaacc9-26b4-4280-8a78-c890cfeebc6d


# ╔═╡ 6b387a90-454d-4507-8406-4acebdff8a3d
md"""
- Note: the `#` is used to put a comment in executable code. It does nothing, but commenting your code is good practice.
"""

# ╔═╡ 1a1a6276-6875-46e4-a54a-7b2d7a8f2e52
md"""
#
"""

# ╔═╡ d3f3a63f-d70a-4f48-a965-33bf045a4913
md"""
- In working with dates, it is useful to be able to use Periods. 
- Julia defines the following types that we will use often in working with financial data.
"""

# ╔═╡ 67c9c70e-2f01-421b-9499-c05665297929


# ╔═╡ f3cc4855-00db-4776-a4b7-f9496f2db477
md"""
# Parsing Dates
"""

# ╔═╡ d5061181-9903-415e-bfa5-4fa69f9860ec
md"""
- Next, we need to discuss `parsing` Dates.
- This just means that when we are given a dataset where dates are written in a specific format (e.g. "20210131" or "01-31-2022"), we need to tell Julia how to interpret these date formats.
- Let’s consider an example where our dataset has a date written as 20210131. 
- How can we tell Julia that this number refers to January 31, 2021?
"""

# ╔═╡ ba52fe3d-ea89-444a-a7fe-73ef0128ab34
md"""
#
"""

# ╔═╡ 05abb0c7-31e0-48f1-b351-9183ea76acc8


# ╔═╡ 5ccbbe98-5730-4f22-9124-68a9008ba584
md"""
- We just use the `Date` constructor, and specify the date format as "yyyymmdd".
- Here, yyyy represents the year (i.e. 2021). 
- mm represents the month (i.e. 01).
- dd represents the day (i.e. 31).
"""

# ╔═╡ e0c53b00-0a47-4ad5-87a0-48bdd0b898e5
md"""
#
"""

# ╔═╡ 7e16dbfd-27c3-47c3-a456-68b2ef9a41ef
md"""
- We now know how to construct Dates in Julia.
- Next, we want to extract information such as the year, month, day, weekday etc. from a given Date. 
- To illustrate some useful functions that Julia provides, let’s suppose we have a  bond with maturity date on May 15, 2025.
"""

# ╔═╡ 19494b19-85ac-4f85-ac8d-259063bee8b3
md"""
#
"""

# ╔═╡ 9bec3db8-f354-4a52-8988-f69c97323e6a


# ╔═╡ 6252f2dd-6a17-41fb-8ef0-60ed2680dbf6


# ╔═╡ 6545645f-23e1-4e6d-9371-1bc02a42f28a


# ╔═╡ 8ad73b90-d59a-4531-a23b-1a2cb116a28e


# ╔═╡ ef2dd650-8e39-4b62-8617-9a4362f61d01
md"""
#
"""

# ╔═╡ 89200a30-4c88-421d-b143-40010f887424
md"""
- We can also see the day of the week and other handy stuff.
"""

# ╔═╡ eae8cf8f-3c44-4098-b790-1594f62230e4


# ╔═╡ 5cc4913b-2f84-4383-bcc2-dfdd2dd5f6d6


# ╔═╡ 85362a92-e6ac-4dd2-af8a-23a2a1f5acaa
md"""
#
"""

# ╔═╡ 6a8e79b2-11c0-4056-a36d-89e3c0aed3c4
md"""
- We can perform operations in Dates instances.
- For example, we can add days to a Date or DateTime instance.
- Julia's `Dates` will automatically perform the adjustments necessary for leap years, and for months with 30 or 31 days.
"""

# ╔═╡ 7fd42963-2f5d-4e46-8dee-ec202db9be80


# ╔═╡ b6d1cfda-f81b-4754-9418-2c36ab518400


# ╔═╡ 60c84e90-79de-4abc-9995-27a00814570e
md"""
#
"""

# ╔═╡ 0c2fb01b-866e-47eb-b64c-ad8a9c1704b3
md"""
- To get date duration, we just use the subtraction `-` operator.
- To count the number of days between today and the maturity date of the bond, we can use the today function.
"""

# ╔═╡ c287b86a-4e6f-4431-b2da-9b45922a9103


# ╔═╡ 4afbe891-959a-4e81-878a-8df219a273bf
md"""
# Date Intervals
"""

# ╔═╡ be5e6ea8-38c1-4023-92ea-8ea6d5523656
md"""
- The last example, introduced the concept of Date Intervals.
- We can also easily construct date and time intervals.
- Suppose you want to create a Day interval. We do this with the colon `:` operator.
"""

# ╔═╡ 15402f0c-dfe2-4ece-b386-3334d68a0d6b


# ╔═╡ 161a5f84-3486-488b-916f-e17fded7d98a
md"""
#
"""

# ╔═╡ c33806c8-f9e1-4e96-b87b-fb028659985b
md"""
- We can _materialize_ the range by using `collect`.
"""

# ╔═╡ 5b3e3625-53f4-4971-bd75-681605e77942


# ╔═╡ b21fc5bd-e3b1-4bb3-9415-08c46d08fd7e
md"""
#
"""

# ╔═╡ 6eb16423-e32e-46c8-be5c-a89538e317f4
md"""
- There is nothing special in using `Day(1)` as the interval.
- We can use whatever Period type as interval.
- For example, using 3 days as the interval.
"""

# ╔═╡ b5818ab1-323a-4a5e-9e64-0d38f337019e


# ╔═╡ f25cc225-a7f7-4f3c-81c5-6aba1367d2e7
md"""
#
"""

# ╔═╡ 7d22f7fa-2873-43ee-ac7c-39bf028b412f
md"""
- Months work just as well.
"""

# ╔═╡ ca030b6e-393d-4050-b16b-1a229593f9b9


# ╔═╡ 08b6d651-6dbe-4e58-800e-19ed88ccf103
md"""
#
"""

# ╔═╡ 52ece9f2-d3f7-4608-96e5-3147b49a4217
md"""
- Again, note that in the previous examples, we created a range (actually a StepRange).
- We can convert this to a vector with the `collect` function.
"""

# ╔═╡ c67b56d3-4e71-43cd-96e9-66547c1c1304
begin

end

# ╔═╡ e2eec73e-cf44-45e1-a9a2-957ec64d3414
md"""
#
"""

# ╔═╡ 72d42ade-a001-4e9c-979f-7884b442f3f1
md"""
- After we have materialized the range to a Vector, we have all the array functionalities available. 
- For example, indexing:
"""

# ╔═╡ 423c9b4b-bd31-4618-81f6-77d4b1784780


# ╔═╡ 6f4f72d7-bf55-4d8f-8c30-6e5ac3ab3dfc
md"""
#
"""

# ╔═╡ a25d456a-4fd7-40d2-8e0b-09607424b5e2
md"""
- We can also broadcast date operations to our vector of Dates. 
- We already know that we do this by using the dot-operator `.`
"""

# ╔═╡ 18e5ffc8-5aaf-492a-b1a8-9d7faf1715d6


# ╔═╡ c9a5f8a6-3c95-4f4d-86e0-dac0b01483df
md"""
#
"""

# ╔═╡ 01334a18-cd46-4b6f-bab1-46d887cae0a2
md"""
- This was just the tip of the iceberg...
- There are many more functions available in Julia to work with dates.
- Best place to find out more is the manual: [Julia Dates](https://docs.julialang.org/en/v1/stdlib/Dates/).
"""

# ╔═╡ 7f837c37-1f11-451d-a212-4ec8fe98b0ce
md"""
# Missing Values
"""

# ╔═╡ 5f470f66-787d-4c0d-91e4-45ecfd3fd765
md"""
- Missing values are represented in Julia using `missing` that has type `Missing`.
- As is explained in the section on Missing Values of the Julia Manual:
`Julia provides support for representing missing values in the statistical sense, that is for situations where no value is available for a variable in an observation, but a valid value theoretically exists.`
"""

# ╔═╡ f4ac91f7-2c6d-4707-a863-d744f7f15311
md"""
#
"""

# ╔═╡ b25096f8-e9a0-4782-89a0-dbe5dc299fa9
md"""
- Typical problems with missing values include comparisons, mathematical operations, using functions on missing values, etc.
- Let's explore the behavior of `missing` values.
- The first principle is that many functions silently propagate missing, that is, if they get `missing` as an input, they return `missing` in their output. Here are a few examples:
"""

# ╔═╡ e339e3a3-d124-4a8d-bf1c-5d64a55e8a7b


# ╔═╡ 7b479dee-e73d-4605-b09e-de70ab3960e3


# ╔═╡ 96badf91-6d00-4d3a-a1e4-8c709dd03b8b
md"""
#
"""

# ╔═╡ 917fc9b9-a4d9-4051-a887-36b4d124029b
md"""
- One important case of missing propagation is in the context of tests that should produce a `Bool` value.
  - Note, this behavior is often called [three-valued-logic](https://docs.julialang.org/en/v1/manual/missing/#Logical-operators), as you can get `true`, `false`, or `missing` from a logical operation.
"""

# ╔═╡ deab2091-4bfb-443a-a0ef-c29f92fdbb06


# ╔═╡ 29c8bd6a-4c5a-41e1-96db-0fb32e9269ba


# ╔═╡ 29d1f58d-842d-4522-8946-57d813dc1b6d


# ╔═╡ 7c0f0333-21a6-4c75-b35d-c0d2e6ada54c
md"""
#
"""

# ╔═╡ 57ff1063-9842-4769-84df-4a1d35e4ab79
md"""
- In the context of logical tests, we must be careful if we potentially have missing data. The reason is that passing missing as a condition to the conditional statement produces an error.
"""

# ╔═╡ f46e3aca-f7d3-46e1-a488-73419b486c76
let

end

# ╔═╡ cfe87ac9-a5d2-47ba-938e-bd0275abfffe


# ╔═╡ 8cc614dc-c019-4e87-9f5c-8470e8d55324
md"""
#
"""

# ╔═╡ 32ae19a3-33b9-4621-be62-d8b68ca6cad8
md"""
- The design of handling missing in Julia requires you to _explicitly_ decide if in such a case missing should be treated as `true` or `false`.
- The use of `coalesce` is most common with handling logical conditions. 
- If you write `coalesce(condition, true)` you say that if condition evaluates to `missing` you want this `missing` to be treated as `true`. 
- Similarly, `coalesce(condition, false)` means that you want to treat `missing` as false. Here is an example:
"""

# ╔═╡ 7fa73e47-2d80-4b77-bb4b-3d4016c90a29


# ╔═╡ 66a1bb0a-d424-4ddd-8e0d-e4ccdf362635


# ╔═╡ 9f067d53-82df-41e6-b21f-a9b21d8671dd
md"""
# Replacing Missing Values in Collections
"""

# ╔═╡ 8ec7e1ee-2404-4800-8554-7b9e0031c9fb
md"""
- Assume you have a vector that has some missing values in it:
"""

# ╔═╡ 3114e44d-8920-405d-a31b-db8e723a52de


# ╔═╡ 5379829e-0431-4099-ac8f-bde6d6740b5f
md"""
- The `x` vector contains both integers and missing values, therefore its element type is `Union{Missing, Int64}`. 
- Assume we want to replace all `missing` values by `0`. This is easily done by  broadcasting the coalesce function.
"""

# ╔═╡ 23e22307-cb91-4378-b9bc-8c2012065ad4


# ╔═╡ d049b64c-231f-49c0-89a7-7d26e4cf8a10
md"""
# Skipping Missing Values in Computations
"""

# ╔═╡ a34782fa-e947-43df-a4d0-77b4bbc498be
md"""
- The fact that `missing` values are propagated is also sometimes undesired if they are hidden in the collections like vector `x`. 
- Consider, for example, the `sum` function:
"""

# ╔═╡ ac8d70f0-6c91-4e6f-b1f9-facda9b9dd4f


# ╔═╡ 4e140ca3-41df-493b-8653-57335fa648ae
md"""
#
"""

# ╔═╡ 47c47f7d-344d-4702-8a8a-4fcbaefc4b90
md"""
- The result is logically correct. We had missing values we wanted to add, so the result is unknown. 
- However, very commonly we might want to add all the non-missing values in the vector. To do this, use the `skipmissing` function to create a wrapper around the `x` vector.
"""

# ╔═╡ db6114e0-f40e-4bdf-855e-68618720de7a


# ╔═╡ f2d7aa7b-4ad4-4d63-bf24-5effd198c3aa
md"""
# Enabling Missing Propagation in a Function
"""

# ╔═╡ 68e9829b-0c3b-486f-8ecb-9e508b4d0334
md"""
- One final scenario of missing propagation are functions that do not propagate `missing` values by default because their designers have decided against it. 
- Let us write a simple function having this behavior.
"""

# ╔═╡ 32858b13-fc6b-4b09-aabb-d64f154476a4


# ╔═╡ 5b771350-cf18-46fa-b4c2-0284c35a4474
md"""
#
"""

# ╔═╡ 710c7b54-33d6-4cf8-a75d-666148abbea3
md"""
- This function accepts only Int values as arguments, it errors if it gets a missing value
"""

# ╔═╡ 71b35df1-7027-457e-9898-92574cd5b40d


# ╔═╡ e8bd96c0-16dc-4aa8-9491-b48312ea5ae6
fun(1, missing

# ╔═╡ f6a809a3-2757-48f3-9e9c-44468ebd20e2
md"""
#
"""

# ╔═╡ 02508477-d091-47c9-a700-7b021c4189cb
md"""
- However, we may want to create another function, based on the original one that propagates missing values. This feature is provided by the `passmissing` function from the `Missings.jl` package. 
- Here is an example how it can be used:
"""

# ╔═╡ d09946cf-2e63-4d7e-b6fe-ff856f45b137


# ╔═╡ 1ac7681f-4974-4619-9de1-4b0028b25998
md"""
#
"""

# ╔═╡ 118499e5-31bb-4480-ac80-def165ad76ae


# ╔═╡ d1e9c4b9-d33f-424b-bc2d-c978ddab671a


# ╔═╡ 12d48c64-3478-441c-b2ba-73c5ba89362b


# ╔═╡ 218615f8-f703-486d-8ee2-bad0a270f43d
md"""
#
"""

# ╔═╡ 15a8a7fd-0bc1-403b-90fa-a5dc0eebcd35
md"""
- Let's take this step by step.
- The idea is very simple. The `passmissing` function takes a function as its argument and returns a new function. 
- The returned function, `fun2` in our case, returns `missing` if any of its positional arguments are missing. Otherwise, it calls fun with the passed arguments.
"""

# ╔═╡ 39f91a24-c0ef-4756-b17d-bcd93acb386d
md"""
#
"""

# ╔═╡ 87e86d06-dbf6-4132-8bcf-408e741470c1
md"""
- Now we know the basic functionalities of the Julia language that are built around the `missing` value. 
- To learn more, refer to the Julia Manual [https://docs.julialang.org/en/v1/manual/missing/](https://docs.julialang.org/en/v1/manual/missing/) or the documentation of the [Missings.jl](https://github.com/JuliaData/Missings.jl).
"""

# ╔═╡ a3e46f17-3d1f-4050-9b34-64daab01865b
vspace

# ╔═╡ a124bf84-7ca4-40c8-8607-b05dec24a730
md"""
# Wrap-Up
"""

# ╔═╡ 75672e0c-5c34-44c8-b1a9-f6ba821d6c8d
begin
	html"""
	<fieldset>      
    <legend><b>Learning Objectives</b></legend>      
	<br>
	<input type="checkbox" value="" checked> Dates
	<br>
	<input type="checkbox" value="" checked> Operations with Date Types
	<br>
	<input type="checkbox" value="" checked> Missing Values
	<br>
	<br>
	</fieldset>      
	"""
end

# ╔═╡ 5f191192-bc5f-41e8-845c-beba89ee5841
md"""
#
"""

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
PlutoUI = "~0.7.49"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "fde4819cc39136b7b8ab39e68b38535ecaf5dde0"

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
git-tree-sha1 = "8175fc2b118a3755113c8e68084dc1a9e63c61ee"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.3"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "eadad7b14cf046de6eb41f13c9275e5aa2711ab6"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.49"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

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
deps = ["Preferences"]
git-tree-sha1 = "e760a70afdcd461cf01a575947738d359234665c"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.3"

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
# ╟─3e72d672-8f55-4958-af43-6a43c3bbf830
# ╟─c60f08e1-972d-4591-80f7-c190a671a076
# ╟─c10cd397-71c5-434f-9588-e2e773fc7a54
# ╟─ab6ac8d0-6d8a-11ed-0400-1b357312718e
# ╟─42d2dc69-c5e8-4cb8-809b-19cae75e479d
# ╟─a8f53dc1-ab88-4a6c-bf47-c8c23ce10db5
# ╟─bc94035a-795b-4d08-aab2-87519b4ffd65
# ╟─25a404ef-b21a-4d43-b87b-f4348d9bb219
# ╟─208ceabf-48cf-4156-8169-5eb50629dfed
# ╠═92484abd-8f77-479a-a7df-34aec0e7471a
# ╠═3cce218e-2f82-4e4f-9c29-c21f6ae30070
# ╠═1cd244de-d00e-4fb5-bafd-3cbc981a0e55
# ╠═202263bb-7da6-40d4-8386-e3c3a2c93e6b
# ╟─5ed0aace-5cea-4658-8879-0ebb1781270a
# ╠═ee3f943a-a988-479c-86d3-dc9252f88a03
# ╠═34aaacc9-26b4-4280-8a78-c890cfeebc6d
# ╟─6b387a90-454d-4507-8406-4acebdff8a3d
# ╟─1a1a6276-6875-46e4-a54a-7b2d7a8f2e52
# ╟─d3f3a63f-d70a-4f48-a965-33bf045a4913
# ╠═67c9c70e-2f01-421b-9499-c05665297929
# ╟─f3cc4855-00db-4776-a4b7-f9496f2db477
# ╟─d5061181-9903-415e-bfa5-4fa69f9860ec
# ╟─ba52fe3d-ea89-444a-a7fe-73ef0128ab34
# ╠═05abb0c7-31e0-48f1-b351-9183ea76acc8
# ╟─5ccbbe98-5730-4f22-9124-68a9008ba584
# ╟─e0c53b00-0a47-4ad5-87a0-48bdd0b898e5
# ╟─7e16dbfd-27c3-47c3-a456-68b2ef9a41ef
# ╟─19494b19-85ac-4f85-ac8d-259063bee8b3
# ╠═9bec3db8-f354-4a52-8988-f69c97323e6a
# ╠═6252f2dd-6a17-41fb-8ef0-60ed2680dbf6
# ╠═6545645f-23e1-4e6d-9371-1bc02a42f28a
# ╠═8ad73b90-d59a-4531-a23b-1a2cb116a28e
# ╟─ef2dd650-8e39-4b62-8617-9a4362f61d01
# ╟─89200a30-4c88-421d-b143-40010f887424
# ╠═eae8cf8f-3c44-4098-b790-1594f62230e4
# ╠═5cc4913b-2f84-4383-bcc2-dfdd2dd5f6d6
# ╟─85362a92-e6ac-4dd2-af8a-23a2a1f5acaa
# ╟─6a8e79b2-11c0-4056-a36d-89e3c0aed3c4
# ╠═7fd42963-2f5d-4e46-8dee-ec202db9be80
# ╠═b6d1cfda-f81b-4754-9418-2c36ab518400
# ╟─60c84e90-79de-4abc-9995-27a00814570e
# ╟─0c2fb01b-866e-47eb-b64c-ad8a9c1704b3
# ╠═c287b86a-4e6f-4431-b2da-9b45922a9103
# ╟─4afbe891-959a-4e81-878a-8df219a273bf
# ╟─be5e6ea8-38c1-4023-92ea-8ea6d5523656
# ╠═15402f0c-dfe2-4ece-b386-3334d68a0d6b
# ╟─161a5f84-3486-488b-916f-e17fded7d98a
# ╟─c33806c8-f9e1-4e96-b87b-fb028659985b
# ╠═5b3e3625-53f4-4971-bd75-681605e77942
# ╟─b21fc5bd-e3b1-4bb3-9415-08c46d08fd7e
# ╟─6eb16423-e32e-46c8-be5c-a89538e317f4
# ╠═b5818ab1-323a-4a5e-9e64-0d38f337019e
# ╟─f25cc225-a7f7-4f3c-81c5-6aba1367d2e7
# ╟─7d22f7fa-2873-43ee-ac7c-39bf028b412f
# ╠═ca030b6e-393d-4050-b16b-1a229593f9b9
# ╟─08b6d651-6dbe-4e58-800e-19ed88ccf103
# ╟─52ece9f2-d3f7-4608-96e5-3147b49a4217
# ╠═c67b56d3-4e71-43cd-96e9-66547c1c1304
# ╟─e2eec73e-cf44-45e1-a9a2-957ec64d3414
# ╟─72d42ade-a001-4e9c-979f-7884b442f3f1
# ╠═423c9b4b-bd31-4618-81f6-77d4b1784780
# ╟─6f4f72d7-bf55-4d8f-8c30-6e5ac3ab3dfc
# ╟─a25d456a-4fd7-40d2-8e0b-09607424b5e2
# ╠═18e5ffc8-5aaf-492a-b1a8-9d7faf1715d6
# ╟─c9a5f8a6-3c95-4f4d-86e0-dac0b01483df
# ╟─01334a18-cd46-4b6f-bab1-46d887cae0a2
# ╟─7f837c37-1f11-451d-a212-4ec8fe98b0ce
# ╟─5f470f66-787d-4c0d-91e4-45ecfd3fd765
# ╟─f4ac91f7-2c6d-4707-a863-d744f7f15311
# ╟─b25096f8-e9a0-4782-89a0-dbe5dc299fa9
# ╠═e339e3a3-d124-4a8d-bf1c-5d64a55e8a7b
# ╠═7b479dee-e73d-4605-b09e-de70ab3960e3
# ╟─96badf91-6d00-4d3a-a1e4-8c709dd03b8b
# ╟─917fc9b9-a4d9-4051-a887-36b4d124029b
# ╠═deab2091-4bfb-443a-a0ef-c29f92fdbb06
# ╠═29c8bd6a-4c5a-41e1-96db-0fb32e9269ba
# ╠═29d1f58d-842d-4522-8946-57d813dc1b6d
# ╟─7c0f0333-21a6-4c75-b35d-c0d2e6ada54c
# ╟─57ff1063-9842-4769-84df-4a1d35e4ab79
# ╠═f46e3aca-f7d3-46e1-a488-73419b486c76
# ╠═cfe87ac9-a5d2-47ba-938e-bd0275abfffe
# ╟─8cc614dc-c019-4e87-9f5c-8470e8d55324
# ╟─32ae19a3-33b9-4621-be62-d8b68ca6cad8
# ╠═7fa73e47-2d80-4b77-bb4b-3d4016c90a29
# ╠═66a1bb0a-d424-4ddd-8e0d-e4ccdf362635
# ╟─9f067d53-82df-41e6-b21f-a9b21d8671dd
# ╟─8ec7e1ee-2404-4800-8554-7b9e0031c9fb
# ╠═3114e44d-8920-405d-a31b-db8e723a52de
# ╟─5379829e-0431-4099-ac8f-bde6d6740b5f
# ╠═23e22307-cb91-4378-b9bc-8c2012065ad4
# ╟─d049b64c-231f-49c0-89a7-7d26e4cf8a10
# ╟─a34782fa-e947-43df-a4d0-77b4bbc498be
# ╠═ac8d70f0-6c91-4e6f-b1f9-facda9b9dd4f
# ╟─4e140ca3-41df-493b-8653-57335fa648ae
# ╟─47c47f7d-344d-4702-8a8a-4fcbaefc4b90
# ╠═db6114e0-f40e-4bdf-855e-68618720de7a
# ╟─f2d7aa7b-4ad4-4d63-bf24-5effd198c3aa
# ╟─68e9829b-0c3b-486f-8ecb-9e508b4d0334
# ╠═32858b13-fc6b-4b09-aabb-d64f154476a4
# ╟─5b771350-cf18-46fa-b4c2-0284c35a4474
# ╟─710c7b54-33d6-4cf8-a75d-666148abbea3
# ╠═71b35df1-7027-457e-9898-92574cd5b40d
# ╠═e8bd96c0-16dc-4aa8-9491-b48312ea5ae6
# ╟─f6a809a3-2757-48f3-9e9c-44468ebd20e2
# ╟─02508477-d091-47c9-a700-7b021c4189cb
# ╠═d09946cf-2e63-4d7e-b6fe-ff856f45b137
# ╟─1ac7681f-4974-4619-9de1-4b0028b25998
# ╠═118499e5-31bb-4480-ac80-def165ad76ae
# ╠═d1e9c4b9-d33f-424b-bc2d-c978ddab671a
# ╠═12d48c64-3478-441c-b2ba-73c5ba89362b
# ╟─218615f8-f703-486d-8ee2-bad0a270f43d
# ╟─15a8a7fd-0bc1-403b-90fa-a5dc0eebcd35
# ╟─39f91a24-c0ef-4756-b17d-bcd93acb386d
# ╟─87e86d06-dbf6-4132-8bcf-408e741470c1
# ╟─a3e46f17-3d1f-4050-9b34-64daab01865b
# ╟─a124bf84-7ca4-40c8-8607-b05dec24a730
# ╟─75672e0c-5c34-44c8-b1a9-f6ba821d6c8d
# ╟─5f191192-bc5f-41e8-845c-beba89ee5841
# ╟─cddc45e1-7547-4d34-bc12-b08a5320a62c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
