class ContactsController < ApplicationController

  def new
  
  end

  def create
    @contact = Contact.new(required_params)
    if @contact.valid?
      @contact.save
    else
      render action: 'new'
    end
  end

  private

  def required_params
    params.require(:contact).permit(:email, :message)
  end
end
