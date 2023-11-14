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

# ╔═╡ ea237d72-175a-40da-a35c-017d894ed8c0
html"""
	<p align=left style="font-size:32px; font-family:family:Georgia"> <b> FINC 672: Workshop in Finance - Empirical Methods</b> <p>
	"""

# ╔═╡ b71ed765-a596-45cd-9c29-cbb3d4cba1a4
html"""
	<p style="padding-bottom:1cm"> </p>
	<div align=center style="font-size:25px; font-family:family:Georgia"> FINC-672: Workshop in Finance - Empirical Methods </div>
	<p style="padding-bottom:1cm"> </p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> <b> Julia Data Structures III </b> <p>
	<p style="padding-bottom:1cm"> </p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> Spring 2023 <p>
	<p style="padding-bottom:0.5cm"> </p>
	<div align=center style="font-size:20px; font-family:family:Georgia"> Prof. Matt Fleckenstein </div>
	<p style="padding-bottom:0.05cm"> </p>
	<div align=center style="font-size:20px; font-family:family:Georgia"> University of Delaware, 
	Lerner College of Business and Economics </div>
	<p style="padding-bottom:0.5cm"> </p>
	"""

# ╔═╡ b3e2a1d6-70a5-402d-9219-82c280ba9328
vspace

# ╔═╡ 42d2dc69-c5e8-4cb8-809b-19cae75e479d
begin
	html"""
	<fieldset>      
    <legend><b>Learning Objectives</b></legend>      
	<br>
	<input type="checkbox" value=""> Strings
	<br>
	<input type="checkbox" value=""> Pairs
	<br>
	<input type="checkbox" value=""> Tuples, Named Tuples
	<br>
	<input type="checkbox" value=""> Ranges
	<br>
	<input type="checkbox" value=""> Dictionaries
	<br>
	<input type="checkbox" value=""> Splatting
	<br>
	<br>
	</fieldset>      
	"""
end

# ╔═╡ c54e6422-2a39-4960-8332-51b98afaded6
vspace

# ╔═╡ bc94035a-795b-4d08-aab2-87519b4ffd65
md"""
# Strings
"""

# ╔═╡ 25a404ef-b21a-4d43-b87b-f4348d9bb219
md"""
- Strings are represented delimited by double quotes.
"""

# ╔═╡ 6b387a90-454d-4507-8406-4acebdff8a3d


# ╔═╡ a0a9a625-5ac0-470b-8e00-f724064bcf97
md"""
#
"""

# ╔═╡ 4f5bb727-6475-483e-8d60-9cbeed9d7822
md"""
- We can also write a multiline string
"""

# ╔═╡ 402ebee0-68b0-4318-809d-fa81d40ff243
let 

end

# ╔═╡ 7aef4abc-0abd-4e51-8494-2805aac60869
md"""
#
"""

# ╔═╡ cdcd1a12-3beb-4080-b76c-1976a48c6500
md"""
- But, it is, typically, more clear to use triple quotation marks
"""

# ╔═╡ 34abd3a8-0a33-4d02-827e-d61c74ee9838
let

end

# ╔═╡ 66d5ad2e-7569-4d40-9e1b-f49f7f2b1955
md"""
# String Concatenation
"""

# ╔═╡ 098eafb0-8c7e-4584-b252-512d0bbb0227
md"""
- A common string operation is string concatenation.
- Suppose that you want to construct a new string that is the concatenation of two or more strings.
- This is accomplished in julia either with the `*` operator or the join function.
"""

# ╔═╡ 52c10638-14d0-4812-b54d-5879198be7dc
let

end

# ╔═╡ cad420df-583c-4cfe-94db-d01506374f9e
md"""
#
"""

# ╔═╡ 8b592c01-c988-4fb7-940e-a6628d35bceb
md"""
- As you can see, we are missing a space between hello and goodbye.
- We could concatenate an additional " " string with the *, but that would be cumbersome for more than two strings.
- That’s when the `join` function is useful.
- We just pass as arguments the strings inside the brackets `[]` and the separator.
"""

# ╔═╡ 3aa94c23-d150-4f32-b110-df92937e6981
md"""
#
"""

# ╔═╡ 7a9e7928-6d4e-40e8-b9ea-26e2eb6d3f61
let

end

# ╔═╡ a7cf85d5-2299-4a6d-b2a0-9f70f1a5a96f
md"""
# String Interpolation
"""

# ╔═╡ 01a1c439-7022-4857-968a-5321df4a183e
md"""
- Concatenating Strings can be convoluted.
- We can be much more expressive with string interpolation.
- It works like this: you specify whatever you want to be included in your string with the dollar sign `$`.
- Here’s the example before but now using interpolation.
"""

# ╔═╡ 9daccbff-20ee-4429-a428-2a404b585f10
md"""
#
"""

# ╔═╡ c245716e-1a72-42e9-b8cc-fd65b785e968
let

end


# ╔═╡ 39a41ede-0750-471d-89b3-b2a2d4e2ce52
md"""
#
"""

# ╔═╡ 7868c045-4fd9-419d-bc66-a9d14ea41c97
md"""
- It works even inside functions. Let’s create a function to illustrate the idea.
"""

# ╔═╡ c955997d-eeb5-48c6-9ab5-c85de7bef6fc


# ╔═╡ c01f4006-98d1-48b8-a069-22f66b856c62


# ╔═╡ 657a80f5-b889-4c2f-84d3-eebdd9f28f02
md"""
# String Manipulations
"""

# ╔═╡ 3c70b4ac-087e-41cf-a38a-fd654edb6011
md"""
- There are several functions to manipulate strings in Julia. 
- We will demonstrate the most common ones.
- Also, note that most of these functions accepts a Regular Expression (RegEx) as arguments.
- We won’t cover RegEx in this course, but you are encouraged to learn about them, especially if most of your work uses textual data.
- First, let us define a string for us to work with.
"""

# ╔═╡ 189e90ac-1516-4b4d-86c0-911bfbd1db24


# ╔═╡ 329b6035-dcd0-4238-b428-a8448141bdfa
md"""
#
"""

# ╔═╡ 0c7bf844-59c0-4893-9c5f-40774bb61309
md"""
- `occursin`, `startswith` and `endswith`: A conditional (returns either `true` or `false`) if the first argument is a
  - substring of the second argument
  - prefix of the second argument
  - suffix of the second argument
"""

# ╔═╡ c513d589-af7d-40d0-b496-0d0de4df56c3
md"""
#
"""

# ╔═╡ 4990d1a0-30f7-4643-bd6e-39d0a642baa0


# ╔═╡ e4e15f0f-212a-4071-b408-46dadc0b3e8d


# ╔═╡ 70054c25-f239-47e3-b5c8-30ecec5101ce


# ╔═╡ 5a019a2f-0a04-4c7e-855e-40c216de0fda
md"""
#
"""

# ╔═╡ 21c0603f-43e6-49ac-827e-6188b4bc52dc
md"""
- 2. `lowercase`, `uppercase`, `titlecase` and `lowercasefirst`.
"""

# ╔═╡ 77837a1d-16f7-4034-8c0e-6be4fc7f5b10


# ╔═╡ f5b12fba-0525-4f19-9b69-f62fc7603e08


# ╔═╡ 96802ee7-349f-4b2a-b7e5-0697b2537142


# ╔═╡ 265a4519-24c1-49c3-af86-659e451473e9


# ╔═╡ 6a9fcae9-9fa8-4209-a735-90a092514067
md"""
#
"""

# ╔═╡ 4ae96703-9ea2-4edc-bd54-1cc86a55eabc
md"""
- `split`: breaks up a string by a delimiter.
"""

# ╔═╡ fa8f864a-862c-4b4c-b755-0a7e7530ccfa


# ╔═╡ a3703ec7-844c-42ee-9aa2-bb5530db98aa
md"""
#
"""

# ╔═╡ f70b6a6f-0704-4297-9913-f8328745d9ac
md"""
- `replace`: introduces a new syntax, called the `Pair`.
"""

# ╔═╡ d8d0ceda-a5c3-4c4a-819a-f2c513afe50a


# ╔═╡ b826620e-18d8-4654-bde9-d757e6abe62b
vspace

# ╔═╡ 806c4f8f-c9fb-4920-9956-eb0e7ccf543f
md"""
# String Conversions
"""

# ╔═╡ 7e2502b8-4535-4242-b56d-2373cb0d4050
md"""
- Often, we need to convert between types in Julia.
- We can use the string function.
"""

# ╔═╡ d6a7a8f8-9bf3-4d09-a108-eddb57e2c8b2
let 

end

# ╔═╡ 050af10c-ba4f-422a-8aa3-8af49ca9048b
md"""
#
"""

# ╔═╡ ccc2b2e7-dbc1-4fbb-9620-951d0ff21a42
md"""
- Sometimes, we want the opposite: convert a string to a number.
- Julia has a handy function for that: `parse`.
"""

# ╔═╡ f1affb0e-c709-4d29-ab47-dbc017bc54c6


# ╔═╡ cb3c760e-16cf-4817-b8fc-bdab9f1b5e8b
md"""
#
"""

# ╔═╡ 392afdf7-68df-4227-87a0-22e88dfb3e75
md"""
- Sometimes, we want to play safe with these conversions.
- That’s when `tryparse` function steps in.
- It has the same functionality as parse but returns either a value of the requested type, or `nothing`.
- That makes `tryparse` handy when we want to avoid errors.
- Of course, you would need to deal with all those nothing values afterwards.
"""

# ╔═╡ dbcb6057-086d-4584-b961-7b6569781ffa
let

end

# ╔═╡ 75e449af-25ad-48ea-8523-58f5f5a0daef
vspace

# ╔═╡ e5eb8771-9fa4-4bca-bdfb-abb8b1af39d3
md"""
# Pairs
"""

# ╔═╡ 27b3ff56-2e40-4ba8-a366-9957bf711f88
md"""
- `Pair` is a data structure that holds two types.
- We construct a pair in Julia is using the following syntax.
"""

# ╔═╡ 1fa6ce25-d853-4110-b5f1-615773e0a12d
let

end

# ╔═╡ 4f03a603-145d-415e-97de-9f400c6480b5
md"""
#
"""

# ╔═╡ 79464896-4b6c-4aec-8680-b0d00c0fadc9
md"""
- Alternatively, we can create a pair by specifying both values and in between we
use the pair `=>` operator.
"""

# ╔═╡ 2eff919e-2f67-4b5d-8e51-1ca4ef2e52f8


# ╔═╡ 5347321b-0526-4cd9-b6c7-b2366407e9f8
md"""
#
"""

# ╔═╡ 3463b880-9a25-43fb-95f6-bd1aac9653f4
md"""
- The elements are stored in the fields first and second
"""

# ╔═╡ ad08de30-bc54-45c1-9456-86b46eeb4602


# ╔═╡ c483a43e-7422-477e-91ce-1431f07b0a97


# ╔═╡ a47c9bca-a192-4148-8968-b105243ff04b
md"""
- Julia has a data structure called `tuple`. They are really special in Julia because they are often used in relation to functions.
- A tuple is a fixed-length container that can hold multiple different types.
- A tuple is an __imutable__ object, meaning that it cannot be modified after instantiation.
- To construct a tuple, use parentheses `()` to delimitate the beginning and end, along with commas `,` as value’s delimiters.
"""

# ╔═╡ d1011108-e962-4421-bc98-28483f5f560d
md"""
#
"""

# ╔═╡ 4ad8f55a-b04c-4c98-9a91-ae7c380e5899
md"""
- Example
  - Here, we are creating a tuple with three values.
  - Each one of the values is a different type. We can access them via indexing.
"""

# ╔═╡ b7dd2983-7735-4c23-a54d-ac3aabdd0838


# ╔═╡ 892566de-1f1a-4745-8713-f0244131bc6a


# ╔═╡ 361ef513-3661-4c9a-8630-4d1e42071efe
md"""
#
"""

# ╔═╡ 9363fe6a-de52-493f-8aef-a336d992077c
md"""
- We can also loop over tuples with the `for` keyword, and even apply functions to tuples. 
- But we can never change any value of a tuple since they are immutable.
"""

# ╔═╡ 6723daf1-0924-43c9-97df-a230d36029be
md"""
#
"""

# ╔═╡ cee8a83c-1fc3-43fd-928f-c69ee25afba9
md"""
- Example
  - Recall that functions can return multiple values.
  - Let’s inspect what our `add_multiply` function returns.
"""

# ╔═╡ 41b9fa87-6a60-4896-b09e-0fe16947c5da


# ╔═╡ ecfd8aaf-f715-4b0f-a7fc-e7fa8f5fadc0
md"""
#
"""

# ╔═╡ 8f3a92ba-577b-406e-8200-be64dddd0bc8
let 

end

# ╔═╡ 2fc75d57-30e8-4c28-860c-386649436615
md"""
#
"""

# ╔═╡ 95ce5454-a3a3-430a-9bc5-74fe3b5dd48f
md"""
- One more thing about `Tuples`.
- When you want to pass more than one variable to an anonymous function, what would you need to use?
- Answer: Tuples
"""

# ╔═╡ 6796d442-ea72-4297-bad1-2b18e90d0d9a


# ╔═╡ 7e807618-c81a-4df0-83c3-89ea63dafbe9
md"""
#
"""

# ╔═╡ 3c03eee2-47c3-432a-8e21-783422e18c89
md"""
- Or, even more than two arguments.
"""

# ╔═╡ f5549c83-545a-4da2-841a-aaf1a2c656f3


# ╔═╡ 519d087f-7569-4b77-bff3-61f0ff6985e7
vspace

# ╔═╡ e4e970b8-0bc0-4d84-a20c-171546784439
md"""
# Tuples
"""

# ╔═╡ fff54865-2dd3-4997-b3eb-6381fcb15450
md"""
# Named Tuples
"""

# ╔═╡ d8612c9b-aa37-4eb2-a853-493d5c68dd34
md"""
- Sometimes, you want to name the values in tuples. That’s when __named tuples__ come in.
- Their functionality is pretty much same the same as tuples. they are immutable and can hold any type of value. 
- Named tuple’s construction are slightly different from tuples. 
- You have the familiar parentheses `()` and comma `,` value separator. But now you name the values.
"""

# ╔═╡ 77ba073b-e243-4f8e-827b-08f95e6981d1


# ╔═╡ a02207c9-5108-4435-8b7a-9b68ef5bb97c
md"""
#
"""

# ╔═╡ d9ed75c6-0216-4552-8a5e-b917757cc48a
md"""
- We can access a named tuple’s values via indexing like regular tuples or, alternatively, access by their names with `.`
"""

# ╔═╡ 1465ebe6-965b-45ab-8f14-2f5e341c3928


# ╔═╡ 4152dd29-da41-4f77-8991-459690a85b5b
md"""
#
"""

# ╔═╡ f84125f9-5eed-48d1-aace-18100c57f2af
md"""
- Often Julia users create a named tuple by using the familiar parenthesis `()` and commas `,`, but without naming the values.
- To do so you begin the named tuple construction by specifying first a semicolon `;` before the values.
- This is especially useful when the values that would compose the named tuple are already defined in variables or when you want to avoid long lines
"""

# ╔═╡ cb3fcc78-61fe-4486-bc4a-925693c877e4
md"""
#
"""

# ╔═╡ 19f0e235-8302-4659-bc1f-565574449a62
let

end

# ╔═╡ 3cf6bb82-151b-4082-9ff9-67506b74af59
md"""
# Ranges
"""

# ╔═╡ 37aee362-f7f6-4fd7-b240-e2c6da0252cd
md"""
- A range in Julia represents an interval between a start and stop boundaries.
- The syntax is `start:stop`.
"""

# ╔═╡ 07f2c7a2-4262-4f6d-bed1-171124dbd28f


# ╔═╡ efd520b0-5890-4de4-adbc-e15664b94688


# ╔═╡ 7b21ac8e-b41c-47d0-9a69-1ddfeed7da42
md"""
- As you can see, our instantiated range is of type `UnitRange{T}` where `T` is the type inside the UnitRange (`Int64` in this case).
"""

# ╔═╡ a323ff01-48f8-4e80-ac10-6b3e5a6204bc
md"""
#
"""

# ╔═╡ 78c5b679-3707-427c-b8c2-103e8b58491c
md"""
- And, if we _gather_ all the values, we get
"""

# ╔═╡ acdc6195-bddb-482d-8669-d574afa653e8


# ╔═╡ e90df9cb-54eb-456a-ac4e-a374d2eb3ba1
md"""
- A convenient shortcut is the `collect` function.
"""

# ╔═╡ 47442c7b-9c18-4e8b-96fd-0b4f472c8624


# ╔═╡ 6fdf0cc0-82ae-4dea-83f4-6da843962f4a
md"""
#
"""

# ╔═╡ bf7c9958-7100-4b32-8a45-100fe07b85b2
md"""
- We can construct ranges also for other types.
"""

# ╔═╡ 12ab5565-b56a-4fd1-8a96-cb195093570f


# ╔═╡ 2e44fbb1-3b01-442b-9165-33a27f89f7e8
md"""
#
"""

# ╔═╡ 2830ac94-b7a3-48fe-9865-aa3bd1293ecc
md"""
- Sometimes, we want to change the default interval _stepsize_ behavior.
- We can do that by adding a _stepsize_ in the range syntax `start:step:stop`.
- For example, suppose we want a range of `Float64` from 0 to 1 with steps of size 0.2.
"""

# ╔═╡ 42442364-0013-487e-b80d-47ab051f0c1b


# ╔═╡ 35678f86-dff3-4baf-ac61-22eb2aff248d
md"""
#
"""

# ╔═╡ cb5b2fe7-63aa-4fe3-a32a-e2caf6078668
md"""
- Again, we can _materialize_ a `UnitRange` into a collection by using the function `collect`.
- We have an array of the type specified in the UnitRange between the boundaries that we’ve set.
"""

# ╔═╡ 8bee3b15-811d-4c3e-9266-a023c5211eae


# ╔═╡ 7cc28408-ca76-4054-bee3-47c6553b4dd2
md"""
# Dictionaries (Dicts)
"""

# ╔═╡ ba22b383-ee9e-4ff7-a9ce-ebac8b64fdc5
md"""
- `Dict` in Julia is just a _hash table_ with pairs of `key` and `value`.
- `keys` and `values` can be of any type, but generally you’ll see keys as `strings`.
- There are two ways to construct `Dicts` in Julia.
- The first is using the default constructor `Dict` and passing a vector of tuples composed of `(key, value)`.
"""

# ╔═╡ baf9f998-d3ba-4b7f-a618-baf7d01ba8eb
md"""
#
"""

# ╔═╡ c4144798-e269-4e60-ba52-0f9f101d36dc
let

end

# ╔═╡ 206882f8-0bd4-434d-a821-7775d5a60e98
md"""
- The second way of constructing Dicts is more elegant because it has a more expressive syntax.
- You use the same default constructor Dict, but now you pass pairs of `key` and `value`.
"""

# ╔═╡ 2edcb5a2-39fb-4363-a303-52ed32870291
let 

end

# ╔═╡ 28ce123b-8a31-42c1-9e17-836b3a60513e
md"""
#
"""

# ╔═╡ 4db895f3-712c-4ff7-b679-caf70572cae9
md"""
- You can retrieve a Dicts value by indexing it by the corresponding key.
"""

# ╔═╡ af2589e3-c191-4f93-9150-295914c85c33
let

end

# ╔═╡ 491ff53c-59b5-49dd-bf12-69d3e1e1e674
md"""
- Similarly, to add a new entry you index the `Dict` by the desired `key` and assign a value with the assignment `=` operator.
"""

# ╔═╡ bfa4eb7f-6aef-4723-9565-dcb2131223c9
let

end

# ╔═╡ 30f2ae99-cb6d-4ac8-9ef3-154ca18ded3f
md"""
#
"""

# ╔═╡ 58a811eb-97bc-4173-a3b0-6ffdf148d798
md"""
- If you want to check if a Dict has a certain `key` you can use the `haskey` function.
"""

# ╔═╡ c636919c-76d1-4b89-a59b-a3c6c0f5a495
let

end

# ╔═╡ 5392ee59-5a03-4789-a64e-2c661f250107
md"""
#
"""

# ╔═╡ 7ec0aa0d-153e-4cef-a2d3-40af83928e95
md"""
- To delete a key you can use either the `delete!` function.
"""

# ╔═╡ e93c8fab-b86f-4f75-961e-da53c6f1ab6a
let

end

# ╔═╡ 70d5f5eb-2544-41a9-9faf-8fe5bd6d20c2
md"""
#
"""

# ╔═╡ cda7feb9-f18b-4490-9f3d-3b726981e4df
md"""
- Or to delete a `key` while retuning its value you can use the `pop!` function.
"""

# ╔═╡ 1faa48df-32e8-42f3-be0d-554257b948bb
let

end

# ╔═╡ c135fa18-56ff-4e10-b59c-d34371da20c7
md"""
#
"""

# ╔═╡ eec76302-4b16-451d-9a0a-ab504f33dfe3
md"""
- There is one useful `Dict` constructor that we use a lot.
- Suppose you have two vectors and you want to construct a Dict with one of them as keys and the other as values.
- You can do that with the `zip` function which _glues_ together two objects just like a _zipper_.
"""

# ╔═╡ b3dbf318-6e52-46ac-ae6e-2ea8832ba9e1
md"""
#
"""

# ╔═╡ 3ee268a0-f32b-4c99-8da8-fc5dbff7db08
begin

end

# ╔═╡ 2dea6272-e8de-4c4c-9bb5-136c42d0554d
md"""
- For instance, we can now get the number 3 via.
"""

# ╔═╡ 1a9b63d3-953e-42f2-9557-93fb9c234b02


# ╔═╡ f2012a77-742e-49ed-b9df-d3c70519e8e0
md"""
# Splat Operator
"""

# ╔═╡ 56cd4d6f-733d-464a-a02d-8455a977cf53
md"""
- In Julia we have the _splat_ operator `...` which is mainly used in function calls as a sequence of arguments.
- The most intuitive way to learn about splatting is with an example.
- The `add_elements` function below takes three arguments to be added together.
"""

# ╔═╡ 371d8b82-0bcf-4071-81cc-a855e6944078


# ╔═╡ 83f142a0-104b-4978-acf0-9438d9913ffb
md"""
#
"""

# ╔═╡ 55c08ffe-6ccb-4567-b127-20978b7676a8
md"""
- Now suppose that we have a collection with three elements.
- The naïve way to do this would be to supply the function with all three elements as function arguments like this.
"""

# ╔═╡ 135adc8e-4169-4800-943a-fe51828fad16
let

end

# ╔═╡ fc45db58-1856-45ef-a633-9096fd3940b9
md"""
#
"""

# ╔═╡ 0c8b1e06-3f4d-42e0-a9e8-f69979ffa7dd
md"""
- Here is where we use the `splat` operator `...` which takes a collection (often an array, vector, tuple or range) and converts into a sequence of arguments.
"""

# ╔═╡ 5a4a22ad-cf6e-4f1e-8ca4-aedb41f5076f
let

end

# ╔═╡ c91592c2-6bf2-4fbc-bbd4-c4703e32f1e6
md"""
#
"""

# ╔═╡ 36cc5182-061d-45e9-8bca-f704e1be324d
md"""
- The `...` is included after the collection that we want to _splat_ into a sequence of arguments.
- In the example above, syntactically speaking, the following are the same.
```
	collection = [x, y, z]
	function(collection...) = function(x, y, z)
```
"""

# ╔═╡ 391cbe17-ce70-48aa-8de9-3a0aa0b6d9fb
md"""
#
"""

# ╔═╡ 9472bd3a-6805-41bf-9778-eca308a39696
md"""
- Anytime Julia sees a splatting operator inside a function call, it will be converted on a sequence of arguments for all elements of the collection separated by commas.
- It also works for ranges
"""

# ╔═╡ 95aa5f25-c707-4031-8ab0-e1d4264b07f7


# ╔═╡ 2f9b7bea-8ae0-4d59-81c3-01711eced69c
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
	<input type="checkbox" value="" checked> Strings
	<br>
	<input type="checkbox" value="" checked> Pairs
	<br>
	<input type="checkbox" value="" checked> Tuples, Named Tuples
	<br>
	<input type="checkbox" value="" checked> Ranges
	<br>
	<input type="checkbox" value="" checked> Dictionaries
	<br>
	<input type="checkbox" value="" checked> Splatting
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
# ╟─ea237d72-175a-40da-a35c-017d894ed8c0
# ╟─b71ed765-a596-45cd-9c29-cbb3d4cba1a4
# ╟─b3e2a1d6-70a5-402d-9219-82c280ba9328
# ╟─42d2dc69-c5e8-4cb8-809b-19cae75e479d
# ╟─c54e6422-2a39-4960-8332-51b98afaded6
# ╟─bc94035a-795b-4d08-aab2-87519b4ffd65
# ╟─25a404ef-b21a-4d43-b87b-f4348d9bb219
# ╠═6b387a90-454d-4507-8406-4acebdff8a3d
# ╟─a0a9a625-5ac0-470b-8e00-f724064bcf97
# ╟─4f5bb727-6475-483e-8d60-9cbeed9d7822
# ╠═402ebee0-68b0-4318-809d-fa81d40ff243
# ╟─7aef4abc-0abd-4e51-8494-2805aac60869
# ╟─cdcd1a12-3beb-4080-b76c-1976a48c6500
# ╠═34abd3a8-0a33-4d02-827e-d61c74ee9838
# ╟─66d5ad2e-7569-4d40-9e1b-f49f7f2b1955
# ╟─098eafb0-8c7e-4584-b252-512d0bbb0227
# ╠═52c10638-14d0-4812-b54d-5879198be7dc
# ╟─cad420df-583c-4cfe-94db-d01506374f9e
# ╟─8b592c01-c988-4fb7-940e-a6628d35bceb
# ╟─3aa94c23-d150-4f32-b110-df92937e6981
# ╠═7a9e7928-6d4e-40e8-b9ea-26e2eb6d3f61
# ╟─a7cf85d5-2299-4a6d-b2a0-9f70f1a5a96f
# ╟─01a1c439-7022-4857-968a-5321df4a183e
# ╟─9daccbff-20ee-4429-a428-2a404b585f10
# ╠═c245716e-1a72-42e9-b8cc-fd65b785e968
# ╟─39a41ede-0750-471d-89b3-b2a2d4e2ce52
# ╟─7868c045-4fd9-419d-bc66-a9d14ea41c97
# ╠═c955997d-eeb5-48c6-9ab5-c85de7bef6fc
# ╠═c01f4006-98d1-48b8-a069-22f66b856c62
# ╟─657a80f5-b889-4c2f-84d3-eebdd9f28f02
# ╟─3c70b4ac-087e-41cf-a38a-fd654edb6011
# ╠═189e90ac-1516-4b4d-86c0-911bfbd1db24
# ╟─329b6035-dcd0-4238-b428-a8448141bdfa
# ╟─0c7bf844-59c0-4893-9c5f-40774bb61309
# ╟─c513d589-af7d-40d0-b496-0d0de4df56c3
# ╠═4990d1a0-30f7-4643-bd6e-39d0a642baa0
# ╠═e4e15f0f-212a-4071-b408-46dadc0b3e8d
# ╠═70054c25-f239-47e3-b5c8-30ecec5101ce
# ╟─5a019a2f-0a04-4c7e-855e-40c216de0fda
# ╟─21c0603f-43e6-49ac-827e-6188b4bc52dc
# ╠═77837a1d-16f7-4034-8c0e-6be4fc7f5b10
# ╠═f5b12fba-0525-4f19-9b69-f62fc7603e08
# ╠═96802ee7-349f-4b2a-b7e5-0697b2537142
# ╠═265a4519-24c1-49c3-af86-659e451473e9
# ╟─6a9fcae9-9fa8-4209-a735-90a092514067
# ╟─4ae96703-9ea2-4edc-bd54-1cc86a55eabc
# ╠═fa8f864a-862c-4b4c-b755-0a7e7530ccfa
# ╟─a3703ec7-844c-42ee-9aa2-bb5530db98aa
# ╟─f70b6a6f-0704-4297-9913-f8328745d9ac
# ╠═d8d0ceda-a5c3-4c4a-819a-f2c513afe50a
# ╟─b826620e-18d8-4654-bde9-d757e6abe62b
# ╟─806c4f8f-c9fb-4920-9956-eb0e7ccf543f
# ╟─7e2502b8-4535-4242-b56d-2373cb0d4050
# ╠═d6a7a8f8-9bf3-4d09-a108-eddb57e2c8b2
# ╟─050af10c-ba4f-422a-8aa3-8af49ca9048b
# ╟─ccc2b2e7-dbc1-4fbb-9620-951d0ff21a42
# ╠═f1affb0e-c709-4d29-ab47-dbc017bc54c6
# ╟─cb3c760e-16cf-4817-b8fc-bdab9f1b5e8b
# ╟─392afdf7-68df-4227-87a0-22e88dfb3e75
# ╠═dbcb6057-086d-4584-b961-7b6569781ffa
# ╟─75e449af-25ad-48ea-8523-58f5f5a0daef
# ╟─e5eb8771-9fa4-4bca-bdfb-abb8b1af39d3
# ╟─27b3ff56-2e40-4ba8-a366-9957bf711f88
# ╠═1fa6ce25-d853-4110-b5f1-615773e0a12d
# ╟─4f03a603-145d-415e-97de-9f400c6480b5
# ╟─79464896-4b6c-4aec-8680-b0d00c0fadc9
# ╠═2eff919e-2f67-4b5d-8e51-1ca4ef2e52f8
# ╟─5347321b-0526-4cd9-b6c7-b2366407e9f8
# ╟─3463b880-9a25-43fb-95f6-bd1aac9653f4
# ╠═ad08de30-bc54-45c1-9456-86b46eeb4602
# ╠═c483a43e-7422-477e-91ce-1431f07b0a97
# ╟─a47c9bca-a192-4148-8968-b105243ff04b
# ╟─d1011108-e962-4421-bc98-28483f5f560d
# ╟─4ad8f55a-b04c-4c98-9a91-ae7c380e5899
# ╠═b7dd2983-7735-4c23-a54d-ac3aabdd0838
# ╠═892566de-1f1a-4745-8713-f0244131bc6a
# ╟─361ef513-3661-4c9a-8630-4d1e42071efe
# ╟─9363fe6a-de52-493f-8aef-a336d992077c
# ╟─6723daf1-0924-43c9-97df-a230d36029be
# ╟─cee8a83c-1fc3-43fd-928f-c69ee25afba9
# ╠═41b9fa87-6a60-4896-b09e-0fe16947c5da
# ╟─ecfd8aaf-f715-4b0f-a7fc-e7fa8f5fadc0
# ╠═8f3a92ba-577b-406e-8200-be64dddd0bc8
# ╟─2fc75d57-30e8-4c28-860c-386649436615
# ╟─95ce5454-a3a3-430a-9bc5-74fe3b5dd48f
# ╠═6796d442-ea72-4297-bad1-2b18e90d0d9a
# ╟─7e807618-c81a-4df0-83c3-89ea63dafbe9
# ╟─3c03eee2-47c3-432a-8e21-783422e18c89
# ╠═f5549c83-545a-4da2-841a-aaf1a2c656f3
# ╟─519d087f-7569-4b77-bff3-61f0ff6985e7
# ╟─e4e970b8-0bc0-4d84-a20c-171546784439
# ╟─fff54865-2dd3-4997-b3eb-6381fcb15450
# ╟─d8612c9b-aa37-4eb2-a853-493d5c68dd34
# ╠═77ba073b-e243-4f8e-827b-08f95e6981d1
# ╟─a02207c9-5108-4435-8b7a-9b68ef5bb97c
# ╟─d9ed75c6-0216-4552-8a5e-b917757cc48a
# ╠═1465ebe6-965b-45ab-8f14-2f5e341c3928
# ╟─4152dd29-da41-4f77-8991-459690a85b5b
# ╟─f84125f9-5eed-48d1-aace-18100c57f2af
# ╟─cb3fcc78-61fe-4486-bc4a-925693c877e4
# ╠═19f0e235-8302-4659-bc1f-565574449a62
# ╟─3cf6bb82-151b-4082-9ff9-67506b74af59
# ╟─37aee362-f7f6-4fd7-b240-e2c6da0252cd
# ╠═07f2c7a2-4262-4f6d-bed1-171124dbd28f
# ╠═efd520b0-5890-4de4-adbc-e15664b94688
# ╟─7b21ac8e-b41c-47d0-9a69-1ddfeed7da42
# ╟─a323ff01-48f8-4e80-ac10-6b3e5a6204bc
# ╟─78c5b679-3707-427c-b8c2-103e8b58491c
# ╠═acdc6195-bddb-482d-8669-d574afa653e8
# ╟─e90df9cb-54eb-456a-ac4e-a374d2eb3ba1
# ╠═47442c7b-9c18-4e8b-96fd-0b4f472c8624
# ╟─6fdf0cc0-82ae-4dea-83f4-6da843962f4a
# ╟─bf7c9958-7100-4b32-8a45-100fe07b85b2
# ╠═12ab5565-b56a-4fd1-8a96-cb195093570f
# ╟─2e44fbb1-3b01-442b-9165-33a27f89f7e8
# ╟─2830ac94-b7a3-48fe-9865-aa3bd1293ecc
# ╠═42442364-0013-487e-b80d-47ab051f0c1b
# ╟─35678f86-dff3-4baf-ac61-22eb2aff248d
# ╟─cb5b2fe7-63aa-4fe3-a32a-e2caf6078668
# ╠═8bee3b15-811d-4c3e-9266-a023c5211eae
# ╟─7cc28408-ca76-4054-bee3-47c6553b4dd2
# ╟─ba22b383-ee9e-4ff7-a9ce-ebac8b64fdc5
# ╟─baf9f998-d3ba-4b7f-a618-baf7d01ba8eb
# ╠═c4144798-e269-4e60-ba52-0f9f101d36dc
# ╟─206882f8-0bd4-434d-a821-7775d5a60e98
# ╠═2edcb5a2-39fb-4363-a303-52ed32870291
# ╟─28ce123b-8a31-42c1-9e17-836b3a60513e
# ╟─4db895f3-712c-4ff7-b679-caf70572cae9
# ╠═af2589e3-c191-4f93-9150-295914c85c33
# ╟─491ff53c-59b5-49dd-bf12-69d3e1e1e674
# ╠═bfa4eb7f-6aef-4723-9565-dcb2131223c9
# ╟─30f2ae99-cb6d-4ac8-9ef3-154ca18ded3f
# ╟─58a811eb-97bc-4173-a3b0-6ffdf148d798
# ╠═c636919c-76d1-4b89-a59b-a3c6c0f5a495
# ╟─5392ee59-5a03-4789-a64e-2c661f250107
# ╟─7ec0aa0d-153e-4cef-a2d3-40af83928e95
# ╠═e93c8fab-b86f-4f75-961e-da53c6f1ab6a
# ╟─70d5f5eb-2544-41a9-9faf-8fe5bd6d20c2
# ╟─cda7feb9-f18b-4490-9f3d-3b726981e4df
# ╠═1faa48df-32e8-42f3-be0d-554257b948bb
# ╟─c135fa18-56ff-4e10-b59c-d34371da20c7
# ╟─eec76302-4b16-451d-9a0a-ab504f33dfe3
# ╟─b3dbf318-6e52-46ac-ae6e-2ea8832ba9e1
# ╠═3ee268a0-f32b-4c99-8da8-fc5dbff7db08
# ╟─2dea6272-e8de-4c4c-9bb5-136c42d0554d
# ╠═1a9b63d3-953e-42f2-9557-93fb9c234b02
# ╟─f2012a77-742e-49ed-b9df-d3c70519e8e0
# ╟─56cd4d6f-733d-464a-a02d-8455a977cf53
# ╠═371d8b82-0bcf-4071-81cc-a855e6944078
# ╟─83f142a0-104b-4978-acf0-9438d9913ffb
# ╟─55c08ffe-6ccb-4567-b127-20978b7676a8
# ╠═135adc8e-4169-4800-943a-fe51828fad16
# ╟─fc45db58-1856-45ef-a633-9096fd3940b9
# ╟─0c8b1e06-3f4d-42e0-a9e8-f69979ffa7dd
# ╠═5a4a22ad-cf6e-4f1e-8ca4-aedb41f5076f
# ╟─c91592c2-6bf2-4fbc-bbd4-c4703e32f1e6
# ╟─36cc5182-061d-45e9-8bca-f704e1be324d
# ╟─391cbe17-ce70-48aa-8de9-3a0aa0b6d9fb
# ╟─9472bd3a-6805-41bf-9778-eca308a39696
# ╠═95aa5f25-c707-4031-8ab0-e1d4264b07f7
# ╟─2f9b7bea-8ae0-4d59-81c3-01711eced69c
# ╟─a124bf84-7ca4-40c8-8607-b05dec24a730
# ╟─75672e0c-5c34-44c8-b1a9-f6ba821d6c8d
# ╟─5f191192-bc5f-41e8-845c-beba89ee5841
# ╟─cddc45e1-7547-4d34-bc12-b08a5320a62c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
