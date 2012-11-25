class TranslinksController < ApplicationController
  # GET /translinks
  # GET /translinks.json
  def index
    @translinks = Translink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @translinks }
    end
  end

  # GET /translinks/1
  # GET /translinks/1.json
  def show
    @translink = Translink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @translink }
    end
  end

  # GET /translinks/new
  # GET /translinks/new.json
  def new
    @translink = Translink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @translink }
    end
  end

  # GET /translinks/1/edit
  def edit
    @translink = Translink.find(params[:id])
  end

  # POST /translinks
  # POST /translinks.json
  def create
    @translink = Translink.new(params[:translink])

    respond_to do |format|
      if @translink.save
        format.html { redirect_to @translink, notice: 'Translink was successfully created.' }
        format.json { render json: @translink, status: :created, location: @translink }
      else
        format.html { render action: "new" }
        format.json { render json: @translink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /translinks/1
  # PUT /translinks/1.json
  def update
    @translink = Translink.find(params[:id])

    respond_to do |format|
      if @translink.update_attributes(params[:translink])
        format.html { redirect_to @translink, notice: 'Translink was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @translink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translinks/1
  # DELETE /translinks/1.json
  def destroy
    @translink = Translink.find(params[:id])
    @translink.destroy

    respond_to do |format|
      format.html { redirect_to translinks_url }
      format.json { head :no_content }
    end
  end


  def optimize

    if File.exist?("Transportmodell_v3_Input_Instanz1.inc")
      File.delete("Transportmodell_v3_Input_Instanz1.inc")
    end
    f=File.new("Transportmodell_v3_Input_Instanz1.inc", "w")
    printf(f, "set i / \n")
    @supplysites = Supplysite.all
    @supplysites.each { |ssi| printf(f, "i" + ssi.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "j / \n")
    @demandsites = Demandsite.all
    @demandsites.each { |dsi| printf(f, "j" + dsi.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "l / \n")
    @translinks = Translink.all
    @translinks.each { |li| printf(f, "l" + li.id.to_s + "\n") }
    printf(f, "/;" + "\n\n")


    printf(f, "LI(l,i) = no;\n")
    printf(f, "LJ(l,j) = no;\n\n")

    @translinks.each do |li|
      printf(f, "LI( 'l" + li.id.to_s + "', 'i" + li.source_id.to_s + "') = yes;\n")
      printf(f, "LJ( 'l" + li.id.to_s + "', 'j" + li.sink_id.to_s + "') = yes;\n\n")
    end
    printf(f, "\n\n")

    printf(f, "Parameter\n  A(i) /\n")

    @supplysites.each { |so| printf(f, "i" + so.id.to_s + "  " + so.supply_quantity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nN(j) /\n")

    @demandsites.each { |si| printf(f, "j" + si.id.to_s + "  " + si.demand_quantity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nc(l) /\n")

    @translinks.each { |li| printf(f, "l" + li.id.to_s + "  " + li.unit_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, ";\n")
    f.close


    if File.exist?("Transportmengen_v2.txt")
      File.delete("Transportmengen_v2.txt")
    end

    system "C:\\Programme\\Gams23.7\\gams Transportmodell_v2"

    @translinks = TransportLink.all
    render :template => "transport_links/index"


  end


  def read_transportation_quantities

    fi=File.open("Transportmengen_v2.txt", "r")
    fi.each { |line| # printf(f,line)
      sa=line.split(";")
      sa0=sa[0].delete "l "
      sa3=sa[3].delete " \n"
      al=TransportLink.find_by_id(sa0)
      al.transport_quantity=sa3
      al.save

    }

    fi.close


    @transport_links = TransportLink.find(:all)
    render :template => "transport_links/index"


  end

  def delete_production_quantities
    @transport_links = TransportLink.find(:all)
    @transport_links.each { |li|
      li.transport_quantity=0.0
      li.save
    }

    @objective_function_value=nil

    render :template => "transport_links/index"

  end

  def read_and_show_ofv

    if File.exist?("Zielfunktionswert_v2.txt")
      fi=File.open("Zielfunktionswert_v2.txt", "r")
      line=fi.readline
      fi.close
      sa=line.split(" ")
      @objective_function_value=sa[1]
    else
      @objective_function_value=nil
    end

    @transport_links = TransportLink.find(:all)
    render :template => "transport_links/index"
  end

end
