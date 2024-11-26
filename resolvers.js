import { db } from "./db.js";

export const resolvers = {
  Query: {
    categories: async () => {
      const [categories] = await db.query(`SELECT * FROM categories`);

      return categories;
    },
    category: async (_, args) => {
      const [category] = await db.query(
        `SELECT * FROM categories WHERE id = ?`,
        [args.id]
      );
      return category[0];
    },
    products: async () => {
      const [products] = await db.query(
        `SELECT products.*, categories.name AS category_name FROM products JOIN categories ON products.category_id = categories.id`
      );
      return products.map((product) => ({
        identifier: product.id,
        id: product.product_id,
        name: product.name,
        inStock: product.in_stock,
        brand: product.brand,
        description: product.description,
        category: product.category_name,
        gallery: [],
        attributes: [],
        prices: [],
      }));
    },

    product: async (_, args) => {
      const [product] = await db.query(`SELECT products.*, categories.name as category_name FROM products JOIN categories ON products.category_id = categories.id WHERE products.id = ?`, [args.id]);

      if (product.length === 0) return null;

      return {
        identifier: product[0].id,
        id: product[0].product_id,
        name: product[0].name,
        inStock: product[0].in_stock,
        brand: product[0].brand,
        description: product[0].description,
        category: product[0].category_name,
        gallery: [],
        attributes: [],
        prices: [],
      };
    }
  },
  Product: {
    attributes: async (product) => {
      const [attributes] = await db.query(
        `SELECT * FROM attributes WHERE product_id = ?`,
        [product.identifier]
      );
      return attributes;
    },
    gallery: async (product) => {
      const [galleries] = await db.query(
        `SELECT image_url FROM product_gallery WHERE product_id = ?`,
        [product.identifier]
      );
      return galleries.map((gallery) => gallery.image_url);
    },
    prices: async (product) => {
      const [prices] = await db.query(
        `SELECT prices.amount, currencies.label, currencies.symbol FROM prices JOIN currencies ON prices.currency_id = currencies.id WHERE prices.product_id = ?`,
        [product.identifier]
      );

      return prices.map((price) => ({
        amount: price.amount,
        currency: {
          label: price.label,
          symbol: price.symbol,
        },
      }));
    },
  },

  Attribute: {
    items: async (attribute) => {
      const [items] = await db.query(
        `SELECT * FROM attribute_items WHERE attribute_id = ?`,
        [attribute.id]
      );
      return items.map((item) => ({
        identifier: item.id,
        id: item.value,
        displayValue: item.display_value,
        value: item.value,
      }));
    },
  },
};
