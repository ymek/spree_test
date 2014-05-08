class DomainConstraint
  def initialize(domain)
    @domains = [domain].flatten
  end

  def matches?(request)
    request.subdomain.present? ? domain_to_match = request.subdomain + "." + request.domain : domain_to_match = request.domain
    @domains.include? domain_to_match
  end
end


# # This class allows use of a route when a subdomain is present in the request object.
# # If the subdomain is “www,” the class will respond as if a subdomain is not present.
# class Subdomain
#   def self.matches?(request)
#     case request.subdomain
#     when 'www', '', 'boombotix', "boombotix-staging", nil
#       false
#     else
#       true
#     end
#   end
# end
