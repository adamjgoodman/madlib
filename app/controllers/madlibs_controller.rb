class MadlibsController < ApplicationController
  def index
    @madlibs = Madlib.all
  end

  def new
    @madlib = Madlib.new
  end

  def create
    madlib = Madlib.create(madlib_params)
    if madlib.save
      fields = params[:madlib][:text].scan(/[^{}]+(?=})/)
      hash = Hash.new
      fields.each do |field|
        fields.count(field).times do |index|
          hash["#{field} (#{index + 1})"] = ''
        end
      end
      puts hash
      madlib.update!(fields: hash)
    end
    redirect_to edit_madlib_path(madlib)
  end

  def show
    @madlib = Madlib.find(params[:id])
  end

  def generate
    madlib = Madlib.find(params[:madlib_id])
    params[:fields].each do |key, value|
      madlib.text.sub!("{#{key.split(' (').first}}", value)
    end
    @results = madlib.text
  end

  def edit
    @madlib = Madlib.find(params[:id])
  end

  def update
    madlib = Madlib.find(params[:id])
    madlib.update(madlib_params)
  end

  private

  def madlib_params
    params.require(:madlib).permit(:text, fields: {})
  end


end
