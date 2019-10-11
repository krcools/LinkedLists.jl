using Documenter, LinkedLists

makedocs(;
    modules=[LinkedLists],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/krcools/LinkedLists.jl/blob/{commit}{path}#L{line}",
    sitename="LinkedLists.jl",
    authors="Kristof Cools <krcools@gmail.com>",
    assets=String[],
)

deploydocs(;
    repo="github.com/krcools/LinkedLists.jl",
)
