view: dim_products {
  sql_table_name: bigquery-public-data.thelook_ecommerce.products ;;
  view_label: "Products"
  label: "Products"

  dimension: product_id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    description: "The brand of the product."
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    description: "The category of the product."
    sql: ${TABLE}.category ;;
  }

  dimension: cost {
    type: number
    description: "The cost of the product."
    sql: ${TABLE}.cost ;;
  }

  dimension: department {
    type: string
    description: "The department of the product."
    sql: ${TABLE}.department ;;
  }

  dimension: name {
    type: string
    description: "The name of the product."
    sql: ${TABLE}.name ;;
  }

  dimension: retail_price {
    type: number
    description: "The retail price of the product (USD)."
    value_format_name: usd_0
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    description: "The SKU of the product."
    sql: ${TABLE}.sku ;;
  }

  measure: count_products {
    type: count
    description: "A count of the number of products."
    drill_fields: [name]
  }
}
