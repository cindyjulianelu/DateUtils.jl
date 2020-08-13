push!(LOAD_PATH, "../src/")
using DateUtils
using Documenter
makedocs(
    clean = true,
    doctest = true,
    modules = Module[DateUtils],
    repo = "",
    highlightsig = true,
    sitename = "DateUtils.jl",
    pages = [
        "Index" => "index.md",
    ]
)
