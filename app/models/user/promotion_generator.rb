require 'active_support/concern'

module User::PromotionGenerator
  extend ActiveSupport::Concern

  def generate_promotion(promo={})
    # make a Spree::Promotion (Spree::Activator)
    promotion = Spree::Promotion.create(promo[:promotion])
    promo[:promotion][:id] = promotion.id

    if promo[:promotion_action]
      # create an action and a calculator and add it to the *.promotions_actions array
      action = create_promotion_action(promo[:promotion_action])

      promotion.promotion_actions << action
    end

    if promo[:promotion_rule]
      # create a rule, and associate products
      create_promotion_rule promo
    end

    # return promotion
    promotion
  end

  def create_promotion_action(promotion_action)
    # create an Spree::Promotion::Action and Spree::Calculator
    if promotion_action[:type] == "percent"
      Spree::Promotion::Actions::CreateAdjustment.create({
        calculator: Spree::Calculator::FlatPercentItemTotal.new(preferred_flat_percent: promotion_action[:value])
      })
    elsif promotion_action[:type] == "flat_rate"
      Spree::Promotion::Actions::CreateAdjustment.create({
        calculator: Spree::Calculator::FlatRate.new(preferred_amount: promotion_action[:value])
      })
    end
  end

  def create_promotion_rule(promotion)
    if promotion[:promotion_rule][:type] = "product"
      # create a product rule which Spree::Products can be associated with
      promotion_rule = Spree::Promotion::Rules::Product.create(promotion_id: promotion[:promotion][:id])

      # add product association in HABTM join table
      if promotion[:promotion_rule][:taxon]
        products = promotion[:promotion_rule][:taxon].products
      elsif promotion[:promotion_rule][:products]
        products = promotion[:promotion_rule][:products]
      end

      if products
        products.each do |product|
          promotion_rule.products << product
        end
      end
    end
  end

  def generate_unique_discount_code
    "#{self.username}-" + rand(36**8).to_s(36)
  end
end
