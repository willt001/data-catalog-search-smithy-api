namespace search.api

use aws.protocols#restJson1

@restJson1
@title("Data Catalog Search")
service SearchService {
    operations: [GetTableDescriptionSearch, GetColumnNameSearch, GetTableNameSearch]
}

@http(method: "GET", uri: "/search/table")
operation GetTableNameSearch {
    input: SearchText
    output: SearchOutput
}

@http(method: "GET", uri: "/search/description")
operation GetTableDescriptionSearch {
    input: SearchText
    output: SearchOutput
}

@http(method: "GET", uri: "/search/column")
operation GetColumnNameSearch {
    input: SearchText
    output: SearchOutput
}

structure SearchText {
    @required
    @httpQuery("searchText")
    searchText: String
}

structure SearchOutput {
    tableList: SearchResults
}

list SearchResults {
    member: SearchResult
}

structure SearchResult {
    name: String
    description: String
    columns: ColumnLists
}

list ColumnLists {
    member: ColumnDetails
}

structure ColumnDetails {
    name: String
    type: String
    comment: String
}