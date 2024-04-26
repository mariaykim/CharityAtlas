// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ExampleQuery: GraphQLQuery {
  public static let operationName: String = "ExampleQuery"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ExampleQuery($term: String!) { publicSearchFaceted(term: $term) { __typename results { __typename name cause charity_navigator_url mission organization_url encompass_score encompass_star_rating } } }"#
    ))

  public var term: String

  public init(term: String) {
    self.term = term
  }

  public var __variables: Variables? { ["term": term] }

  public struct Data: SchemaAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SchemaAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("publicSearchFaceted", PublicSearchFaceted.self, arguments: ["term": .variable("term")]),
    ] }

    public var publicSearchFaceted: PublicSearchFaceted { __data["publicSearchFaceted"] }

    /// PublicSearchFaceted
    ///
    /// Parent Type: `PublicFacetedResponse`
    public struct PublicSearchFaceted: SchemaAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SchemaAPI.Objects.PublicFacetedResponse }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result].self),
      ] }

      /// Results
      public var results: [Result] { __data["results"] }

      /// PublicSearchFaceted.Result
      ///
      /// Parent Type: `PublicSearchResult`
      public struct Result: SchemaAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { SchemaAPI.Objects.PublicSearchResult }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String?.self),
          .field("cause", String?.self),
          .field("charity_navigator_url", String?.self),
          .field("mission", String?.self),
          .field("organization_url", String?.self),
          .field("encompass_score", String?.self),
          .field("encompass_star_rating", String?.self),
        ] }

        /// The name of the organization
        public var name: String? { __data["name"] }
        /// A main cause that the organization is associated with
        public var cause: String? { __data["cause"] }
        /// The URL of the organization's page on Charity Navigator
        public var charity_navigator_url: String? { __data["charity_navigator_url"] }
        /// The mission statement of the organization
        public var mission: String? { __data["mission"] }
        /// The URL of the organization
        public var organization_url: String? { __data["organization_url"] }
        /// The total encompass score of the organization
        public var encompass_score: String? { __data["encompass_score"] }
        /// The star rating of the organization
        public var encompass_star_rating: String? { __data["encompass_star_rating"] }
      }
    }
  }
}
