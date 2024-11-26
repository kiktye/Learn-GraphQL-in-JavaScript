export const typeDefs = `#graphql

    type Category {
        name: String
    }

    type Product {
        id: ID!
        product_id: String!
        name: String!
        inStock: Boolean!
        gallery: [String!]!
        category: String!
        attributes: [Attribute]
        prices: [Price!]!
        brand: String!
        description: String!
    }

    type Attribute {
        id: ID!
        name: String!
        type: String!
        items: [AttributeItem]
    }

    type AttributeItem {
        identifier: ID!
        id: String!
        displayValue: String!
        value: String!
    }

type Currency {
    label: String!
    symbol: String!
}

    type Price {
        amount: Float!
        currency: Currency
    }

    type Query {
        categories: [Category]
        category(id: ID!): Category
        products: [Product]
        product(id: ID!): Product
    }
`;
