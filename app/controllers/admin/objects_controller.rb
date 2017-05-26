module Admin
  class ObjectsController < Admin::ApplicationController
    before_action :load_objects, only: %i[index search]
    before_action :load_object, only: %i[show edit update destroy]
    before_action :new_object, only: [:new]
    before_action :create_object, only: [:create]
    before_action :update_object, only: [:update]
    before_action :decorate_object, if: -> { @object.present? }

    helper_method :object_class, :search_field_name

    class_attribute :objects_on_page, :object_class

    # GET /admin/objects
    # GET /admin/objects.json
    def index
      respond_to do |format|
        format.html { render 'index' }
        format.json { render json: @objects }
      end
    end

    # GET /admin/objects/search
    # GET /admin/objects/search.json
    def search
      index
    end

    # GET /admin/objects/1
    # GET /admin/objects/1.json
    def show
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @object }
      end
    end

    # GET /admin/objects/new
    # GET /admin/objects/new.json
    def new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @object }
      end
    end

    # GET /admin/objects/1/edit
    def edit; end

    # POST /admin/objects
    # POST /admin/objects.json
    def create
      respond_to do |format|
        if @object.save
          format.html { redirect_to [:admin, @object], notice: t('admin.messages.object_created', model: object_title) }
          format.json { render json: @object, status: :created, location: @object }
        else
          format.html { render action: 'new' }
          format.json { render json: @object.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /admin/objects/1
    # PUT /admin/objects/1.json
    def update
      respond_to do |format|
        if @object.update(object_params)
          format.html { redirect_to [:admin, @object], notice: t('admin.messages.object_updated', model: object_title) }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @object.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/objects/1
    # DELETE /admin/objects/1.json
    def destroy
      @object.destroy
      respond_to do |format|
        format.html do
          redirect_to send(:"admin_#{object_to_text.pluralize}_url"),
                      alert: t('admin.messages.object_deleted', model: object_title)
        end
        format.js { head :no_content }
        format.json { head :no_content }
      end
    end

    private

    def object_params
      raise 'Object params is not set!'
    end

    def new_object
      @object = object_class.new
    end

    def object_to_text
      object_class.to_s.underscore
    end

    def object_title
      object_class.model_name.human.titleize
    end

    def create_object
      @object = object_class.new(object_params) do |object|
        fill_associations! object
      end
    end

    def update_object
      fill_associations! @object
    end

    def search_field_name
      ObjectsSearch.contains_param object_class
    end

    def load_objects
      @objects = object_class.latest
      @search = ObjectsSearch.new(@objects).find_contains(params[:q])
      @objects = (@search.try(:result) || @objects).page(params[:page]).per(objects_on_page)
    end

    def load_object
      @object = object_class.find(params[:id])
    end

    def fill_associations!(object)
      # noop here
    end

    def decorate_object
      # noop here
    end
  end
end
