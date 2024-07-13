module GPX
import EzXML
include("types.jl")

function parse_gpx(path_to_xml::String)
    xml = EzXML.readxml(path_to_xml)

    root_node = EzXML.root(xml)
    if root_node.name != "gpx"
        throw(ArgumentError("Root element must be <gpx>"))
    end
    return root["version"]

end
