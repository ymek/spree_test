module User::MailchimpUpdater
  def mailchimp_api_client(api_key=nil)
    api_key ||= Rails.configuration.x.mailchimp.api_key
    Mailchimp::API.new(api_key)
  end

  def mailchimp_list_hash
    {
      id: "0d475bb519",
      email_address: self.email,
      merge_vars: {
        'FNAME' => self.first_name,
        'LNAME' => self.last_name
      },
      email_type: 'html',
      double_optin: false,
      update_existing: true,
      replace_interests: true,
      send_welcome: false
    }
  end

  def mailchimp_list_subscribe
    # Subscribe self.email, with merge variables 'FNAME' and 'LNAME', to the list identified by list_id
    mailchimp_api_client.listSubscribe(mailchimp_list_hash)
  end

  def mailchimp_list_unsubscribe
    mailchimp_api_client.listUnsubscribe(mailchimp_list_hash)
  end
end
