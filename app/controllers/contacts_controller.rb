class ContactsController < ApplicationController
  def new
    @contact = Contact.new #@var are instance variables
  end

  def create #Save to database
    @contact = Contact.new(contact_params) #Mass assignment to attributes

    if @contact.save
      flash[:success] = "Message sent"
      redirect_to new_contact_path
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments) #Assignment form attributes to contact object
    end
end