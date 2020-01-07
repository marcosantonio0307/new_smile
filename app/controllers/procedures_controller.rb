class ProceduresController < ApplicationController
	before_action :authenticate_user!, only:[:index, :create, :update, :reports, :avatar, :photos, :raysx, :teleraysx, :traceds, :usps, :purge_photos, :purge_raysx, :purge_teleraysx, :purge_traceds, :purge_usps]
	def index
		@procedures = Procedure.where(status: false)
	end

	def finished
		@procedures = Procedure.where(status: true)
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

	def edit
		@procedure = Procedure.find(params[:id])
	end

	def update
		@procedure = Procedure.find(params[:id])
		values = params.require(:procedure).permit!
		@procedure.update values
		redirect_to procedure_path(@procedure), notice: 'Processo Atualizado!'
	end

	def finish_procedure
		@procedure = Procedure.find(params[:id])
		@procedure.update(status: true)
		redirect_to procedure_path(@procedure), notice: 'Processo finalizado!'
	end

	def reports
		@procedure = Procedure.find(params[:id])
		@procedure.update(tooth: params[:tooth], report: params[:report])
		redirect_to procedure_path(@procedure), notice: 'Atualizado!'
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

	def avatar
		@procedure = Procedure.find(params[:id])
		@procedure.avatar.attach(params[:procedure][:avatar])
		@procedure.resize_image
		redirect_to procedure_path(@procedure), notice: 'Imagem Adicionada!'
	end

	def photos
		@procedure = Procedure.find(params[:id])
		@procedure.photos.attach(params[:procedure][:photos])
		redirect_to procedure_path(@procedure), notice: 'Imagem Adicionada!'
	end

	def raysx
		@procedure = Procedure.find(params[:id])
		@procedure.raysx.attach(params[:procedure][:raysx])
		redirect_to procedure_path(@procedure), notice: 'Imagem Adicionada!'
	end

	def teleraysx
		@procedure = Procedure.find(params[:id])
		@procedure.teleraysx.attach(params[:procedure][:teleraysx])
		redirect_to procedure_path(@procedure), notice: 'Imagem Adicionada!'
	end

	def traceds
		@procedure = Procedure.find(params[:id])
		@procedure.traceds.attach(params[:procedure][:traceds])
		redirect_to procedure_path(@procedure), notice: 'Imagem Adicionada!'
	end

	def usps
		@procedure = Procedure.find(params[:id])
		@procedure.usps.attach(params[:procedure][:usps])
		redirect_to procedure_path(@procedure), notice: 'Imagem Adicionada!'
	end

	def purge_photos
		@procedure = Procedure.find(params[:id])
		@procedure.photos.find(params[:photos_id]).purge
		redirect_to procedure_path(@procedure), notice: 'Imagem Removida!'
	end

	def purge_raysx
		@procedure = Procedure.find(params[:id])
		@procedure.raysx.find(params[:raysx_id]).purge
		redirect_to procedure_path(@procedure), notice: 'Imagem Removida!'
	end

	def purge_teleraysx
		@procedure = Procedure.find(params[:id])
		@procedure.teleraysx.find(params[:teleraysx_id]).purge
		redirect_to procedure_path(@procedure), notice: 'Imagem Removida!'
	end

	def purge_traceds
		@procedure = Procedure.find(params[:id])
		@procedure.traceds.find(params[:traceds_id]).purge
		redirect_to procedure_path(@procedure), notice: 'Imagem Removida!'
	end

	def purge_usps
		@procedure = Procedure.find(params[:id])
		@procedure.usps.find(params[:usps_id]).purge
		redirect_to procedure_path(@procedure), notice: 'Imagem Removida!'
	end
end
