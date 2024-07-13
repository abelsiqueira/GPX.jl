module GPX
import EzXML
include("types.jl")

function parse_waypoint(node::EzXML.Node)::WayPoint
    WayPoint(
        lat = parse(Float64, node.attributes["lat"]),
        lon = parse(Float64, node.attributes["lon"]),   
    )
end


function parse_gpx(path_to_xml::String)
    xml = EzXML.readxml(path_to_xml)

    root_node = EzXML.root(xml)
    if root_node.name != "gpx"
        throw(ArgumentError("Root element must be <gpx>"))
    end
    # waypoints = []

    for waypoint in nodecontent.(findall("/wpt", root_node))
        println(waypoint)
    end

    
        # if hasproperty(element, s::String) s == "wpt"
        #     waypoint = parse_waypoint(element)
        #     println(waypoint)
        # end
    
end

end