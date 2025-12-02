view: dim_users {
  sql_table_name: bigquery-public-data.thelook_ecommerce.users ;;
  view_label: "Users"
  label: "Users"

  dimension: user_id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: city {
    type: string
    description: "The city the user lives in."
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    description: "The country the user lives in."
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    description: "The date/timestamp the user was created."
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

  dimension: email {
    type: string
    description: "The email address of the user."
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    description: "The first name of the user."
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    description: "The last name of the user."
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    description: "The lattitude of the user's address."
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    description: "The longitude of the user's address."
    sql: ${TABLE}.longitude ;;
  }

  dimension: postal_code {
    type: string
    description: "The postal code of the user's address."
    sql: ${TABLE}.postal_code ;;
  }

  dimension: state {
    type: string
    description: "The state the user lives in."
    sql: ${TABLE}.state ;;
  }

  dimension: street_address {
    type: string
    description: "The first line of the user's address."
    sql: ${TABLE}.street_address ;;
  }

  measure: count_users {
    type: count
    description: "A count of the number of users."
    drill_fields: [last_name, first_name]
  }
}
