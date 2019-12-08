class ProceduresController < ApplicationController
	def index
		@procedures = Procedure.all
	end

	def new
		@procedure = Procedure.new
	end

	def create
		values = params.require(:procedure).permit!
		@procedure = Procedure.create values
		if @procedure.save
			redirect_to procedure_path(@procedure), notice: 'Processo Registrado!'
		else
			render :new
		end
	end

	def show
		@procedure = Procedure.find(params[:id])

		procedure_items = [@procedure.item_1, @procedure.item_2, @procedure.item_3, 
		@procedure.item_4, @procedure.item_5, @procedure.item_6, @procedure.item_7,
		@procedure.item_8, @procedure.item_9, @procedure.item_10, @procedure.item_11,
		@procedure.item_12, @procedure.item_13, @procedure.item_14, @procedure.item_15,
		@procedure.item_16, @procedure.item_17, @procedure.item_18]

		@items = []
		procedure_items.each do |item|
			if item == 0
				@items <<  'NAO'
			else
				@items << 'SIM'
			end
		end
	end
end
