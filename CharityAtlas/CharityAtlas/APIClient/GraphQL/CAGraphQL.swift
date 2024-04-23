//
//  CAGraphQL.swift
//  CharityAtlas
//
//  Created by Maria Kim on 4/22/24.
//

import Foundation
import Apollo

class CAGraphQL {
    
    public var apolloClient: ApolloClient = {
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        
        let provider = DefaultInterceptorProvider(store: store)
        let transport: RequestChainNetworkTransport = .init(
            interceptorProvider: provider,
            endpointURL: URL(string: "https://data.charitynavigator.org")!,
            additionalHeaders: [
                "Stellate-Api-Token": "token"
            ]
        )
        
        return ApolloClient(networkTransport: transport, store: store)
    }()
}

struct NetworkInterceptorProvider: InterceptorProvider {
    private let store: ApolloStore
    private let client: URLSessionClient
    
    init(store: ApolloStore, client: URLSessionClient) {
        self.store = store
        self.client = client
    }
    
    func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        return [
            MaxRetryInterceptor(),
            CacheReadInterceptor(store: self.store),
            NetworkFetchInterceptor(client: self.client),
            ResponseCodeInterceptor(),
            JSONResponseParsingInterceptor(),
            AutomaticPersistedQueryInterceptor(),
            CacheWriteInterceptor(store: self.store)
        ]
    }
}
