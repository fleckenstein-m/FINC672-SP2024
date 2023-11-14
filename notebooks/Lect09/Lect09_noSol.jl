### A Pluto.jl notebook ###
# v0.19.19

using Markdown
using InteractiveUtils

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
	<p align=center style="font-size:25px; font-family:family:Georgia"> <b> Empirical Data Analysis using DataFrames </b> <p>
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

# ╔═╡ f7428550-fe1b-4749-ad1d-6810f7f136c1
vspace

# ╔═╡ fcdb31f2-3f46-4959-99ef-5e1a2185dbf7
begin
html"""
<fieldset>      
<legend>Goals for today</legend>      
<br>
  <input type="checkbox" value="">Know how to summarize cross-sectional data.<br>
<br>
  <input type="checkbox" value="">Learn how to create linear models.<br>      
<br>
<input type="checkbox" value="">Be able to visualize data using different types of plots.<br>      
</fieldset>      
"""
end

# ╔═╡ 6cec07d5-c2c9-45fa-a4e4-21f344b0253e
TableOfContents(aside=true, depth=1)

# ╔═╡ 83806080-8c00-11ec-0f46-01e9cff3af6f
md"""
*Note: The objective of this lecture is to give you an overview of how we can work with tabular data in Julia and how we can use Julia to build econometric models. This means that we will go over many things but will not discuss them deeply. The next lectures will provide a much-more in depth coverage of the topics covered here.*

*This material is adapted from the workshop by Bogumił Kamiński titled  "JuliaCon 2021: DataFrames.jl 1.3 tutorial for Julia 1.7" and available on [Github](https://github.com/bkamins/JuliaCon2021-DataFrames-Tutorial)*

"""

# ╔═╡ 7cb5b824-d3e6-4f95-9d42-850d7a8cc646
vspace

# ╔═╡ a741f424-3d49-4ce0-89ab-bd2bc43adf49
md"""
Load packages
"""

# ╔═╡ 289ed25b-514c-4edf-8c5e-154914805786
# ╠═╡ show_logs = false
begin
	
end

# ╔═╡ 79492b84-0939-45cf-8db9-d2965827b103
md"""
# Labor Force Participation Data
- We will work with the classic labor force participation dataset available here: [Link](https://vincentarelbundock.github.io/Rdatasets/doc/Ecdat/Participation.html).
  - *Reference: Gerfin, Michael (1996) “Parametric and semiparametric estimation of the binary response”, Journal of Applied Econometrics, 11(3), 321-340.*
"""

# ╔═╡ e7c90505-32b1-4be0-8314-639ff27bcb49
md"""
- We first download the file to our working directory. To do this, we use the `Downloads` module.
  - To find out what our working directory is, we can use the `pwd()` command.
"""

# ╔═╡ 84c2afed-1110-423d-88bc-9553071c68e3


# ╔═╡ 1cb09d8c-a575-42a0-9354-c23013622ac0
md"""
- Let's now download the dataset and save it as a .csv file.
"""

# ╔═╡ 61aa2ea3-46a6-4c43-8c71-7733cd4b19b4
begin
	file = raw"https://vincentarelbundock.github.io/Rdatasets/csv/Ecdat/Participation.csv"
	
end

# ╔═╡ 78c749ee-29d1-46f7-9669-e373d4057f5c
md"""
- Next, let's take a glimpse at the raw data.
- We can read the data line-by-line using `readlines(filename)`.
"""

# ╔═╡ 65dceb93-7d78-43dd-b23f-07fd0547df30


# ╔═╡ 89fe8bb4-1425-43ab-b954-c15caec3394e
md"""
- Now, having a sense of the data, let's load it into a DataFrame
"""

# ╔═╡ 08af723b-546b-4926-9101-a932aa2a503f


# ╔═╡ b75492aa-47f1-45ba-8973-9ec1fb296704
md"""
- Next, let's check what the dataset contains. 
- Based on the data description on the source webpage, we expect:
  - lfp: labour force participation ?
  - lnnlinc: the log of nonlabour income
  - age: age in years divided by 10
  - educ: years of formal education
  - nyc: the number of young children (younger than 7)
  - noc: number of older children
  - foreign: foreigner ?
"""

# ╔═╡ 9cba5972-a03e-4c05-9678-dd491ab035cb
md"""
- We can get a description of the variables in the dataset using `describe()`
"""

# ╔═╡ f736bbef-035b-4c82-84f6-18a017076f84


# ╔═╡ eccf7f7d-58ea-4b7a-9fae-f67271fa8066
md"""
- We notice that some variables are not of the correct type. 
  - lfp is a string, instead of a categorical/binary variable.
  - foreign is a string, instead of a categorical variable).
- We also add a new column with the square of `age` (we will see later why).
  - To preview, we are going to build a model predicting the :lfp variable (labor force participation).
"""

# ╔═╡ 812d56e9-e2a6-48de-b93a-a8533a778a04
md"""
- Now, we transform the data set by using the `select` function and perform the following transformations:
  - recode :lfp variable from text to binary.
  - add square of :age column.
  - change :foreign column to be categorical.
  - all other columns are left as they are.
"""

# ╔═╡ 0af12f33-7edb-4682-a322-243321a41ea7
md"""
- Recall that the general syntax for column transformations is:
  - `source columns => transformation => target columns name` 


"""

# ╔═╡ d4fab46d-40ba-4027-865c-399596563932
md"""
- Note that we applied a new "wrapper" function, `ByRow()`. 
- This is because `select` operates on entire colums by default.
- The `ByRow()` wrapper tells `select` to perform the operation row-wise.
"""

# ╔═╡ 0a4e500b-1e0d-49b7-bd5a-acbbe03cf9f9


# ╔═╡ 4046c2e8-b240-4dfe-abb0-0cbfec5e358b
md"""
- Let's now check the summary statistics again.
"""

# ╔═╡ aa30b527-30f3-4c1f-b374-cfaf693aa70e


# ╔═╡ 26a92ab1-642e-4bdd-aa04-4fdc299e4fcf
vspace

# ╔═╡ 965946dd-6308-493f-b412-d8b2a8107a45
md"""
# Exploratory Data Analysis
"""

# ╔═╡ 1e55aabe-fffb-4c34-ab6a-847996165b10
md"""
- We are now ready to explore the data.
- To begin, let's compute the mean of numeric columns by the value :lfp to initialy check in what direction they influence the target (i.e. labor force participation).
"""

# ╔═╡ f001c6c6-566a-4063-b369-08d2d249378a
md"""
- To do this, we will learn a new package which makes this type of aggregations more convenient.
- This package is called `Chain.jl`
- In addition, we also now learn how to `group` data and how to compute summary statistics for each group.
"""

# ╔═╡ 320f862b-9361-46e9-98d2-c591bd25cc45
md"""
- Specifically,  
  - the `@chain` macro from the `Chain.jl` package allows for convenient *piping* of operations.
    - Note that we load this package at the top by typing `using Chain`.
  - the `groupby` function groups the DataFrame by the passed column (basically, it adds a key column to the data frame).
  - the `combine` function that combines the rows of a data frame by some function
"""

# ╔═╡ 8212cbcd-4755-48bd-abae-c4923e6920c9


# ╔═╡ 69db7d0c-c9c3-46fd-b678-dce3030150e4
md"""
- Let's understand what is going on in the last Pluto cell.
- To begin, let's consider the transformation in combine.

`[:lnnlinc, :age, :educ, :nyc, :noc] .=> mean`

   - this is a convenient way to specify *multiple* similar transformations using the broadcasting syntax.
"""

# ╔═╡ 73fd420b-6ecd-4e27-9f67-76e65e848bd6
md"""
- If we did not want to list all the columns manually we could have written (note that :lfp was included as it is binary):
"""

# ╔═╡ da0ae244-dc0f-47d7-9ea9-b6f9b64abc81


# ╔═╡ fdad70e5-c5ca-4773-b852-20a1f69ff190
md"""
- In the previous Pluto cell the `names(df,Real)` takes all the column names, but keeps only numeric columns.
"""

# ╔═╡ 68630364-7add-41af-8fb3-f66bf403d9d4
md"""
- Now, let's take the categorical variable `:foreign` and tabulate `lfp` and `foreign`.
"""

# ╔═╡ 0e6c6fd5-a4d6-494d-acdc-0aae30c46bc4


# ╔═╡ bf19dc6b-5b61-473b-9654-87e020ddb9cb
md"""
- Next, if we want to create a cross-tabulation of the data we can put:
  - the `:lfp` variable as rows,
  - the `:foreign` variable as columns,
  - the `:nrow` variable as values,
    - Note: `nrow` is simply the number of rows with (lfp,foreign) combinations.
"""

# ╔═╡ b130b35e-f270-49e9-9b71-1284d91d36a7


# ╔═╡ 2053fb13-d922-448c-9766-9c04e80a1933
md"""
- Finally let us add another step to our `@chain`, which will create a fraction of `:yes` answers in each group.
"""

# ╔═╡ f1c535a8-4faf-453c-b207-7254a5fe5d25


# ╔═╡ b8b26c20-b69c-4a55-b6a7-807367c0e8b1
md"""
- Let's understand what is happening in the last Pluto cell.
- Note that in this example we pass more than one column to a transformation function.
  - This is done using `[:no,:yes] => ByRow( (x,y) -> ...)`
  - We have used this concept before in our Tabular Data lecture.
"""

# ╔═╡ 5843a27c-a144-41ca-b9b8-1df252e3accb
md"""
- Note: There is a shortcut to achieving the same result. As a homework try

@chain df begin \
     groupby(:lfp)\
    combine(:foreign => (x -> mean(x .== "yes")) => :foreign_yes)\
end

"""

# ╔═╡ eb636545-bcc1-4ed0-ac68-9aaa6e0b2b97
md"""
- What happens when we are grouping data using `groupby`?
- A `GroupedDataFrame` is created by the groupby function 
- This can be a useful object to work with on its own.
- Let's illustrate this.
"""

# ╔═╡ 20357f8b-cf7a-4011-83eb-a2b1172d8f65


# ╔═╡ 8b31d6ed-3570-4eb1-98b8-d45d2bb987a4
md"""
- A nice thing is that we can conveniently index into it to get the groups.
- First, let's use the standard indexing syntax to get the first group.
"""

# ╔═╡ 9c4480c4-9aae-4a1a-ba8f-f4ee9e72e819


# ╔═╡ 37ae597a-b6cc-4d50-95b1-8549c29554ea
md"""
- There is an alternative way, which might be more intuitive.
- Specifically, we can use special indexing syntax that efficiently selects groups by their *value* (not position).
"""

# ╔═╡ 240f9da5-b9b6-4be5-839d-273d5088ab8d


# ╔═╡ 721a8092-9820-4bc4-a312-fa39345a6f02
md"""
- Anther way is using `Dicts`.
"""

# ╔═╡ 208cbadf-92b7-414f-8966-2c25a61584c3


# ╔═╡ 488a3998-0ad5-4890-bbd2-38c3b62bc220
md"""
- Another way is, 
"""

# ╔═╡ 709b0aa4-9602-4d1e-8485-7089cc2737d9


# ╔═╡ 360bdf1c-7c03-4466-8641-82e7206db918
md"""
- Before we move forward and think about predicting labor force participation, let's talk about why we have added a square of :age to our data frame.
"""

# ╔═╡ f30aa6e6-0bc7-4bf3-83aa-c45fd5565286
md"""
- For this we use `density` plot from the `StatsPlots.jl` package. 
- This package contains statistical recipies that extend the `Plots.jl` functionality (which we have covered before).
  - Note that we load this package at the top by writing `using StatsPlots`.
"""

# ╔═╡ 166bd7b1-eb82-4518-bdf5-64b59d110e19


# ╔═╡ 0f722f77-ad0b-4f5c-9302-02e5b46d4490
md"""
- We just used a shortcut `@df` which allows us to pass a DataFrame directly to the plot function.
- We can then use column names as arguments for the x and y coordinates.
"""

# ╔═╡ 828005a7-7b66-4ae9-b322-aa74ac096d57
vspace

# ╔═╡ 670f7ce3-a4fb-4255-b896-3236fab13c08
md"""
# Predictive Modeling
"""

# ╔═╡ 80060354-e098-4060-a686-2eed184fc5d5
md"""
- Our goal will be to predict labor force participation using a probit model.
- To do this, we will make our first encounter with regression models in Julia using the `GLM.jl` package.
- Let's set up the model first, and then unpack the syntax.
"""

# ╔═╡ c718c398-574e-499b-aac9-967e458f5523


# ╔═╡ 9b3af7d5-04ea-4b17-b09c-005076419814
md"""
- The first ingredient is a formula for the model, we would like to estimate.
- By writing `lfp ~ lnnlinc + age + age² + educ + nyc + noc + foreign` we are relating labor forace participation to `age`, `age²`, `educ`, `nyc`, `noc`, and `foreign`.
- We are using a probit model, because we are interesting in the likelihood that someone is participating in the labor market conditional on these variables.
- To do this, we use `glm()` and use the option `Binomial()` and `ProbitLink()`.
"""

# ╔═╡ e3838f2d-b475-4364-bdfd-6e3e359eeff5
md"""
- The `GLM.jl` package allows us to investigate the formula
"""

# ╔═╡ 26c9044d-2297-4b07-9731-f3e228012956


# ╔═╡ 247c8c27-ca85-435f-a06e-f887f4af194f
md"""
- As a final remark, note that `@formula` is powerful enough to automatically do the computation of the square of `:age`:
"""

# ╔═╡ db420ef3-4c4f-449b-b405-bdba546861bc


# ╔═╡ 441350d4-2f69-40f8-9386-a729649ffe83
md"""
- Note that we need to use the variable name `probit_b` in the previous Pluto cell, to avoid an error due to multiple definitions of `probit`. Recall that each variable can only be defined once in the notebook.
"""

# ╔═╡ e85ee840-5d26-48cb-bdd6-9a3f09f10d88
md"""
Next we prepare a new data frame in which we will check how the prediction of our model changes as we modify `:age` while keeping all other variables constant:
"""

# ╔═╡ 0dfcaf2e-797c-4fd8-b6ac-a2a4b129f10b


# ╔═╡ 24ab7511-948d-4f66-a58d-e8ffe0565e9e
md"""
- Next, let's make a prediction and compute its confidence interval:
"""

# ╔═╡ e5ff9c0a-5464-4d6b-b11c-d6bfa4ae730b


# ╔═╡ 424660c4-5b8d-4cf4-a987-112d7217d6fb
md"""
- Let's now plot the results.
- Note that we use Matrix constructor to create a matrix out of the data frame easily:
"""

# ╔═╡ 440b7ce9-daa1-4f82-8267-b79dc94546f8


# ╔═╡ b68a17d2-a3e7-4379-a441-1ca20a8970c5
vspace

# ╔═╡ 43bfb2aa-f225-41be-b5c4-8ab88237fa7a
md"""
# Wrap-Up
"""

# ╔═╡ e3ec2296-6622-4aac-a42c-846d826448f8
begin
html"""
<fieldset>      
<legend>Goals for today</legend>      
<br>
  <input type="checkbox" value="" checked>Know how to summarize cross-sectional data.<br>
<br>
  <input type="checkbox" value="" checked>Learn how to create linear models.<br>      
<br>
<input type="checkbox" value="" checked>Be able to visualize data using different types of plots.<br>      
</fieldset>      
"""
end

# ╔═╡ 22934d73-3ad2-4e44-8a54-3b3ab6cea1a1
vspace

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
git-tree-sha1 = "6f4fbcd1ad45905a5dee3f4256fabb49aa2110c6"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.7"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "5bb5129fdd62a2bbbe17c2756932259acf467386"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.50"

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
git-tree-sha1 = "074f993b0ca030848b897beff716d93aca60f06a"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.2"

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
# ╟─d7e2e472-6aae-4d12-ab51-d8ed83a2d201
# ╟─822f9a29-2599-4ad6-8902-ad9cc3aab263
# ╟─a2953e7d-a163-4e1f-8c2c-54a6c31e3d1e
# ╟─f7428550-fe1b-4749-ad1d-6810f7f136c1
# ╟─fcdb31f2-3f46-4959-99ef-5e1a2185dbf7
# ╟─6cec07d5-c2c9-45fa-a4e4-21f344b0253e
# ╟─83806080-8c00-11ec-0f46-01e9cff3af6f
# ╟─7cb5b824-d3e6-4f95-9d42-850d7a8cc646
# ╟─a741f424-3d49-4ce0-89ab-bd2bc43adf49
# ╠═289ed25b-514c-4edf-8c5e-154914805786
# ╟─79492b84-0939-45cf-8db9-d2965827b103
# ╟─e7c90505-32b1-4be0-8314-639ff27bcb49
# ╠═84c2afed-1110-423d-88bc-9553071c68e3
# ╟─1cb09d8c-a575-42a0-9354-c23013622ac0
# ╠═61aa2ea3-46a6-4c43-8c71-7733cd4b19b4
# ╟─78c749ee-29d1-46f7-9669-e373d4057f5c
# ╠═65dceb93-7d78-43dd-b23f-07fd0547df30
# ╟─89fe8bb4-1425-43ab-b954-c15caec3394e
# ╠═08af723b-546b-4926-9101-a932aa2a503f
# ╟─b75492aa-47f1-45ba-8973-9ec1fb296704
# ╟─9cba5972-a03e-4c05-9678-dd491ab035cb
# ╠═f736bbef-035b-4c82-84f6-18a017076f84
# ╟─eccf7f7d-58ea-4b7a-9fae-f67271fa8066
# ╟─812d56e9-e2a6-48de-b93a-a8533a778a04
# ╟─0af12f33-7edb-4682-a322-243321a41ea7
# ╟─d4fab46d-40ba-4027-865c-399596563932
# ╠═0a4e500b-1e0d-49b7-bd5a-acbbe03cf9f9
# ╟─4046c2e8-b240-4dfe-abb0-0cbfec5e358b
# ╠═aa30b527-30f3-4c1f-b374-cfaf693aa70e
# ╟─26a92ab1-642e-4bdd-aa04-4fdc299e4fcf
# ╟─965946dd-6308-493f-b412-d8b2a8107a45
# ╟─1e55aabe-fffb-4c34-ab6a-847996165b10
# ╟─f001c6c6-566a-4063-b369-08d2d249378a
# ╟─320f862b-9361-46e9-98d2-c591bd25cc45
# ╠═8212cbcd-4755-48bd-abae-c4923e6920c9
# ╟─69db7d0c-c9c3-46fd-b678-dce3030150e4
# ╟─73fd420b-6ecd-4e27-9f67-76e65e848bd6
# ╠═da0ae244-dc0f-47d7-9ea9-b6f9b64abc81
# ╟─fdad70e5-c5ca-4773-b852-20a1f69ff190
# ╟─68630364-7add-41af-8fb3-f66bf403d9d4
# ╠═0e6c6fd5-a4d6-494d-acdc-0aae30c46bc4
# ╟─bf19dc6b-5b61-473b-9654-87e020ddb9cb
# ╠═b130b35e-f270-49e9-9b71-1284d91d36a7
# ╟─2053fb13-d922-448c-9766-9c04e80a1933
# ╠═f1c535a8-4faf-453c-b207-7254a5fe5d25
# ╟─b8b26c20-b69c-4a55-b6a7-807367c0e8b1
# ╟─5843a27c-a144-41ca-b9b8-1df252e3accb
# ╟─eb636545-bcc1-4ed0-ac68-9aaa6e0b2b97
# ╠═20357f8b-cf7a-4011-83eb-a2b1172d8f65
# ╟─8b31d6ed-3570-4eb1-98b8-d45d2bb987a4
# ╠═9c4480c4-9aae-4a1a-ba8f-f4ee9e72e819
# ╟─37ae597a-b6cc-4d50-95b1-8549c29554ea
# ╠═240f9da5-b9b6-4be5-839d-273d5088ab8d
# ╟─721a8092-9820-4bc4-a312-fa39345a6f02
# ╠═208cbadf-92b7-414f-8966-2c25a61584c3
# ╟─488a3998-0ad5-4890-bbd2-38c3b62bc220
# ╠═709b0aa4-9602-4d1e-8485-7089cc2737d9
# ╟─360bdf1c-7c03-4466-8641-82e7206db918
# ╟─f30aa6e6-0bc7-4bf3-83aa-c45fd5565286
# ╠═166bd7b1-eb82-4518-bdf5-64b59d110e19
# ╟─0f722f77-ad0b-4f5c-9302-02e5b46d4490
# ╟─828005a7-7b66-4ae9-b322-aa74ac096d57
# ╟─670f7ce3-a4fb-4255-b896-3236fab13c08
# ╟─80060354-e098-4060-a686-2eed184fc5d5
# ╠═c718c398-574e-499b-aac9-967e458f5523
# ╟─9b3af7d5-04ea-4b17-b09c-005076419814
# ╟─e3838f2d-b475-4364-bdfd-6e3e359eeff5
# ╠═26c9044d-2297-4b07-9731-f3e228012956
# ╟─247c8c27-ca85-435f-a06e-f887f4af194f
# ╠═db420ef3-4c4f-449b-b405-bdba546861bc
# ╟─441350d4-2f69-40f8-9386-a729649ffe83
# ╟─e85ee840-5d26-48cb-bdd6-9a3f09f10d88
# ╠═0dfcaf2e-797c-4fd8-b6ac-a2a4b129f10b
# ╟─24ab7511-948d-4f66-a58d-e8ffe0565e9e
# ╠═e5ff9c0a-5464-4d6b-b11c-d6bfa4ae730b
# ╟─424660c4-5b8d-4cf4-a987-112d7217d6fb
# ╠═440b7ce9-daa1-4f82-8267-b79dc94546f8
# ╟─b68a17d2-a3e7-4379-a441-1ca20a8970c5
# ╟─43bfb2aa-f225-41be-b5c4-8ab88237fa7a
# ╟─e3ec2296-6622-4aac-a42c-846d826448f8
# ╟─22934d73-3ad2-4e44-8a54-3b3ab6cea1a1
# ╟─35e6b686-2daa-40f6-b348-6987406ba95b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
