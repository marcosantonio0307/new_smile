class ProceduresController < ApplicationController
	before_action :authenticate_user!, only:[:index, :create, :update, :reports, :avatar, :photos, :raysx, :teleraysx, :traceds, :usps, :purge_photos, :purge_raysx, :purge_teleraysx, :purge_traceds, :purge_usps]

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

	def edit
		@procedure = Procedure.find(params[:id])
	end

	def update
		@procedure = Procedure.find(params[:id])
		values = params.require(:procedure).permit!
		@procedure.update values
		redirect_to procedure_path(@procedure), notice: 'Processo Atualizado!'
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
		@procedure.avatar.attach(params[:avatar])
		redirect_to procedure_path(@procedure), notice: 'Imagem Adicionada!'
	end

	def photos
		@procedure = Procedure.find(params[:id])
		@procedure.photos.attach(params[:photos])
		redirect_to procedure_path(@procedure), notice: 'Imagem Adicionada!'
	end

	def raysx
		@procedure = Procedure.find(params[:id])
		@procedure.raysx.attach(params[:raysx])
		redirect_to procedure_path(@procedure), notice: 'Imagem Adicionada!'
	end

	def teleraysx
		@procedure = Procedure.find(params[:id])
		@procedure.teleraysx.attach(params[:teleraysx])
		redirect_to procedure_path(@procedure), notice: 'Imagem Adicionada!'
	end

	def traceds
		@procedure = Procedure.find(params[:id])
		@procedure.traceds.attach(params[:traceds])
		redirect_to procedure_path(@procedure), notice: 'Imagem Adicionada!'
	end

	def usps
		@procedure = Procedure.find(params[:id])
		@procedure.usps.attach(params[:usps])
		redirect_to procedure_path(@procedure), notice: 'Imagem Adicionada!'
	end

	def purge_photos
		@procedure = Procedure.find(params[:id])
		@procedure.photos.destroy params[:photos_id]
		redirect_to procedure_path(@procedure), notice: 'Imagem Removida!'
	end

	def purge_raysx
		@procedure = Procedure.find(params[:id])
		@procedure.raysx.destroy params[:raysx_id]
		redirect_to procedure_path(@procedure), notice: 'Imagem Removida!'
	end

	def purge_teleraysx
		@procedure = Procedure.find(params[:id])
		@procedure.teleraysx.destroy params[:teleraysx_id]
		redirect_to procedure_path(@procedure), notice: 'Imagem Removida!'
	end

	def purge_traceds
		@procedure = Procedure.find(params[:id])
		@procedure.traceds.destroy params[:traceds_id]
		redirect_to procedure_path(@procedure), notice: 'Imagem Removida!'
	end

	def purge_usps
		@procedure = Procedure.find(params[:id])
		@procedure.usps.destroy params[:usps_id]
		redirect_to procedure_path(@procedure), notice: 'Imagem Removida!'
	end
end
