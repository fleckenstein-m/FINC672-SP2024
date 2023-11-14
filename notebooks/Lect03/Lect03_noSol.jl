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

# ╔═╡ 57cb0c12-e132-43f4-8d8a-1cb6149b0963
html"""
	<p align=left style="font-size:32px; font-family:family:Georgia"> <b> FINC 672: Workshop in Finance - Empirical Methods</b> <p>
	"""

# ╔═╡ d7513630-1d64-4ef6-a417-7d7d65f888f1
html"""
	<p style="padding-bottom:1cm"> </p>
	<div align=center style="font-size:25px; font-family:family:Georgia"> FINC-672: Workshop in Finance - Empirical Methods </div>
	<p style="padding-bottom:1cm"> </p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> <b> Julia Data Structures II </b> <p>
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
	<input type="checkbox" value=""> Broadcasting Operators and Functions
	<br>
	<input type="checkbox" value=""> Comprehensions
	<br>
	<input type="checkbox" value=""> Iteration
	<br>
	<input type="checkbox" value=""> Matrices
	<br>
	<br>
	</fieldset>      
	"""
end

# ╔═╡ 6ce01efd-8846-4c63-b41d-dbd2bea213b1
vspace

# ╔═╡ cc7cbf20-9ab5-41e1-967a-f426183246a5
md"""
# Broadcasting
"""

# ╔═╡ 72eaafb9-4130-43fa-b2c5-536509aa5bd5
md"""
- For mathematical operations, like `*` (multiplication) or `+` (addition), we can broadcast it using the dot operator `.`
- For example, broadcasted addition would imply changing the `+` to `.+`
"""

# ╔═╡ c5568d49-9a87-4224-bdf5-4365d77a44e4


# ╔═╡ 422dd2fc-9103-4fab-8e0a-e5026c7c221e
md"""
#
"""

# ╔═╡ fb14b35e-894f-4212-85e0-cbc15b029699
md"""
- It also works with functions automatically.
- Let’s use the logarithm function
"""

# ╔═╡ c772d04b-c584-45b0-8935-b8c643fa19b3


# ╔═╡ 9b42d9b9-6a21-4b77-8a86-2176c642a31f
md"""
#
"""

# ╔═╡ 3f510cf6-1412-493a-944a-ce6a97e10c58
md"""
- We can broadcast operators.
"""

# ╔═╡ 93ea5c80-8dc9-42f7-860a-09a797ae4047
begin

end

# ╔═╡ 448bb57c-95c9-4bbc-8e06-5b177802b5eb
md"""
#
"""

# ╔═╡ 43d8ae9e-2673-4e58-8f9a-879da43d1239
md"""
- We can use `map` to apply a function to every element of an array.
"""

# ╔═╡ 0539004a-3552-4f7d-b13a-8161a247c00a


# ╔═╡ 24be1cc2-e132-477f-92dc-5defe2d3de4b
md"""
#
"""

# ╔═╡ c671e317-3d47-4f33-a7a8-3e0389d3b883
md"""
- It also accepts an anonymous function
"""

# ╔═╡ f80aa11f-6246-4d36-92e3-8673b07e3d11


# ╔═╡ 80402620-7794-44f3-b31d-5d33e64995e1
md"""
#
"""

# ╔═╡ 51a6042d-3999-423a-ac54-71ed9d856474
md"""
- It also works with slicing
"""

# ╔═╡ e21e99b0-507c-461d-8219-71c703f9f163


# ╔═╡ dadc0dbe-ce9c-4285-b26c-fb64a80923d2
md"""
#
"""

# ╔═╡ f7beec98-52e5-4d0b-9785-b5fc2db99470
md"""
- Finally, sometimes, and specially when dealing with tabular data, we want to apply a function over all elements in a specific array dimension.
- This can be done with the `mapslices` function.
- Similar to map, the first argument is the function and the second argument is the array.
- The only change is that we need to specify the dims argument to flag what dimension we want to transform the elements.
- For example let’s use `mapslice` with the sum function on both rows (dims=1) and columns (dims=2).
"""

# ╔═╡ 78fd769b-a6b2-46b6-94ea-3370a5bc326c
md"""
#
"""

# ╔═╡ 2079c244-bf83-4c61-9842-cbb7c2bb159d


# ╔═╡ 1d6c6e65-86ef-4db6-8f5b-058289b275a1


# ╔═╡ 5a4d3d4f-83f2-41c9-a19f-9c1ff1cb7b60
md"""
# Comprehensions
"""

# ╔═╡ 1f4d07cc-38cf-4104-8085-e7ee9ef9d5e9
md"""
- It is often useful to use a comprehension as a basic programming construct.
- A typical form of a comprehension is: `[f(x) for x in A]`
"""

# ╔═╡ 95260162-89e5-47e8-9583-1562a2b77aac


# ╔═╡ 7dcc6788-30f6-42ce-9671-858568bca59b
md"""
# Array Comprehensions
"""

# ╔═╡ 7b6c4d93-8cc7-4821-bd3e-dc3369c46086
md"""
- Another powerful way to create arrays are `array comprehensions`.
- You specify what you want to do inside the `[]` brackets.
- For example, say we want to create a vector of squares from 1 to 100.
"""

# ╔═╡ b748c58b-1484-4060-9b49-502b298152fb


# ╔═╡ 6aa79928-1a44-4baa-bd42-f229c4687076
md"""
#
"""

# ╔═╡ 9c3b32a2-2cef-4af8-8906-c80afab33a40
md"""
- They also support multiple inputs
"""

# ╔═╡ 28e29d50-66ac-46ba-bb2b-1039b4fa2d4d


# ╔═╡ 0d49845b-dc0d-4a80-9bd2-496cc6abc92d
md"""
- And conditionals.
"""

# ╔═╡ 09e409ab-d985-49ee-9005-88e0546ab767


# ╔═╡ 7b5d928f-b21b-45d8-9afe-623f8b863998
md"""
#
"""

# ╔═╡ cbe904d1-6bae-4d5d-94a6-8ba7458c6c49
md"""
- As with array literals you can specify your desired type before the `[]` brackets
"""

# ╔═╡ b2c048cb-43a7-4e17-9766-d664967e8195


# ╔═╡ 7e666183-bd75-4ddb-b51c-fad757f6fd8c
md"""
# Array Iteration
"""

# ╔═╡ 53c8d369-91cd-4bca-97b0-89583aedf21b
md"""
- One common operation is to iterate over an array with a `for` loop.
- The regular for `loop` over an array returns each element.
"""

# ╔═╡ c119e9a3-4710-4751-8fac-6bf49725ee13
let

end

# ╔═╡ 4e8b241b-19b6-4081-acbf-8f617f700029
md"""
#
"""

# ╔═╡ 384f7801-28c0-45cd-bd09-5d13cb1f1cbd
md"""
- Sometimes you don’t want to loop over each element, but actually over each array index. 
- We can use the `eachindex` function combined with a for `loop` to iterate over each array index.
"""

# ╔═╡ 39f96d90-5d40-4a20-b033-3303d856538b
let

end

# ╔═╡ 49c44c27-bc74-42ca-ac14-a916c9b71723
md"""
# Matrix Iteration
"""

# ╔═╡ 48983b39-90f0-488d-94a1-990e04ba3322
md"""
- Iterating over matrices involves more details.
- The standard for `loop` goes first over columns then over rows.
- It will first traverse all elements in column 1, from the first row to the last row, then it will move to column 2 in a similar fashion until it has covered all columns.
"""

# ╔═╡ cab0f2ae-447d-4623-a804-110206275849
md"""
#
"""

# ╔═╡ 792eb8bf-b2bf-44a6-bbbd-b4f9353bf0b8
md"""
- First example.
"""

# ╔═╡ 1c2b0dcf-912a-4738-8023-20569ab30b4f
let

end

# ╔═╡ 98b07f4a-3bfe-49d5-a2f1-cdf97078b795
md"""
#
"""

# ╔═╡ 8b23904c-2c16-4d54-b746-1b180c38217a
md"""
- Second example.
"""

# ╔═╡ 96e71174-fdb3-417f-8a3e-d841e2f6ffcf
let

end

# ╔═╡ a931a810-7882-4718-97dc-70d11217d8e6
md"""
#
"""

# ╔═╡ 328e958b-2acb-41cf-beda-85e6c04807fb
md"""
- There are some handy functions to iterate over matrices.
- `eachcol`: iterates over an array column first.
- `eachrow`: iterates over an array row first.
"""

# ╔═╡ eb1e8ba7-ca57-4780-85a5-277ffd33f7b4
md"""
#
"""

# ╔═╡ a85da6f5-ee7c-4f44-9db0-7c406f1bcf80
md"""
- Example with `eachcol`
"""

# ╔═╡ 30bf2b50-0703-42d7-a591-050530b655fd
let

end


# ╔═╡ f4535587-3ac3-4d6d-a3d3-b867d946e583
md"""
#
"""

# ╔═╡ 94338483-74a1-478a-badc-84431f8dfe45
md"""
- Example with `eachrow`
"""

# ╔═╡ 358fbc00-485f-4f21-ab7c-a2f431fef8b5
let

end


# ╔═╡ a62e8e7a-01bc-446e-b9c5-7db3faad8109
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
	<input type="checkbox" value="" checked> Broadcasting Operators and Functions
	<br>
	<input type="checkbox" value="" checked> Comprehensions
	<br>
	<input type="checkbox" value="" checked> Iteration
	<br>
	<input type="checkbox" value="" checked> Matrices
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
# ╟─57cb0c12-e132-43f4-8d8a-1cb6149b0963
# ╟─d7513630-1d64-4ef6-a417-7d7d65f888f1
# ╟─ab6ac8d0-6d8a-11ed-0400-1b357312718e
# ╟─42d2dc69-c5e8-4cb8-809b-19cae75e479d
# ╟─6ce01efd-8846-4c63-b41d-dbd2bea213b1
# ╟─cc7cbf20-9ab5-41e1-967a-f426183246a5
# ╟─72eaafb9-4130-43fa-b2c5-536509aa5bd5
# ╠═c5568d49-9a87-4224-bdf5-4365d77a44e4
# ╟─422dd2fc-9103-4fab-8e0a-e5026c7c221e
# ╟─fb14b35e-894f-4212-85e0-cbc15b029699
# ╠═c772d04b-c584-45b0-8935-b8c643fa19b3
# ╟─9b42d9b9-6a21-4b77-8a86-2176c642a31f
# ╟─3f510cf6-1412-493a-944a-ce6a97e10c58
# ╠═93ea5c80-8dc9-42f7-860a-09a797ae4047
# ╟─448bb57c-95c9-4bbc-8e06-5b177802b5eb
# ╟─43d8ae9e-2673-4e58-8f9a-879da43d1239
# ╠═0539004a-3552-4f7d-b13a-8161a247c00a
# ╟─24be1cc2-e132-477f-92dc-5defe2d3de4b
# ╟─c671e317-3d47-4f33-a7a8-3e0389d3b883
# ╠═f80aa11f-6246-4d36-92e3-8673b07e3d11
# ╟─80402620-7794-44f3-b31d-5d33e64995e1
# ╟─51a6042d-3999-423a-ac54-71ed9d856474
# ╠═e21e99b0-507c-461d-8219-71c703f9f163
# ╟─dadc0dbe-ce9c-4285-b26c-fb64a80923d2
# ╟─f7beec98-52e5-4d0b-9785-b5fc2db99470
# ╟─78fd769b-a6b2-46b6-94ea-3370a5bc326c
# ╠═2079c244-bf83-4c61-9842-cbb7c2bb159d
# ╠═1d6c6e65-86ef-4db6-8f5b-058289b275a1
# ╟─5a4d3d4f-83f2-41c9-a19f-9c1ff1cb7b60
# ╟─1f4d07cc-38cf-4104-8085-e7ee9ef9d5e9
# ╠═95260162-89e5-47e8-9583-1562a2b77aac
# ╟─7dcc6788-30f6-42ce-9671-858568bca59b
# ╟─7b6c4d93-8cc7-4821-bd3e-dc3369c46086
# ╠═b748c58b-1484-4060-9b49-502b298152fb
# ╟─6aa79928-1a44-4baa-bd42-f229c4687076
# ╟─9c3b32a2-2cef-4af8-8906-c80afab33a40
# ╠═28e29d50-66ac-46ba-bb2b-1039b4fa2d4d
# ╟─0d49845b-dc0d-4a80-9bd2-496cc6abc92d
# ╠═09e409ab-d985-49ee-9005-88e0546ab767
# ╟─7b5d928f-b21b-45d8-9afe-623f8b863998
# ╟─cbe904d1-6bae-4d5d-94a6-8ba7458c6c49
# ╠═b2c048cb-43a7-4e17-9766-d664967e8195
# ╟─7e666183-bd75-4ddb-b51c-fad757f6fd8c
# ╟─53c8d369-91cd-4bca-97b0-89583aedf21b
# ╠═c119e9a3-4710-4751-8fac-6bf49725ee13
# ╟─4e8b241b-19b6-4081-acbf-8f617f700029
# ╟─384f7801-28c0-45cd-bd09-5d13cb1f1cbd
# ╠═39f96d90-5d40-4a20-b033-3303d856538b
# ╟─49c44c27-bc74-42ca-ac14-a916c9b71723
# ╟─48983b39-90f0-488d-94a1-990e04ba3322
# ╟─cab0f2ae-447d-4623-a804-110206275849
# ╟─792eb8bf-b2bf-44a6-bbbd-b4f9353bf0b8
# ╠═1c2b0dcf-912a-4738-8023-20569ab30b4f
# ╟─98b07f4a-3bfe-49d5-a2f1-cdf97078b795
# ╟─8b23904c-2c16-4d54-b746-1b180c38217a
# ╠═96e71174-fdb3-417f-8a3e-d841e2f6ffcf
# ╟─a931a810-7882-4718-97dc-70d11217d8e6
# ╟─328e958b-2acb-41cf-beda-85e6c04807fb
# ╟─eb1e8ba7-ca57-4780-85a5-277ffd33f7b4
# ╟─a85da6f5-ee7c-4f44-9db0-7c406f1bcf80
# ╠═30bf2b50-0703-42d7-a591-050530b655fd
# ╟─f4535587-3ac3-4d6d-a3d3-b867d946e583
# ╟─94338483-74a1-478a-badc-84431f8dfe45
# ╠═358fbc00-485f-4f21-ab7c-a2f431fef8b5
# ╟─a62e8e7a-01bc-446e-b9c5-7db3faad8109
# ╟─a124bf84-7ca4-40c8-8607-b05dec24a730
# ╟─75672e0c-5c34-44c8-b1a9-f6ba821d6c8d
# ╟─5f191192-bc5f-41e8-845c-beba89ee5841
# ╟─cddc45e1-7547-4d34-bc12-b08a5320a62c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002