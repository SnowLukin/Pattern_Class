# frozen_string_literal: true

require_relative 'phone_contact'
require_relative 'email_contact'
require_relative 'telegram_contact'

class ContactInfo
    attr_accessor :phone, :telegram, :email
    
    def initialize(**kwargs)
        @phone = PhoneContact.new(kwargs[:phone]) if kwargs[:phone]
        @telegram = TelegramContact.new(kwargs[:telegram]) if kwargs[:telegram]
        @email = EmailContact.new(kwargs[:email]) if kwargs[:email]
    end
    
    def self.from_string(string)
        phone_regex = /\A\+?\d{10}\z/
        telegram_regex = /^@[A-Za-z0-9_]{5,32}$/
        email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
        
        values = string.split(',')
        
        phone = values.find { |value| value.strip.match(phone_regex) } || ""
        telegram = values.find { |value| value.strip.match(telegram_regex) } || ""
        email = values.find { |value| value.strip.match(email_regex) } || ""
        
        new({ phone: phone.strip, telegram: telegram.strip, email: email.strip })
    end
    
    def to_s
        [phone, telegram, email].compact.join(', ')
    end
    
    def valid?
        phone.valid? || telegram.valid? || email.valid?
    end
end
