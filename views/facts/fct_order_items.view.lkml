view: fct_order_items {
  sql_table_name: bigquery-public-data.thelook_ecommerce.order_items ;;
  view_label: "Order Items"
  label: "Order Items"

  # Step 1: Update id -> order_item_id

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    description: "The date/timestamp the line item was created."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  # Step 2: Add delivered_at dimension_group

  dimension: order_id {
    type: number
    description: "The ID of the associated order."
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    type: number
    description: "The ID of the associated product."
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: returned {
    type: time
    description: "The date/timestamp the line item was returned."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    value_format_name: usd_0
    description: "The sale price of the line item (USD)."
    sql: ${TABLE}.sale_price ;;
  }

  dimension_group: shipped {
    type: time
    description: "The date/timestamp the line item was shipped."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: user_id {
    type: number
    description: "The ID of the associated user."
    sql: ${TABLE}.user_id ;;
  }

  measure: count_order_items {
    description: "A count of the number of line items."
    type: count
    drill_fields: []
  }
}
