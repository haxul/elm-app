
module  Article exposing (feed, tags, Model, Article)


tags =
    [
    "elm"
    , "javascript"
    , "typescript"
    , "gwt"
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

type alias Model =
  { tags : List String
  , selectedTag : String
  , allArticles : {
    title : String
    , description : String
  }
  }
