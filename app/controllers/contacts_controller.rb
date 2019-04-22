class ContactsController < ApplicationController
  def new
    @contact = Contact.new #@var are instance variables
  end

  def create #Save to database
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to new_contact_path, notice: "Message sent successfully"
    else
      redirect_to new_contact_path, notice: "Error occurred sending message"
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :comments)
  end
end