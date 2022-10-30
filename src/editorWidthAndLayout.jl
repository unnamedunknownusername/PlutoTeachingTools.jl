### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# ╔═╡ e9f1efa1-b3ee-4153-99e9-52233a8ad47e
using HypertextLiteral

# ╔═╡ 89469f3b-cb71-4143-a749-36ba8d39690b
using PlutoUI

# ╔═╡ 646aa9d2-4ea4-477c-8aea-079cc33ac95f
using PlutoTeachingTools

# ╔═╡ 2308c8f3-72eb-4987-9df1-1dca91a856e0
TableOfContents(include_definitions=true)

# ╔═╡ 3a88f522-2f5f-4a02-9f6f-de2b1d2c30c4
md"""
# Function to convert sting representation to html
"""

# ╔═╡ 6c1bd6a0-d61c-4e66-a60a-0ed8165e4043
#=
2022/10/30
inspired by https://github.com/JuliaPluto/PlutoUI.jl/blob/main/src/Layout.jl css_to_string() function 
=#
function convertCssStringIntoHtmlStyleDiv(x)
	htmlStyleDiv = @htl("<style>$(x)</style>")
end

# ╔═╡ c431beae-eab2-41c6-8b1f-be7d8bdff35a
md"""
# Editor Width and Layout
"""

# ╔═╡ b9e3f2c2-3c4e-41f5-aff4-80fa702c803a
function layoutWidth(
maxWidthInPercent,
paddingLeftPercent,
paddingRightPercent
)
@htl("""
<style>

body:not(.fake_class) main {
max-width: $maxWidthInPercent% ;
align-self: center 
margin: 0 auto;
padding-left: $(paddingLeftPercent)% ;
padding-right: $paddingRightPercent% ;
}

</style>
""")
	
end
# the above function uses combination of the two below examples


#Example 1- https://discourse.julialang.org/t/cell-width-in-pluto-notebook/49761/5
#=
html"""
<style>
	main {
		margin: 0 auto;
		max-width: 2000px;
    	padding-left: max(160px, 10%);
    	padding-right: max(160px, 10%);
	}
</style>
"""
=#



#example 2 - https://discourse.julialang.org/t/pluto-pdf-and-printing/65055
#=
body:not(.fake_class) main {
	max-width: $maxWidthinPercent%;
	margin-right: 0px;
	align-self: center;
}
=#

# ╔═╡ 84d4f62a-2671-406d-9456-f5e5a36fd07d
layoutWide()=layoutWidth(90,10,22)

# ╔═╡ 667c686b-7630-4451-8fa5-5415ab1559f6
layoutWider()=layoutWidth(90,10,10)

# ╔═╡ 58f06c62-6173-48e0-8926-87f7fec77d63
layoutWidest()=layoutWidth(90,5,0)

# ╔═╡ a8079d57-bfb8-4a79-97d5-210d44367e51


# ╔═╡ 2554f3c6-91a2-431b-ba0b-7b6939fd4da3


# ╔═╡ 087d4927-095d-44ab-b6c3-29fdb9c71051
md"""
# Hide Live Docs
"""

# ╔═╡ 7fab552a-5ecd-41b0-a1a0-0f335a41359a
HideHelpBoxStyle()="""
#helpbox-wrapper{
	display: none;
}
"""

# ╔═╡ cd54eb94-dcd1-4bb7-ba57-8e1cedb0c659
HideHelpBox()=convertCssStringIntoHtmlStyleDiv(HideHelpBoxStyle())

# ╔═╡ 5a224531-c6d8-44b6-8eb3-a5a5625f0438
export HideHelpBox

# ╔═╡ c3189b86-3830-4bcf-993c-0ca06156782b


# ╔═╡ 54b68516-8175-4051-bf2c-5585d923938c
RedHeadingsStyle()="""
pluto-output h1 {
    font-family: "Comis Sans MS", cursive;
    color: red;
}
"""

# ╔═╡ befa9b8d-d331-42a3-a831-81a959717c2d
RedHeadings()=convertCssStringIntoHtmlStyleDiv(RedHeadingsStyle())

# ╔═╡ 48c69c30-7f27-401a-9c9a-c47d0f15d632
function WideWidthAndHideHelpBox()
	convertCssStringIntoHtmlStyleDiv(HideHelpBoxStyle()*RedHeadingsStyle())
end

# ╔═╡ 8c89084b-a71c-4c45-b7cc-4a9131dd961d


# ╔═╡ 37628d18-a5c1-4902-b94a-2bc16cdebdb0


# ╔═╡ 942239d9-dbe0-46ee-b6ed-334321da3217
md"""
# Testing
"""

# ╔═╡ 6c2bdc56-830e-426a-a23d-7240a046d602


# ╔═╡ 7eeb91fc-ed3e-453c-a934-d0b45796bd5c
test(maxWidthInPercent,paddingLeftPercent,paddingRightPercent)="""
body:not(.fake_class) main {
max-width: $maxWidthInPercent% ;
align-self: center 
margin: 0 auto;
padding-left: $(paddingLeftPercent)% ;
padding-right: $paddingRightPercent% ;
}
"""

# ╔═╡ b8b1c4d7-5015-4f9a-96a6-defc629d9687
PlutoUI.to_css_string(test(10,10,20))

# ╔═╡ 6f0ae0ca-725c-43bd-9f1b-f730eb684cb3
WideWidthAndHideHelpBox();

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
HypertextLiteral = "~0.9.4"
PlutoTeachingTools = "~0.2.4"
PlutoUI = "~0.7.44"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.1"
manifest_format = "2.0"
project_hash = "d3a0126ab005e9fb67731a36a99b12bbac071747"

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

[[deps.CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "cc4bd91eba9cdbbb4df4746124c22c0832a460d6"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.1.1"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

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

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

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

[[deps.JuliaInterpreter]]
deps = ["CodeTracking", "InteractiveUtils", "Random", "UUIDs"]
git-tree-sha1 = "0f960b1404abb0b244c1ece579a0ec78d056a5d1"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.15"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Printf", "Requires"]
git-tree-sha1 = "ab9aa169d2160129beb241cb2750ca499b4e90e9"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.17"

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

[[deps.LoweredCodeUtils]]
deps = ["JuliaInterpreter"]
git-tree-sha1 = "dedbebe234e06e1ddad435f5c6f4b85cd8ce55f7"
uuid = "6f1432cf-f94c-5a45-995e-cdbf5db27b0b"
version = "2.2.2"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "42324d08725e200c23d4dfb549e0d5d89dede2d2"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.10"

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

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "595c0b811cf2bab8b0849a70d9bd6379cc1cfb52"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.4.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoHooks]]
deps = ["InteractiveUtils", "Markdown", "UUIDs"]
git-tree-sha1 = "072cdf20c9b0507fdd977d7d246d90030609674b"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0774"
version = "0.0.5"

[[deps.PlutoLinks]]
deps = ["FileWatching", "InteractiveUtils", "Markdown", "PlutoHooks", "Revise", "UUIDs"]
git-tree-sha1 = "0e8bcc235ec8367a8e9648d48325ff00e4b0a545"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0420"
version = "0.1.5"

[[deps.PlutoTeachingTools]]
deps = ["Downloads", "HypertextLiteral", "LaTeXStrings", "Latexify", "Markdown", "PlutoLinks", "PlutoUI", "Random"]
git-tree-sha1 = "2784ec6fd23a4e99081fd1f11fae40c5ec5f3777"
uuid = "661c6b06-c737-4d37-b85c-46df65de6f69"
version = "0.2.4"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "6e33d318cf8843dade925e35162992145b4eb12f"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.44"

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

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Revise]]
deps = ["CodeTracking", "Distributed", "FileWatching", "JuliaInterpreter", "LibGit2", "LoweredCodeUtils", "OrderedCollections", "Pkg", "REPL", "Requires", "UUIDs", "Unicode"]
git-tree-sha1 = "dad726963ecea2d8a81e26286f625aee09a91b7c"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.4.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

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
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

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
# ╠═e9f1efa1-b3ee-4153-99e9-52233a8ad47e
# ╠═89469f3b-cb71-4143-a749-36ba8d39690b
# ╠═2308c8f3-72eb-4987-9df1-1dca91a856e0
# ╠═646aa9d2-4ea4-477c-8aea-079cc33ac95f
# ╟─3a88f522-2f5f-4a02-9f6f-de2b1d2c30c4
# ╠═6c1bd6a0-d61c-4e66-a60a-0ed8165e4043
# ╟─c431beae-eab2-41c6-8b1f-be7d8bdff35a
# ╠═b9e3f2c2-3c4e-41f5-aff4-80fa702c803a
# ╠═84d4f62a-2671-406d-9456-f5e5a36fd07d
# ╠═667c686b-7630-4451-8fa5-5415ab1559f6
# ╠═58f06c62-6173-48e0-8926-87f7fec77d63
# ╠═a8079d57-bfb8-4a79-97d5-210d44367e51
# ╠═2554f3c6-91a2-431b-ba0b-7b6939fd4da3
# ╟─087d4927-095d-44ab-b6c3-29fdb9c71051
# ╠═7fab552a-5ecd-41b0-a1a0-0f335a41359a
# ╠═5a224531-c6d8-44b6-8eb3-a5a5625f0438
# ╠═cd54eb94-dcd1-4bb7-ba57-8e1cedb0c659
# ╠═c3189b86-3830-4bcf-993c-0ca06156782b
# ╠═54b68516-8175-4051-bf2c-5585d923938c
# ╠═befa9b8d-d331-42a3-a831-81a959717c2d
# ╠═48c69c30-7f27-401a-9c9a-c47d0f15d632
# ╠═8c89084b-a71c-4c45-b7cc-4a9131dd961d
# ╠═37628d18-a5c1-4902-b94a-2bc16cdebdb0
# ╠═942239d9-dbe0-46ee-b6ed-334321da3217
# ╠═6c2bdc56-830e-426a-a23d-7240a046d602
# ╠═7eeb91fc-ed3e-453c-a934-d0b45796bd5c
# ╠═b8b1c4d7-5015-4f9a-96a6-defc629d9687
# ╠═6f0ae0ca-725c-43bd-9f1b-f730eb684cb3
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
