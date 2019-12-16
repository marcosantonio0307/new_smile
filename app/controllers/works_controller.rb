class WorksController < ApplicationController

	def new
		@procedure = Procedure.find(params[:procedure_id])
		@work = Work.new
	end

	def create
		@procedure = Procedure.find(params[:procedure_id])
		values = params.require(:work).permit!
		@work = Work.new values
		@work.procedure_id = params[:procedure_id]
		if @work.save
			redirect_to procedure_path(@procedure), notice: 'Procedimento Registrado'
		else
			render :new
		end
	end

	def edit
		@procedure = Procedure.find(params[:procedure_id])
		@work = Work.find(params[:id])
	end

	def update
		@procedure = Procedure.find(params[:procedure_id])
		@work = Work.find(params[:id])
		values = params.require(:work).permit!
		@work.update values

		redirect_to procedure_path(@procedure), notice: 'Procedimento Atualizado!'
	end

	def destroy
		@procedure = Procedure.find(params[:procedure_id])
		Work.destroy params[:id]
		redirect_to procedure_path(@procedure), notice: 'Procedimento Excluído!'
	end
end
