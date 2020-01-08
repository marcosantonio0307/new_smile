class ProceduresController < ApplicationController
	before_action :authenticate_user!, only:[:index, :create, :reports, :avatar, :image, :purge_image,]
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
		redirect_to procedure_path(@procedure), notice: 'Imagem Adicionada!'
	end

	def image
		@procedure = Procedure.find(params[:id])
		image_category = params[:procedure][:category]
		if image_category == 'photos'
			@procedure.photos.attach(params[:procedure][:image])
		elsif image_category == 'raysx'
			@procedure.raysx.attach(params[:procedure][:image])
		elsif image_category == 'teleraysx'
			@procedure.teleraysx.attach(params[:procedure][:image])
		elsif image_category == 'traceds'
			@procedure.traceds.attach(params[:procedure][:image])
		elsif image_category == 'usps'
			@procedure.usps.attach(params[:procedure][:image])
		end	
		
		redirect_to procedure_path(@procedure), notice: 'Imagem Adicionada!'
	end

	def purge_image
		@procedure = Procedure.find(params[:id])
		image_category = params[:category]
		if image_category == 'photos'
			@procedure.photos.find(params[:image_id]).purge
		elsif image_category == 'raysx'
			@procedure.raysx.find(params[:image_id]).purge
		elsif image_category == 'teleraysx'
			@procedure.teleraysx.find(params[:image_id]).purge
		elsif image_category == 'traceds'
			@procedure.traceds.find(params[:image_id]).purge
		elsif image_category == 'usps'
			@procedure.usps.find(params[:image_id]).purge
		end

		redirect_to procedure_path(@procedure), notice: 'Imagem Removida!'
	end
end
