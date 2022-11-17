class ContactMailer < ApplicationMailer
    def contact_mail(contact)
        @contact = contact 
    end
end
