class InvoicesController < ApplicationController
    def index
        @invoices = Invoice.all
    end
    def show
        @invoice = Invoice.find_by(params[:id])
    end
end
