class ContactsController < ApplicationController
  #GET /contact-us
  def new
    @contact = Contact.new #@var are instance variables
  end

  #POST /contacts
  def create #Save to database
    @contact = Contact.new(contact_params) #Mass assignment to attributes

    if @contact.save
      #Get email properties via embedded hashes
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      ContactMailer.contact_email(name, email, body)

      flash[:success] = "Message sent"
      redirect_to new_contact_path
    else
      #Error message on form validation failure or failure to save
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end

  private
    #strong parameters + whitelist form fields to collect data
    def contact_params
      params.require(:contact).permit(:name, :email, :comments) #Assignment form attributes to contact object
    end
end