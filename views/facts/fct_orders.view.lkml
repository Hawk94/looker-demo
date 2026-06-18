view: fct_orders {
  sql_table_name: thelookbigquery-public-data.thelook_ecommerce.orders ;;
  view_label: "Orders"
  label: "Orders"

  dimension: order_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: created {
    type: time
    description: "The date/timestamp the order was created."
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

  dimension: order_status {
    type: string
    description: "The status of the order."
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    description: "The ID of the associated user."
    sql: ${TABLE}.user_id ;;
  }

  measure: count_orders_error {
    type: count
    description: "A count of the number of orders present."
    drill_fields: []
  }

  # =========================================================
  # YoY Dimensions and Measures
  # =========================================================

  dimension: is_current_year {
    type: yesno
    description: "Returns yes if the order was placed in the current calendar year."
    sql: EXTRACT(YEAR FROM ${created_raw}) = EXTRACT(YEAR FROM CURRENT_TIMESTAMP()) ;;
  }

  dimension: is_prior_year {
    type: yesno
    description: "Returns yes if the order was placed in the previous calendar year."
    sql: EXTRACT(YEAR FROM ${created_raw}) = EXTRACT(YEAR FROM CURRENT_TIMESTAMP()) - 1 ;;
  }

  measure: current_year_orders {
    type: count
    description: "Total number of orders in the current year."
    filters: [is_current_year: "yes"]
    group_label: "YoY Order Metrics"
  }

  measure: prior_year_orders {
    type: count
    description: "Total number of orders in the previous year."
    filters: [is_prior_year: "yes"]
    group_label: "YoY Order Metrics"
  }

  measure: yoy_order_growth {
    type: number
    description: "Percentage change in orders from the prior year to the current year."
    value_format_name: percent_2
    sql: 1.0 * (${current_year_orders} - NULLIF(${prior_year_orders}, 0)) / NULLIF(${prior_year_orders}, 0) ;;
    group_label: "YoY Order Metrics"
  }
}
