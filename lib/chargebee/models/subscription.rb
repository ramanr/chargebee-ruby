module ChargeBee
  class Subscription < Model

    class Addon < Model
      attr_accessor :id, :quantity
    end

    class Coupon < Model
      attr_accessor :coupon_id, :apply_till, :applied_count
    end

  attr_accessor :id, :plan_id, :plan_quantity, :status, :trial_start, :trial_end, :current_term_start,
  :current_term_end, :remaining_billing_cycles, :created_at, :activated_at, :cancelled_at, :cancel_reason,
  :due_invoices_count, :due_since, :total_dues, :addons, :coupon, :coupons

  # OPERATIONS
  #-----------
    
  def self.create(params, env=nil)
    Request.send('post', "/subscriptions", params, env)
  end    

  def self.create_for_customer(id, params, env=nil)
    Request.send('post', "/customers/#{id.to_s}/subscriptions", params, env)
  end    

  def self.list(params={}, env=nil)
    Request.send('get', "/subscriptions", params, env)
  end    

  def self.retrieve(id, env=nil)
    Request.send('get', "/subscriptions/#{id.to_s}", {}, env)
  end    

  def self.update(id, params={}, env=nil)
    Request.send('post', "/subscriptions/#{id.to_s}", params, env)
  end    

  def self.change_term_end(id, params, env=nil)
    Request.send('post', "/subscriptions/#{id.to_s}/change_term_end", params, env)
  end    

  def self.cancel(id, params={}, env=nil)
    Request.send('post', "/subscriptions/#{id.to_s}/cancel", params, env)
  end    

  def self.reactivate(id, params={}, env=nil)
    Request.send('post', "/subscriptions/#{id.to_s}/reactivate", params, env)
  end    

  def self.add_credit(id, params, env=nil)
    Request.send('post', "/subscriptions/#{id.to_s}/add_credit", params, env)
  end    

  end # ~Subscription
end # ~ChargeBee    