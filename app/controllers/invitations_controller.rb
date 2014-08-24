class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new
    @invitation.sender_id = params[:sender_id]
    @invitation.recipient_email = params[:recipient_email]

    if @invitation.save
      redirect_to "/groups", :notice => "Your invitation has been sent."
      # ModelMailer.new_record_notification(@record).deliver
      InvitationMailer.invite_neighbor(@invitation).deliver
    else
      render 'new'
    end
  end

end
