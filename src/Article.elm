
module  Article exposing (feed, tags, Article)


tags =
    [
    "elm"
    , "javascript"
    , "typescript"
    , "gwt"
    , "clear"
    ]


feed =
    [
     { title = "elm is fun", description = "elm"}
     ,{ title = "js is not so fun", description = "javascript"}
     ,{ title = "i like this stuff", description = "typescript"}
     ,{ title = "what is it?", description = "gwt"}
    ]


type alias Article = {
    title : String,
    description: String
    }
