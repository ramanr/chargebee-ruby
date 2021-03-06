module ChargeBee
  class Addon < Model

  attr_accessor :id, :name, :invoice_name, :type, :charge_type, :price, :period, :period_unit,
  :unit, :status, :archived_at

  # OPERATIONS
  #-----------
    
  def self.list(params={}, env=nil)
    Request.send('get', "/addons", params, env)
  end    

  def self.retrieve(id, env=nil)
    Request.send('get', "/addons/#{id.to_s}", {}, env)
  end    

  end # ~Addon
end # ~ChargeBee    