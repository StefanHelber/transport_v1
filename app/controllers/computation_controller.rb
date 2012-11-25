class ComputationsController < ApplicationController
  before_filter :signed_in_user

  def optimize


    if File.exist?("Transportmodell_v3_Input_Instanz1.inc")
      File.delete("Transportmodell_v3_Input_Instanz1.inc")
    end
    f=File.new("Transportmodell_v3_Input_Instanz1.inc", "w")
    printf(f, "set i / \n")
    @sources = Source.find(:all)
    @sources.each { |so| printf(f, "i" + so.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "j / \n")
    @sinks = Sink.find(:all)
    @sinks.each { |si| printf(f, "j" + si.id.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "l / \n")
    @transport_links = TransportLink.find(:all)
    @transport_links.each { |li| printf(f, "l" + li.id.to_s + "\n") }
    printf(f, "/;" + "\n\n")


    printf(f, "LI(l,i) = no;\n")
    printf(f, "LJ(l,j) = no;\n\n")

    @transport_links.each do |li|
      printf(f, "LI( 'l" + li.id.to_s + "', 'i" + li.source_id.to_s + "') = yes;\n")
      printf(f, "LJ( 'l" + li.id.to_s + "', 'j" + li.sink_id.to_s + "') = yes;\n\n")
    end
    printf(f, "\n\n")

    printf(f, "Parameter\n  A(i) /\n")

    @sources.each { |so| printf(f, "i" + so.id.to_s + "  " + so.supply_quantity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nN(j) /\n")

    @sinks.each { |si| printf(f, "j" + si.id.to_s + "  " + si.demand_quantity.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "\nc(l) /\n")

    @transport_links.each { |li| printf(f, "l" + li.id.to_s + "  " + li.unit_cost.to_s + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, ";\n")
    f.close


    if File.exist?("Transportmengen_v2.txt")
      File.delete("Transportmengen_v2.txt")
    end

    system "C:\\Programme\\Gams23.7\\gams Transportmodell_v2"

    @transport_links = TransportLink.find(:all)
    render :template => "transport_links/index"




  end
end


private

def signed_in_user
  unless signed_in?
    store_location
    redirect_to signin_path, notice: "Please sign in."
  end
end