module ChargeBee
  class Result

    def initialize(response)
      @response = response
    end
    
    def subscription()
      get(:subscription, Subscription, {:addons => Subscription::Addon})
    end

    def customer()
      get(:customer, Customer)
    end

    def card()
      get(:card, Card)
    end
    
    def address()
      get(:address, Address)
    end
    
    def invoice()
      get(:invoice, Invoice, {:line_items => Invoice::LineItem, :discounts => Invoice::Discount, :taxes => Invoice::Tax})
    end

    def estimate()
      get(:estimate, Estimate, {:line_items => Estimate::LineItem, :discounts => Estimate::Discount, :taxes => Estimate::Tax})
    end

    def transaction()
      get(:transaction, Transaction)
    end

    def event()
      get(:event, Event)
    end

    def hosted_page()
      get(:hosted_page, HostedPage)
    end
    
    def plan()
      get(:plan, Plan)
    end
    
    def addon()
      get(:addon, Addon)
    end
    
    def coupon()
      get(:coupon, Coupon)
    end
    
    def to_s(*args) 
      JSON.pretty_generate(@response) 
    end
    
    private
    def get(type, klass, sub_types = {})
      klass.construct(@response[type], sub_types)
    end
    
  end
end