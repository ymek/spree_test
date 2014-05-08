# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140505232119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "active_admin_comments_author_type_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "active_admin_comments_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "active_admin_comments_resource_type_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "admin_users_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "admin_users_reset_password_token", unique: true, using: :btree

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "access_token"
    t.integer  "admin_user_id"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.text     "text"
    t.string   "ig_username"
    t.string   "ig_profile_picture"
    t.string   "ig_id"
    t.string   "ig_full_name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "post_id"
    t.string   "ig_post_id"
    t.string   "ig_user_id"
    t.integer  "ig_created_time"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0
    t.integer  "attempts",   default: 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "discounts", force: true do |t|
    t.string   "code"
    t.integer  "value"
    t.string   "discount_type"
    t.integer  "usage_limit"
    t.string   "applies_to_resource"
    t.string   "applies_to_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "points_used"
    t.integer  "user_id"
    t.string   "description"
  end

  add_index "discounts", ["user_id"], name: "discounts_user_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "friendly_id_slugs_slug_sluggable_type", unique: true, using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "friendly_id_slugs_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "friendly_id_slugs_sluggable_type", using: :btree

  create_table "likes", force: true do |t|
    t.string   "ig_user_id"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "ig_profile_picture"
    t.string   "ig_username"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "likes_likeable_id_likeable_type", using: :btree

  create_table "locations", force: true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "gmaps"
    t.string   "name"
    t.string   "website"
    t.text     "hours"
    t.string   "phone"
  end

  add_index "locations", ["latitude", "longitude"], name: "locations_latitude_longitude", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title",                        default: ""
    t.integer  "user_id"
    t.text     "story",                        default: ""
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "ig_filter"
    t.integer  "ig_comment_count"
    t.integer  "ig_like_count"
    t.text     "ig_caption",                   default: "",    null: false
    t.string   "ig_image_low_resolution"
    t.string   "ig_image_thumbnail"
    t.string   "ig_image_standard_resolution"
    t.string   "ig_location"
    t.integer  "ig_created_time"
    t.boolean  "disabled",                     default: false
    t.integer  "ig_user_id"
    t.string   "ig_id"
    t.string   "ig_link"
    t.string   "ig_profile_picture"
    t.string   "ig_username"
    t.string   "slug"
    t.boolean  "title_points_redeemed",        default: false
    t.boolean  "story_points_redeemed",        default: false
    t.boolean  "photo_of_the_day",             default: false
    t.integer  "comments_count",               default: 0
  end

  add_index "posts", ["slug"], name: "posts_slug", using: :btree

  create_table "spree_addresses", force: true do |t|
    t.string    "firstname"
    t.string    "lastname"
    t.string    "address1"
    t.string    "address2"
    t.string    "city"
    t.string    "zipcode"
    t.string    "phone"
    t.string    "state_name"
    t.string    "alternative_phone"
    t.string    "company"
    t.integer   "state_id"
    t.integer   "country_id"
    t.timestamp "created_at",        precision: 6, null: false
    t.timestamp "updated_at",        precision: 6, null: false
  end

  add_index "spree_addresses", ["firstname"], name: "index_addresses_on_firstname", using: :btree
  add_index "spree_addresses", ["lastname"], name: "index_addresses_on_lastname", using: :btree

  create_table "spree_adjustments", force: true do |t|
    t.integer   "source_id"
    t.string    "source_type"
    t.integer   "adjustable_id"
    t.string    "adjustable_type"
    t.decimal   "amount",          precision: 10, scale: 2
    t.string    "label"
    t.boolean   "mandatory"
    t.boolean   "eligible",                                 default: true
    t.timestamp "created_at",      precision: 6,                            null: false
    t.timestamp "updated_at",      precision: 6,                            null: false
    t.string    "state"
    t.integer   "order_id"
    t.boolean   "included",                                 default: false
  end

  add_index "spree_adjustments", ["adjustable_id"], name: "index_adjustments_on_order_id", using: :btree
  add_index "spree_adjustments", ["order_id"], name: "index_spree_adjustments_on_order_id", using: :btree
  add_index "spree_adjustments", ["source_type", "source_id"], name: "index_spree_adjustments_on_source_type_and_source_id", using: :btree

  create_table "spree_assets", force: true do |t|
    t.integer   "viewable_id"
    t.string    "viewable_type"
    t.integer   "attachment_width"
    t.integer   "attachment_height"
    t.integer   "attachment_file_size"
    t.integer   "position"
    t.string    "attachment_content_type"
    t.string    "attachment_file_name"
    t.string    "type",                    limit: 75
    t.timestamp "attachment_updated_at",              precision: 6
    t.text      "alt"
  end

  add_index "spree_assets", ["viewable_id"], name: "index_assets_on_viewable_id", using: :btree
  add_index "spree_assets", ["viewable_type", "type"], name: "index_assets_on_viewable_type_and_type", using: :btree

  create_table "spree_calculators", force: true do |t|
    t.string    "type"
    t.integer   "calculable_id"
    t.string    "calculable_type"
    t.timestamp "created_at",      precision: 6, null: false
    t.timestamp "updated_at",      precision: 6, null: false
  end

  add_index "spree_calculators", ["calculable_id", "calculable_type"], name: "index_spree_calculators_on_calculable_id_and_calculable_type", using: :btree
  add_index "spree_calculators", ["id", "type"], name: "index_spree_calculators_on_id_and_type", using: :btree

  create_table "spree_configurations", force: true do |t|
    t.string    "name"
    t.string    "type",       limit: 50
    t.timestamp "created_at",            precision: 6, null: false
    t.timestamp "updated_at",            precision: 6, null: false
  end

  add_index "spree_configurations", ["name", "type"], name: "index_spree_configurations_on_name_and_type", using: :btree

  create_table "spree_countries", force: true do |t|
    t.string   "iso_name"
    t.string   "iso"
    t.string   "iso3"
    t.string   "name"
    t.integer  "numcode"
    t.boolean  "states_required", default: false
    t.datetime "updated_at"
  end

  create_table "spree_credit_cards", force: true do |t|
    t.string    "month"
    t.string    "year"
    t.string    "cc_type"
    t.string    "last_digits"
    t.string    "first_name"
    t.string    "last_name"
    t.integer   "address_id"
    t.string    "gateway_customer_profile_id"
    t.string    "gateway_payment_profile_id"
    t.timestamp "created_at",                  precision: 6, null: false
    t.timestamp "updated_at",                  precision: 6, null: false
    t.string    "name"
    t.integer   "user_id"
    t.integer   "payment_method_id"
  end

  add_index "spree_credit_cards", ["payment_method_id"], name: "index_spree_credit_cards_on_payment_method_id", using: :btree
  add_index "spree_credit_cards", ["user_id"], name: "index_spree_credit_cards_on_user_id", using: :btree

  create_table "spree_gateways", force: true do |t|
    t.string    "type"
    t.string    "name"
    t.text      "description"
    t.boolean   "active",                    default: true
    t.string    "environment",               default: "development"
    t.string    "server",                    default: "test"
    t.boolean   "test_mode",                 default: true
    t.timestamp "created_at",  precision: 6,                         null: false
    t.timestamp "updated_at",  precision: 6,                         null: false
  end

  create_table "spree_inventory_units", force: true do |t|
    t.string    "state"
    t.integer   "variant_id"
    t.integer   "order_id"
    t.integer   "shipment_id"
    t.integer   "return_authorization_id"
    t.timestamp "created_at",              precision: 6,                null: false
    t.timestamp "updated_at",              precision: 6,                null: false
    t.boolean   "pending",                               default: true
    t.integer   "line_item_id"
  end

  add_index "spree_inventory_units", ["line_item_id"], name: "index_spree_inventory_units_on_line_item_id", using: :btree
  add_index "spree_inventory_units", ["order_id"], name: "index_inventory_units_on_order_id", using: :btree
  add_index "spree_inventory_units", ["shipment_id"], name: "index_inventory_units_on_shipment_id", using: :btree
  add_index "spree_inventory_units", ["variant_id"], name: "index_inventory_units_on_variant_id", using: :btree

  create_table "spree_line_items", force: true do |t|
    t.integer   "variant_id"
    t.integer   "order_id"
    t.integer   "quantity",                                                    null: false
    t.decimal   "price",                precision: 8,  scale: 2,               null: false
    t.timestamp "created_at",           precision: 6,                          null: false
    t.timestamp "updated_at",           precision: 6,                          null: false
    t.string    "currency"
    t.decimal   "cost_price",           precision: 8,  scale: 2
    t.integer   "tax_category_id"
    t.decimal   "adjustment_total",     precision: 10, scale: 2, default: 0.0
    t.decimal   "additional_tax_total", precision: 10, scale: 2, default: 0.0
    t.decimal   "promo_total",          precision: 10, scale: 2, default: 0.0
    t.decimal   "included_tax_total",   precision: 10, scale: 2, default: 0.0, null: false
    t.decimal   "pre_tax_amount",       precision: 8,  scale: 2
  end

  add_index "spree_line_items", ["order_id"], name: "index_spree_line_items_on_order_id", using: :btree
  add_index "spree_line_items", ["variant_id"], name: "index_spree_line_items_on_variant_id", using: :btree

  create_table "spree_log_entries", force: true do |t|
    t.integer   "source_id"
    t.string    "source_type"
    t.text      "details"
    t.timestamp "created_at",  precision: 6, null: false
    t.timestamp "updated_at",  precision: 6, null: false
  end

  create_table "spree_option_type_translations", force: true do |t|
    t.integer   "spree_option_type_id"
    t.string    "locale"
    t.timestamp "created_at",           precision: 6, null: false
    t.timestamp "updated_at",           precision: 6, null: false
    t.string    "name"
    t.string    "presentation"
  end

  add_index "spree_option_type_translations", ["locale"], name: "index_spree_option_type_translations_on_locale", using: :btree
  add_index "spree_option_type_translations", ["spree_option_type_id"], name: "index_spree_option_type_translations_on_spree_option_type_id", using: :btree

  create_table "spree_option_types", force: true do |t|
    t.string    "name",         limit: 100
    t.string    "presentation", limit: 100
    t.integer   "position",                               default: 0, null: false
    t.timestamp "created_at",               precision: 6,             null: false
    t.timestamp "updated_at",               precision: 6,             null: false
  end

  create_table "spree_option_types_prototypes", id: false, force: true do |t|
    t.integer "prototype_id"
    t.integer "option_type_id"
  end

  create_table "spree_option_value_translations", force: true do |t|
    t.integer  "spree_option_value_id"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "presentation"
  end

  add_index "spree_option_value_translations", ["locale"], name: "index_spree_option_value_translations_on_locale", using: :btree
  add_index "spree_option_value_translations", ["spree_option_value_id"], name: "index_spree_option_value_translations_on_spree_option_value_id", using: :btree

  create_table "spree_option_values", force: true do |t|
    t.integer   "position"
    t.string    "name"
    t.string    "presentation"
    t.integer   "option_type_id"
    t.timestamp "created_at",     precision: 6, null: false
    t.timestamp "updated_at",     precision: 6, null: false
  end

  add_index "spree_option_values", ["option_type_id"], name: "index_spree_option_values_on_option_type_id", using: :btree

  create_table "spree_option_values_variants", id: false, force: true do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
  end

  add_index "spree_option_values_variants", ["variant_id", "option_value_id"], name: "index_option_values_variants_on_variant_id_and_option_value_id", using: :btree
  add_index "spree_option_values_variants", ["variant_id"], name: "index_spree_option_values_variants_on_variant_id", using: :btree

  create_table "spree_orders", force: true do |t|
    t.string    "number",                 limit: 32
    t.decimal   "item_total",                        precision: 10, scale: 2, default: 0.0,     null: false
    t.decimal   "total",                             precision: 10, scale: 2, default: 0.0,     null: false
    t.string    "state"
    t.decimal   "adjustment_total",                  precision: 10, scale: 2, default: 0.0,     null: false
    t.integer   "user_id"
    t.timestamp "completed_at",                      precision: 6
    t.integer   "bill_address_id"
    t.integer   "ship_address_id"
    t.decimal   "payment_total",                     precision: 10, scale: 2, default: 0.0
    t.integer   "shipping_method_id"
    t.string    "shipment_state"
    t.string    "payment_state"
    t.string    "email"
    t.text      "special_instructions"
    t.timestamp "created_at",                        precision: 6,                              null: false
    t.timestamp "updated_at",                        precision: 6,                              null: false
    t.string    "currency"
    t.string    "last_ip_address"
    t.integer   "created_by_id"
    t.string    "channel",                                                    default: "spree"
    t.decimal   "additional_tax_total",              precision: 10, scale: 2, default: 0.0,     null: false
    t.decimal   "shipment_total",                    precision: 10, scale: 2, default: 0.0,     null: false
    t.decimal   "promo_total",                       precision: 10, scale: 2, default: 0.0
    t.decimal   "included_tax_total",                precision: 10, scale: 2, default: 0.0,     null: false
    t.integer   "item_count",                                                 default: 0
    t.integer   "approver_id"
    t.datetime  "approved_at"
    t.boolean   "confirmation_delivered",                                     default: false
    t.boolean   "considered_risky",                                           default: false
  end

  add_index "spree_orders", ["completed_at"], name: "index_spree_orders_on_completed_at", using: :btree
  add_index "spree_orders", ["number"], name: "index_spree_orders_on_number", using: :btree
  add_index "spree_orders", ["user_id", "created_by_id"], name: "index_spree_orders_on_user_id_and_created_by_id", using: :btree
  add_index "spree_orders", ["user_id"], name: "index_spree_orders_on_user_id", using: :btree

  create_table "spree_orders_promotions", id: false, force: true do |t|
    t.integer "order_id"
    t.integer "promotion_id"
  end

  create_table "spree_payment_capture_events", force: true do |t|
    t.decimal  "amount",     precision: 10, scale: 2, default: 0.0
    t.integer  "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_payment_capture_events", ["payment_id"], name: "index_spree_payment_capture_events_on_payment_id", using: :btree

  create_table "spree_payment_methods", force: true do |t|
    t.string    "type"
    t.string    "name"
    t.text      "description"
    t.boolean   "active",                     default: true
    t.string    "environment",                default: "development"
    t.timestamp "deleted_at",   precision: 6
    t.timestamp "created_at",   precision: 6,                         null: false
    t.timestamp "updated_at",   precision: 6,                         null: false
    t.string    "display_on"
    t.boolean   "auto_capture"
  end

  add_index "spree_payment_methods", ["id", "type"], name: "index_spree_payment_methods_on_id_and_type", using: :btree

  create_table "spree_payments", force: true do |t|
    t.decimal   "amount",               precision: 10, scale: 2, default: 0.0, null: false
    t.integer   "order_id"
    t.integer   "source_id"
    t.string    "source_type"
    t.integer   "payment_method_id"
    t.string    "state"
    t.string    "response_code"
    t.string    "avs_response"
    t.timestamp "created_at",           precision: 6,                          null: false
    t.timestamp "updated_at",           precision: 6,                          null: false
    t.string    "identifier"
    t.string    "cvv_response_code"
    t.string    "cvv_response_message"
    t.decimal   "uncaptured_amount",    precision: 10, scale: 2, default: 0.0
  end

  add_index "spree_payments", ["order_id"], name: "index_spree_payments_on_order_id", using: :btree
  add_index "spree_payments", ["payment_method_id"], name: "index_spree_payments_on_payment_method_id", using: :btree

  create_table "spree_preferences", force: true do |t|
    t.text      "value"
    t.string    "key"
    t.string    "value_type"
    t.timestamp "created_at", precision: 6, null: false
    t.timestamp "updated_at", precision: 6, null: false
  end

  add_index "spree_preferences", ["key"], name: "index_spree_preferences_on_key", unique: true, using: :btree

  create_table "spree_prices", force: true do |t|
    t.integer  "variant_id",                         null: false
    t.decimal  "amount",     precision: 8, scale: 2
    t.string   "currency"
    t.datetime "deleted_at"
  end

  add_index "spree_prices", ["variant_id", "currency"], name: "index_spree_prices_on_variant_id_and_currency", using: :btree
  add_index "spree_prices", ["variant_id"], name: "index_spree_prices_on_variant_id", using: :btree

  create_table "spree_product_option_types", force: true do |t|
    t.integer   "position"
    t.integer   "product_id"
    t.integer   "option_type_id"
    t.timestamp "created_at",     precision: 6, null: false
    t.timestamp "updated_at",     precision: 6, null: false
  end

  create_table "spree_product_properties", force: true do |t|
    t.string    "value"
    t.integer   "product_id"
    t.integer   "property_id"
    t.timestamp "created_at",  precision: 6,             null: false
    t.timestamp "updated_at",  precision: 6,             null: false
    t.integer   "position",                  default: 0
  end

  add_index "spree_product_properties", ["product_id"], name: "index_product_properties_on_product_id", using: :btree

  create_table "spree_product_translations", force: true do |t|
    t.integer   "spree_product_id"
    t.string    "locale"
    t.timestamp "created_at",       precision: 6, null: false
    t.timestamp "updated_at",       precision: 6, null: false
    t.string    "name"
    t.text      "description"
    t.string    "meta_description"
    t.string    "meta_keywords"
    t.string    "slug"
  end

  add_index "spree_product_translations", ["locale"], name: "index_spree_product_translations_on_locale", using: :btree
  add_index "spree_product_translations", ["spree_product_id"], name: "index_spree_product_translations_on_spree_product_id", using: :btree

  create_table "spree_products", force: true do |t|
    t.string    "name",                               default: "", null: false
    t.text      "description"
    t.timestamp "available_on",         precision: 6
    t.timestamp "deleted_at",           precision: 6
    t.string    "slug"
    t.text      "meta_description"
    t.string    "meta_keywords"
    t.integer   "tax_category_id"
    t.integer   "shipping_category_id"
    t.timestamp "created_at",           precision: 6,              null: false
    t.timestamp "updated_at",           precision: 6,              null: false
  end

  add_index "spree_products", ["available_on"], name: "index_spree_products_on_available_on", using: :btree
  add_index "spree_products", ["deleted_at"], name: "index_spree_products_on_deleted_at", using: :btree
  add_index "spree_products", ["name"], name: "index_spree_products_on_name", using: :btree
  add_index "spree_products", ["slug"], name: "index_spree_products_on_slug", using: :btree
  add_index "spree_products", ["slug"], name: "permalink_idx_unique", unique: true, using: :btree

  create_table "spree_products_promotion_rules", id: false, force: true do |t|
    t.integer "product_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_products_promotion_rules", ["product_id"], name: "index_products_promotion_rules_on_product_id", using: :btree
  add_index "spree_products_promotion_rules", ["promotion_rule_id"], name: "index_products_promotion_rules_on_promotion_rule_id", using: :btree

  create_table "spree_products_taxons", force: true do |t|
    t.integer "product_id"
    t.integer "taxon_id"
    t.integer "position"
  end

  add_index "spree_products_taxons", ["product_id"], name: "index_spree_products_taxons_on_product_id", using: :btree
  add_index "spree_products_taxons", ["taxon_id"], name: "index_spree_products_taxons_on_taxon_id", using: :btree

  create_table "spree_promotion_action_line_items", force: true do |t|
    t.integer "promotion_action_id"
    t.integer "variant_id"
    t.integer "quantity",            default: 1
  end

  create_table "spree_promotion_actions", force: true do |t|
    t.integer "promotion_id"
    t.integer "position"
    t.string  "type"
  end

  add_index "spree_promotion_actions", ["id", "type"], name: "index_spree_promotion_actions_on_id_and_type", using: :btree
  add_index "spree_promotion_actions", ["promotion_id"], name: "index_spree_promotion_actions_on_promotion_id", using: :btree

  create_table "spree_promotion_rules", force: true do |t|
    t.integer   "promotion_id"
    t.integer   "user_id"
    t.integer   "product_group_id"
    t.string    "type"
    t.timestamp "created_at",       precision: 6, null: false
    t.timestamp "updated_at",       precision: 6, null: false
    t.string    "code"
  end

  add_index "spree_promotion_rules", ["product_group_id"], name: "index_promotion_rules_on_product_group_id", using: :btree
  add_index "spree_promotion_rules", ["user_id"], name: "index_promotion_rules_on_user_id", using: :btree

  create_table "spree_promotion_rules_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_promotion_rules_users", ["promotion_rule_id"], name: "index_promotion_rules_users_on_promotion_rule_id", using: :btree
  add_index "spree_promotion_rules_users", ["user_id"], name: "index_promotion_rules_users_on_user_id", using: :btree

  create_table "spree_promotion_translations", force: true do |t|
    t.integer   "spree_promotion_id"
    t.string    "locale"
    t.timestamp "created_at",         precision: 6, null: false
    t.timestamp "updated_at",         precision: 6, null: false
    t.string    "name"
    t.string    "description"
  end

  add_index "spree_promotion_translations", ["locale"], name: "index_spree_promotion_translations_on_locale", using: :btree
  add_index "spree_promotion_translations", ["spree_promotion_id"], name: "index_spree_promotion_translations_on_spree_promotion_id", using: :btree

  create_table "spree_promotions", force: true do |t|
    t.string    "description"
    t.timestamp "expires_at",          precision: 6
    t.timestamp "starts_at",           precision: 6
    t.string    "name"
    t.string    "type"
    t.integer   "usage_limit"
    t.string    "match_policy",                      default: "all"
    t.string    "code"
    t.boolean   "advertise",                         default: false
    t.string    "path"
    t.timestamp "created_at",          precision: 6,                 null: false
    t.timestamp "updated_at",          precision: 6,                 null: false
    t.integer   "swagonomics_user_id"
  end

  add_index "spree_promotions", ["id", "type"], name: "index_spree_promotions_on_id_and_type", using: :btree

  create_table "spree_properties", force: true do |t|
    t.string    "name"
    t.string    "presentation",               null: false
    t.timestamp "created_at",   precision: 6, null: false
    t.timestamp "updated_at",   precision: 6, null: false
  end

  create_table "spree_properties_prototypes", id: false, force: true do |t|
    t.integer "prototype_id"
    t.integer "property_id"
  end

  create_table "spree_property_translations", force: true do |t|
    t.integer   "spree_property_id"
    t.string    "locale"
    t.timestamp "created_at",        precision: 6, null: false
    t.timestamp "updated_at",        precision: 6, null: false
    t.string    "name"
    t.string    "presentation"
  end

  add_index "spree_property_translations", ["locale"], name: "index_spree_property_translations_on_locale", using: :btree
  add_index "spree_property_translations", ["spree_property_id"], name: "index_spree_property_translations_on_spree_property_id", using: :btree

  create_table "spree_prototypes", force: true do |t|
    t.string    "name"
    t.timestamp "created_at", precision: 6, null: false
    t.timestamp "updated_at", precision: 6, null: false
  end

  create_table "spree_return_authorizations", force: true do |t|
    t.string    "number"
    t.string    "state"
    t.decimal   "amount",            precision: 10, scale: 2, default: 0.0, null: false
    t.integer   "order_id"
    t.text      "reason"
    t.timestamp "created_at",        precision: 6,                          null: false
    t.timestamp "updated_at",        precision: 6,                          null: false
    t.integer   "stock_location_id"
  end

  create_table "spree_roles", force: true do |t|
    t.string "name"
  end

  create_table "spree_roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "spree_roles_users", ["role_id"], name: "index_spree_roles_users_on_role_id", using: :btree
  add_index "spree_roles_users", ["user_id"], name: "index_spree_roles_users_on_user_id", using: :btree

  create_table "spree_shipments", force: true do |t|
    t.string    "tracking"
    t.string    "number"
    t.decimal   "cost",                 precision: 8,  scale: 2
    t.timestamp "shipped_at",           precision: 6
    t.integer   "order_id"
    t.integer   "address_id"
    t.string    "state"
    t.timestamp "created_at",           precision: 6,                          null: false
    t.timestamp "updated_at",           precision: 6,                          null: false
    t.integer   "stock_location_id"
    t.decimal   "adjustment_total",     precision: 10, scale: 2, default: 0.0
    t.decimal   "additional_tax_total", precision: 10, scale: 2, default: 0.0
    t.decimal   "promo_total",          precision: 10, scale: 2, default: 0.0
    t.decimal   "included_tax_total",   precision: 10, scale: 2, default: 0.0, null: false
    t.decimal   "pre_tax_amount",       precision: 8,  scale: 2
  end

  add_index "spree_shipments", ["number"], name: "index_shipments_on_number", using: :btree
  add_index "spree_shipments", ["order_id"], name: "index_spree_shipments_on_order_id", using: :btree
  add_index "spree_shipments", ["stock_location_id"], name: "index_spree_shipments_on_stock_location_id", using: :btree

  create_table "spree_shipping_categories", force: true do |t|
    t.string    "name"
    t.timestamp "created_at", precision: 6, null: false
    t.timestamp "updated_at", precision: 6, null: false
  end

  create_table "spree_shipping_method_categories", force: true do |t|
    t.integer   "shipping_method_id",                 null: false
    t.integer   "shipping_category_id",               null: false
    t.timestamp "created_at",           precision: 6, null: false
    t.timestamp "updated_at",           precision: 6, null: false
  end

  add_index "spree_shipping_method_categories", ["shipping_category_id", "shipping_method_id"], name: "unique_spree_shipping_method_categories", unique: true, using: :btree
  add_index "spree_shipping_method_categories", ["shipping_method_id"], name: "index_spree_shipping_method_categories_on_shipping_method_id", using: :btree

  create_table "spree_shipping_methods", force: true do |t|
    t.string    "name"
    t.string    "display_on"
    t.timestamp "deleted_at",      precision: 6
    t.timestamp "created_at",      precision: 6, null: false
    t.timestamp "updated_at",      precision: 6, null: false
    t.string    "tracking_url"
    t.string    "admin_name"
    t.integer   "tax_category_id"
  end

  create_table "spree_shipping_methods_zones", id: false, force: true do |t|
    t.integer "shipping_method_id"
    t.integer "zone_id"
  end

  create_table "spree_shipping_rates", force: true do |t|
    t.integer   "shipment_id"
    t.integer   "shipping_method_id"
    t.boolean   "selected",                                   default: false
    t.decimal   "cost",               precision: 8, scale: 2, default: 0.0
    t.timestamp "created_at",         precision: 6,                           null: false
    t.timestamp "updated_at",         precision: 6,                           null: false
    t.integer   "tax_rate_id"
  end

  add_index "spree_shipping_rates", ["shipment_id", "shipping_method_id"], name: "spree_shipping_rates_join_index", unique: true, using: :btree

  create_table "spree_skrill_transactions", force: true do |t|
    t.string    "email"
    t.float     "amount"
    t.string    "currency"
    t.integer   "transaction_id"
    t.integer   "customer_id"
    t.string    "payment_type"
    t.timestamp "created_at",     precision: 6, null: false
    t.timestamp "updated_at",     precision: 6, null: false
  end

  create_table "spree_state_changes", force: true do |t|
    t.string    "name"
    t.string    "previous_state"
    t.integer   "stateful_id"
    t.integer   "user_id"
    t.string    "stateful_type"
    t.string    "next_state"
    t.timestamp "created_at",     precision: 6, null: false
    t.timestamp "updated_at",     precision: 6, null: false
  end

  create_table "spree_states", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "country_id"
    t.datetime "updated_at"
  end

  create_table "spree_stock_items", force: true do |t|
    t.integer   "stock_location_id"
    t.integer   "variant_id"
    t.integer   "count_on_hand",                   default: 0,     null: false
    t.timestamp "created_at",        precision: 6,                 null: false
    t.timestamp "updated_at",        precision: 6,                 null: false
    t.boolean   "backorderable",                   default: false
    t.datetime  "deleted_at"
  end

  add_index "spree_stock_items", ["stock_location_id", "variant_id"], name: "stock_item_by_loc_and_var_id", using: :btree
  add_index "spree_stock_items", ["stock_location_id"], name: "index_spree_stock_items_on_stock_location_id", using: :btree

  create_table "spree_stock_locations", force: true do |t|
    t.string    "name"
    t.timestamp "created_at",             precision: 6,                 null: false
    t.timestamp "updated_at",             precision: 6,                 null: false
    t.string    "address1"
    t.string    "address2"
    t.string    "city"
    t.integer   "state_id"
    t.string    "state_name"
    t.integer   "country_id"
    t.string    "zipcode"
    t.string    "phone"
    t.boolean   "active",                               default: true
    t.boolean   "backorderable_default",                default: false
    t.boolean   "propagate_all_variants",               default: true
    t.string    "admin_name"
  end

  create_table "spree_stock_movements", force: true do |t|
    t.integer   "stock_item_id"
    t.integer   "quantity",                      default: 0
    t.string    "action"
    t.timestamp "created_at",      precision: 6,             null: false
    t.timestamp "updated_at",      precision: 6,             null: false
    t.integer   "originator_id"
    t.string    "originator_type"
  end

  add_index "spree_stock_movements", ["stock_item_id"], name: "index_spree_stock_movements_on_stock_item_id", using: :btree

  create_table "spree_stock_transfers", force: true do |t|
    t.string    "type"
    t.string    "reference"
    t.integer   "source_location_id"
    t.integer   "destination_location_id"
    t.timestamp "created_at",              precision: 6, null: false
    t.timestamp "updated_at",              precision: 6, null: false
    t.string    "number"
  end

  add_index "spree_stock_transfers", ["destination_location_id"], name: "index_spree_stock_transfers_on_destination_location_id", using: :btree
  add_index "spree_stock_transfers", ["number"], name: "index_spree_stock_transfers_on_number", using: :btree
  add_index "spree_stock_transfers", ["source_location_id"], name: "index_spree_stock_transfers_on_source_location_id", using: :btree

  create_table "spree_tax_categories", force: true do |t|
    t.string    "name"
    t.string    "description"
    t.boolean   "is_default",                default: false
    t.timestamp "deleted_at",  precision: 6
    t.timestamp "created_at",  precision: 6,                 null: false
    t.timestamp "updated_at",  precision: 6,                 null: false
  end

  create_table "spree_tax_rates", force: true do |t|
    t.decimal   "amount",             precision: 8, scale: 5
    t.integer   "zone_id"
    t.integer   "tax_category_id"
    t.boolean   "included_in_price",                          default: false
    t.timestamp "created_at",         precision: 6,                           null: false
    t.timestamp "updated_at",         precision: 6,                           null: false
    t.string    "name"
    t.boolean   "show_rate_in_label",                         default: true
    t.timestamp "deleted_at",         precision: 6
  end

  create_table "spree_taxon_translations", force: true do |t|
    t.integer   "spree_taxon_id"
    t.string    "locale"
    t.timestamp "created_at",       precision: 6, null: false
    t.timestamp "updated_at",       precision: 6, null: false
    t.string    "name"
    t.text      "description"
    t.string    "meta_title"
    t.string    "meta_description"
    t.string    "meta_keywords"
    t.string    "permalink"
  end

  add_index "spree_taxon_translations", ["locale"], name: "index_spree_taxon_translations_on_locale", using: :btree
  add_index "spree_taxon_translations", ["spree_taxon_id"], name: "index_spree_taxon_translations_on_spree_taxon_id", using: :btree

  create_table "spree_taxonomies", force: true do |t|
    t.string    "name",                                 null: false
    t.timestamp "created_at", precision: 6,             null: false
    t.timestamp "updated_at", precision: 6,             null: false
    t.integer   "position",                 default: 0
  end

  create_table "spree_taxonomy_translations", force: true do |t|
    t.integer   "spree_taxonomy_id"
    t.string    "locale"
    t.timestamp "created_at",        precision: 6, null: false
    t.timestamp "updated_at",        precision: 6, null: false
    t.string    "name"
  end

  add_index "spree_taxonomy_translations", ["locale"], name: "index_spree_taxonomy_translations_on_locale", using: :btree
  add_index "spree_taxonomy_translations", ["spree_taxonomy_id"], name: "index_spree_taxonomy_translations_on_spree_taxonomy_id", using: :btree

  create_table "spree_taxons", force: true do |t|
    t.integer   "parent_id"
    t.integer   "position",                        default: 0
    t.string    "name",                                        null: false
    t.string    "permalink"
    t.integer   "taxonomy_id"
    t.integer   "lft"
    t.integer   "rgt"
    t.string    "icon_file_name"
    t.string    "icon_content_type"
    t.integer   "icon_file_size"
    t.timestamp "icon_updated_at",   precision: 6
    t.text      "description"
    t.timestamp "created_at",        precision: 6,             null: false
    t.timestamp "updated_at",        precision: 6,             null: false
    t.string    "meta_title"
    t.string    "meta_description"
    t.string    "meta_keywords"
    t.integer   "depth"
  end

  add_index "spree_taxons", ["parent_id"], name: "index_taxons_on_parent_id", using: :btree
  add_index "spree_taxons", ["permalink"], name: "index_taxons_on_permalink", using: :btree
  add_index "spree_taxons", ["taxonomy_id"], name: "index_taxons_on_taxonomy_id", using: :btree

  create_table "spree_tokenized_permissions", force: true do |t|
    t.integer   "permissable_id"
    t.string    "permissable_type"
    t.string    "token"
    t.timestamp "created_at",       precision: 6, null: false
    t.timestamp "updated_at",       precision: 6, null: false
  end

  add_index "spree_tokenized_permissions", ["permissable_id", "permissable_type"], name: "index_tokenized_name_and_type", using: :btree

  create_table "spree_trackers", force: true do |t|
    t.string    "environment"
    t.string    "analytics_id"
    t.boolean   "active",                     default: true
    t.timestamp "created_at",   precision: 6,                null: false
    t.timestamp "updated_at",   precision: 6,                null: false
  end

  create_table "spree_users", force: true do |t|
    t.string    "encrypted_password",     limit: 128
    t.string    "password_salt",          limit: 128
    t.string    "email"
    t.string    "remember_token"
    t.string    "persistence_token"
    t.string    "reset_password_token"
    t.string    "perishable_token"
    t.integer   "sign_in_count",                                    default: 0, null: false
    t.integer   "failed_attempts",                                  default: 0, null: false
    t.timestamp "last_request_at",                    precision: 6
    t.timestamp "current_sign_in_at",                 precision: 6
    t.timestamp "last_sign_in_at",                    precision: 6
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.string    "login"
    t.integer   "ship_address_id"
    t.integer   "bill_address_id"
    t.string    "authentication_token"
    t.string    "unlock_token"
    t.timestamp "locked_at",                          precision: 6
    t.timestamp "reset_password_sent_at",             precision: 6
    t.timestamp "created_at",                         precision: 6,             null: false
    t.timestamp "updated_at",                         precision: 6,             null: false
    t.timestamp "remember_created_at",                precision: 6
    t.string    "spree_api_key",          limit: 48
  end

  add_index "spree_users", ["email"], name: "email_idx_unique", unique: true, using: :btree

  create_table "spree_variants", force: true do |t|
    t.string    "sku",                                     default: "",    null: false
    t.decimal   "weight",          precision: 8, scale: 2, default: 0.0
    t.decimal   "height",          precision: 8, scale: 2
    t.decimal   "width",           precision: 8, scale: 2
    t.decimal   "depth",           precision: 8, scale: 2
    t.timestamp "deleted_at",      precision: 6
    t.boolean   "is_master",                               default: false
    t.integer   "product_id"
    t.decimal   "cost_price",      precision: 8, scale: 2
    t.integer   "position"
    t.string    "cost_currency"
    t.boolean   "track_inventory",                         default: true
    t.datetime  "updated_at"
    t.integer   "tax_category_id"
  end

  add_index "spree_variants", ["product_id"], name: "index_spree_variants_on_product_id", using: :btree
  add_index "spree_variants", ["sku"], name: "index_spree_variants_on_sku", using: :btree
  add_index "spree_variants", ["tax_category_id"], name: "index_spree_variants_on_tax_category_id", using: :btree

  create_table "spree_zone_members", force: true do |t|
    t.integer   "zoneable_id"
    t.string    "zoneable_type"
    t.integer   "zone_id"
    t.timestamp "created_at",    precision: 6, null: false
    t.timestamp "updated_at",    precision: 6, null: false
  end

  create_table "spree_zones", force: true do |t|
    t.string    "name"
    t.string    "description"
    t.boolean   "default_tax",                      default: false
    t.integer   "zone_members_count",               default: 0
    t.timestamp "created_at",         precision: 6,                 null: false
    t.timestamp "updated_at",         precision: 6,                 null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "points",                 default: 0
    t.integer  "redeemed_count"
    t.datetime "last_redeemed"
    t.string   "username"
    t.string   "ig_username"
    t.text     "ig_biography"
    t.string   "ig_website"
    t.string   "ig_profile_picture"
    t.string   "ig_full_name"
    t.integer  "ig_photo_count"
    t.integer  "ig_followed_by"
    t.integer  "ig_follows"
    t.string   "ig_user_id"
    t.string   "slug"
    t.integer  "bitfields",              default: 0,     null: false
    t.boolean  "disabled",               default: false
  end

  add_index "users", ["email"], name: "users_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "users_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "users_slug", using: :btree
  add_index "users", ["username"], name: "users_username", unique: true, using: :btree

end
