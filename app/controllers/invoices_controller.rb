class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :update, :destroy]

  def index
    @invoices = Invoice.includes(:invoice_items).all
    render json: @invoices.to_json(include: :invoice_items)
  end

  def show
    render json: @invoice.to_json(include: :invoice_items)
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      render json: @invoice.to_json(include: :invoice_items), status: :created
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  def update
    if @invoice.update(invoice_params)
      render json: @invoice.to_json(include: :invoice_items)
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @invoice.destroy
    head :no_content
  end

  private

  def set_invoice
    @invoice = Invoice.includes(:invoice_items).find(params[:id])
  end

  # Strong parameters for allowing only safe attributes
  def invoice_params
    params.require(:invoice).permit(
      :invoiceNumber, :status, :dueDate, :createdDate, :userId, :clientName, :clientAddress, :total,
      invoice_items_attributes: [:id, :title, :description, :categoryName, :categoryId, :amount, :quantity, :totalPrice, :_destroy]
    )
  end
end
