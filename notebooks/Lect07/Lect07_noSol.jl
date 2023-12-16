### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ cddc45e1-7547-4d34-bc12-b08a5320a62c
# ╠═╡ show_logs = false
begin

	using PlutoUI, Printf, LaTeXStrings, HypertextLiteral


	using Pkg
	# Pkg.upgrade_manifest()
	Pkg.update()
	Pkg.resolve()
	
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

# ╔═╡ fe1d90f9-f2b7-4e5f-9925-2ad9be4f9124
html"""
	<p align=left style="font-size:32px; font-family:family:Georgia"> <b> FINC 672: Workshop in Finance - Empirical Methods</b> <p>
	"""

# ╔═╡ aa8283c1-5be7-4fda-b5c6-ed1d7018e11e
html"""
	<p style="padding-bottom:1cm"> </p>
	<div align=center style="font-size:25px; font-family:family:Georgia"> FINC-672: Workshop in Finance - Empirical Methods </div>
	<p style="padding-bottom:1cm"> </p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> <b> Data Visualization </b> <p>
	<p style="padding-bottom:1cm"> </p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> Spring 2024 <p>
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
	<input type="checkbox" value=""> Visualize Data using `Plots.jl`
	<br>
	<br>
	</fieldset>      
	"""
end

# ╔═╡ 0f35a402-6904-4d1a-9402-239c76248b6c
vspace

# ╔═╡ bc94035a-795b-4d08-aab2-87519b4ffd65
md"""
# Plotting in Julia
"""

# ╔═╡ ff38d22d-8256-4011-81b3-f12ce37063f5
md"""
- We are going to use `Plots.jl` for visualizing data. We can only scratch the surface of what plotting options are available. For a complete reference, see the [package documentation](https://docs.juliaplots.org/stable/).
- To use this package, we first need to install it. Recall that we do this with the Julia package manager as follows.
"""

# ╔═╡ 8037e582-9582-4fa4-8c24-3c1b0964885c


# ╔═╡ 6c74efc7-2614-49c4-84ab-f84cd3cf6982
md"""
#
"""

# ╔═╡ 6e3c9009-8f39-4f18-8791-767817c5cc7e
md"""
- After installing Plots.jl, we need to select a plotting backed. Basically, we just need to tell Plots.jl which program to use to make plots.
  - For more information on plotting backends, see [https://docs.juliaplots.org/latest/backends](https://docs.juliaplots.org/latest/backends).
- Let's select the `GR` backend.
"""

# ╔═╡ cfeb3a9c-e866-41cf-a1f8-a76111cbf180
md"""
#
"""

# ╔═╡ 0b101ee0-310f-4ee9-912d-381a54ed422d
md"""
- Now we are ready to make a first plot. Let’s start with a simple line plot.
- As an example, let’s plot the continously-compounded discount-factor curve, assuming that the applicable interest rate is 5% (per annum, continously compounded).
- Recall from your prior finance classes that the continuously compounded discount factor for time $t$ is $D(t) = \exp(-r\,t)$, where $r$ is the continuously compounded interest rate.
- Let’s plot $D(t)$ using $r = 0.05$ for $t = 1\ldots 30$ years in 3-month increments.
"""

# ╔═╡ ba3adc0f-597c-4929-8960-fe68bedb6b52
md"""
#
"""

# ╔═╡ 625d0fcb-6f9f-48bc-a6f3-f933c04be33e
let

end

# ╔═╡ 37cfe8ab-5118-4ed7-b970-e0ceb15365e4
md"""
#
"""

# ╔═╡ 50a8b403-8ef5-4ac4-a539-06a681b43b9d
md"""
- Let’s take this step by step.
- First, we simply set r = 0:05 and initialize the time t vector which runs from $t$ = 0.25 (i.e. 3-month from now) to $t$ = 30 years (i.e. 30 years from now). 
  - Note that we use the colon `:` to create a range that starts at 0.25 and increases by 0.25 each step, i.e. we get 0.25, 0.50, 0.75, 1.00, ..., 30.
- Second, we calculate the discount factors using the dot operator `.` which just means that we apply `exp()` to each $r \cdot t$ value.
- Finally, we can plot $t$ on the horizontal axis and $D(t)$ on the vertical axis, simply by calling `plot(t,Dt)`.
- We use `linecolor="blue"` to set the color, and we use `linewidth=3` to set the line thickness.
- By using `xlabel` and `ylabel` we add labels on the x-Axis and the y-Axis.
"""

# ╔═╡ 47edfb3e-2ea3-4f80-b6d5-eea7a9a3e9eb
md"""
#
"""

# ╔═╡ 607ef46d-1112-40c7-80b3-916e68ccbba5
md"""
- Next, let’s plot multiple graphs in one plot. To illustrate, we will simulate multiple paths of daily prices of a stock over a period of one month from March 1, 2022 to March 31, 2022. 
- Recall from prior finance classes, that we often model stock prices as random walks. We will let Julia generate random numbers for us, which we will use to calculate the paths of the random walk.
- To generate random numbers from a standard normal distribution, we use Random.jl package by calling using Random
- First, we set a seed which basically initializes the random number generator.
"""

# ╔═╡ 927788eb-e6f5-4c4c-bb7f-0452b3b39588


# ╔═╡ 024b5b54-7071-4f7a-86ea-5b7b5d27de2f


# ╔═╡ 01293b84-0962-440a-89ca-28bfdac7af6f
md"""
#
"""

# ╔═╡ 3b91f388-b779-454e-9a60-c29b35c6ea81
md"""Next, let’s create our vector of days which is going to be our horizontal axis.
We need 31 days
"""

# ╔═╡ 36113682-6103-43a8-afde-93029e59a65d


# ╔═╡ 38c583e3-b6b3-4c98-b6af-54e0d03dcdd1
md"""
#
"""

# ╔═╡ 96dc8878-dcd1-4a13-9fa1-46b4bd963507
md"""
- Next, let’s set the initial stock price ($S_0$) to 100.
- We generate random draws from a standard normal distribution by calling the `randn()` function, which takes as input parameter how many random numbers we want to generate.
- In our example, we need to simulate stock prices for 31 days (days=31).
- These random draws are the daily changes in the stock price.
- Finally, to get the path of the stock price over the month, we need to take the cumulative changes of the stock price and add those to the initial price. 
- We achieve this by calling cumsum which simply returns the cumulative sum of an input vector. 
- Let’s simulate three paths
"""

# ╔═╡ d7e7984d-632f-463b-8437-b6b8e5bcb043
md"""
#
"""

# ╔═╡ a843edb5-a719-4577-b8ca-3e8cad41451c
begin

end

# ╔═╡ 97b48fc8-a02e-4d84-9aaf-6e0814cdc2e1
md"""
#
"""

# ╔═╡ 17fefb05-d754-4484-ae3e-e08728371b5f
md"""
- Finally, we are all set to plot the stock paths.
- Note that we label the individual paths using the label statement and use the legend statement to place the plot legend in the bottom left corner. 
- `xrotation=45` just means that we rotate the labels for the days by 45 degrees.
"""

# ╔═╡ e9d5f5fb-f8f0-40fa-8c8d-d04a911cf145
md"""
#
"""

# ╔═╡ 2171cde6-2f3e-4068-bfa0-e8b54e80ad8c
begin

end

# ╔═╡ f9873815-95cf-4fa1-b352-6d95f7b462fb
vspace

# ╔═╡ db242f6e-45e7-4f69-9c1d-b8a7aed918cb
md"""
## Two vertical axes


"""

# ╔═╡ e44ab7dd-5f28-4e81-a256-c171f0c5a6b1
let

end

# ╔═╡ 430d7661-05f0-4169-b02c-554f36207d78
let

end

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
	<input type="checkbox" value="" checked> Visualize Data using `Plots.jl`
	<br>
	<br>
	</fieldset>      
	"""
end

# ╔═╡ 5f191192-bc5f-41e8-845c-beba89ee5841
vspace

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
LaTeXStrings = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
Logging = "56ddb016-857b-54e1-b83d-db4d58db5568"
Pkg = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
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

julia_version = "1.9.4"
manifest_format = "2.0"
project_hash = "6b6c3dd8246a30b04854d2ce30c3f3718dd6ec8c"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "793501dcd3fa7ce8d375a2c878dca2296232686e"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.2.2"

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
version = "1.0.5+0"

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
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "d75853a0bdbfb1ac815478bacd89cd27b550ace6"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.3"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.LaTeXStrings]]
git-tree-sha1 = "50901ebc375ed41dbf8058da26f9de442febbbec"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.1"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.4.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
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
version = "2.28.2+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.10.11"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "a935806434c9d4c506ba941871b327b96d41f2bf"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.9.2"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "bd7c69c7f7173097e7b5e1be07cee2b8b7447f51"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.54"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "03b4c25b43cb84cee5c90aa9b5ea0a78fd848d2f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.0"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00805cd429dcb4870060ff49ef443486c262e38e"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.1"

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

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.9.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "Pkg", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "5.10.1+6"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "eae1bb484cd63b36999ee58be2de6c178105112f"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.8"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.52.0+1"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─fe1d90f9-f2b7-4e5f-9925-2ad9be4f9124
# ╟─aa8283c1-5be7-4fda-b5c6-ed1d7018e11e
# ╟─ab6ac8d0-6d8a-11ed-0400-1b357312718e
# ╟─42d2dc69-c5e8-4cb8-809b-19cae75e479d
# ╟─0f35a402-6904-4d1a-9402-239c76248b6c
# ╟─bc94035a-795b-4d08-aab2-87519b4ffd65
# ╟─ff38d22d-8256-4011-81b3-f12ce37063f5
# ╠═8037e582-9582-4fa4-8c24-3c1b0964885c
# ╟─6c74efc7-2614-49c4-84ab-f84cd3cf6982
# ╟─6e3c9009-8f39-4f18-8791-767817c5cc7e
# ╟─cfeb3a9c-e866-41cf-a1f8-a76111cbf180
# ╟─0b101ee0-310f-4ee9-912d-381a54ed422d
# ╟─ba3adc0f-597c-4929-8960-fe68bedb6b52
# ╠═625d0fcb-6f9f-48bc-a6f3-f933c04be33e
# ╟─37cfe8ab-5118-4ed7-b970-e0ceb15365e4
# ╟─50a8b403-8ef5-4ac4-a539-06a681b43b9d
# ╟─47edfb3e-2ea3-4f80-b6d5-eea7a9a3e9eb
# ╟─607ef46d-1112-40c7-80b3-916e68ccbba5
# ╠═927788eb-e6f5-4c4c-bb7f-0452b3b39588
# ╠═024b5b54-7071-4f7a-86ea-5b7b5d27de2f
# ╟─01293b84-0962-440a-89ca-28bfdac7af6f
# ╟─3b91f388-b779-454e-9a60-c29b35c6ea81
# ╠═36113682-6103-43a8-afde-93029e59a65d
# ╟─38c583e3-b6b3-4c98-b6af-54e0d03dcdd1
# ╟─96dc8878-dcd1-4a13-9fa1-46b4bd963507
# ╟─d7e7984d-632f-463b-8437-b6b8e5bcb043
# ╠═a843edb5-a719-4577-b8ca-3e8cad41451c
# ╟─97b48fc8-a02e-4d84-9aaf-6e0814cdc2e1
# ╟─17fefb05-d754-4484-ae3e-e08728371b5f
# ╟─e9d5f5fb-f8f0-40fa-8c8d-d04a911cf145
# ╠═2171cde6-2f3e-4068-bfa0-e8b54e80ad8c
# ╟─f9873815-95cf-4fa1-b352-6d95f7b462fb
# ╟─db242f6e-45e7-4f69-9c1d-b8a7aed918cb
# ╠═e44ab7dd-5f28-4e81-a256-c171f0c5a6b1
# ╠═430d7661-05f0-4169-b02c-554f36207d78
# ╟─a124bf84-7ca4-40c8-8607-b05dec24a730
# ╟─75672e0c-5c34-44c8-b1a9-f6ba821d6c8d
# ╟─5f191192-bc5f-41e8-845c-beba89ee5841
# ╟─cddc45e1-7547-4d34-bc12-b08a5320a62c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
