class Api::V1::Transactions::FindController < ApplicationController
  def index
    render json:
    if params[:id]
      Transaction.where(id: params[:id])
    elsif params[:credit_card_number]
      Transaction.where(credit_card_number: params[:credit_card_number])
    elsif params[:credit_card_expiration_date]
      Transaction.where(credit_card_expiration_date: params[:credit_card_expiration_date])
    elsif params[:result]
      Transaction.where('lower(result) = ?', params[:result].downcase)
    elsif params[:invoice_id]
      Transaction.where(invoice_id: params[:invoice_id])
    elsif params[:created_at]
      Transaction.where(created_at: params[:created_at])
    elsif params[:updated_at]
      Transaction.where(updated_at: params[:updated_at])
    end
  end

  def show
    render json:
    if params[:id]
      Transaction.find(params[:id])
    elsif params[:credit_card_number]
      Transaction.find_by(credit_card_number: params[:credit_card_number])
    elsif params[:credit_card_expiration_date]
      Transaction.find_by(credit_card_expiration_date: params[:credit_card_expiration_date])
    elsif params[:result]
      Transaction.find_by('lower(result) = ?', params[:result].downcase)
    elsif params[:invoice_id]
      Transaction.find_by(invoice_id: params[:invoice_id])
    elsif params[:created_at]
      Transaction.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      Transaction.find_by(updated_at: params[:updated_at])
    end
  end
end