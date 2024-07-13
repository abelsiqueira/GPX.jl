using AcuteML
using GeoInterface

@aml mutable struct Gpx "gpxType"
    version::String, "~"
    creator::String, "~"
    metadata::Union{Metadata, Nothing}, "~"
    waypoints::Vector{WayPoint}
    routes::Vector{Route}
    tracks::Vector{Track}
    extensions::Union{String, Nothing}, "~"
end

@aml mutable struct Person "personType"
    name::Union{String, Nothing}, "~"
    email::Union{String, Nothing}, "~"
    link::Union{Link, Nothing}, "~"
end

@aml mutable struct Link "linkType"
    href::String, "~"
    text::Union{String, Nothing}, "~"
    type::Union{String, Nothing}, "~"
end

@aml mutable struct Metadata "metadataType"
    name::Union{String, Nothing}, "~"
    desc::Union{String, Nothing}, "~"
    author::Union{Person, Nothing}, "~"
    copyright::Union{String, Nothing}, "~"
    link::Union{Link, Nothing}, "~"
    time::Union{DateTime, Nothing}, "~"
    keywords::Union{String, Nothing}, "~"
    bounds::Union{Bounds, Nothing}, "~"
    extensions::Union{String, Nothing}, "~"
end

@aml mutable struct Track "trkType"
    name::Union{String, Nothing}, "~"
    cmt::Union{String, Nothing}, "~"
    desc::Union{String, Nothing}, "~"
    src::Union{String, Nothing}, "~"
    link::Union{String, Nothing}, "~"
    number::Union{Number, Nothing}, "~"
    type::Union{String, Nothing}, "~"
    extensions::Union{String, Nothing}, "~"
    segments::Vector{TrackSegment}
end

@aml mutable struct TrackSegment "trksegType"
    points::Vector{WayPoint}
    extensions::Union{String, Nothing}, "~"
end

@aml mutable struct Route "rteType"
    name::Union{String, Nothing}, "~"
    cmt::Union{String, Nothing}, "~"
    desc::Union{String, Nothing}, "~"
    src::Union{String, Nothing}, "~"
    link::Union{String, Nothing}, "~"
    number::Union{Number, Nothing}, "~"
    type::Union{String, Nothing}, "~"
    extensions::Union{String, Nothing}, "~"
    waypoints::Vector{WayPoint}
end



@aml mutable struct WayPoint  "wptType"
    lat::Number, "~"
    lon::Number, "~"
    ele::Union{Number, Nothing}, "~"
    time::Union{DateTime, Nothing}, "~"
    magvar::Union{Number, Nothing}, "~"
    geoidheight::Union{Number, Nothing}, "~"
    name::Union{String, Nothing}, "~"
    cmt::Union{String, Nothing}, "~"
    desc::Union{String, Nothing}, "~"
    src::Union{String, Nothing}, "~"
    link::Union{String, Nothing}, "~"
    sym::Union{String, Nothing}, "~"
    type::Union{String, Nothing}, "~"
    fix::Union{String, Nothing}, "~"
    sat::Union{Number, Nothing}, "~"
    hdop::Union{Number, Nothing}, "~"
    vdop::Union{Number, Nothing}, "~"
    pdop::Union{Number, Nothing}, "~"
    ageofdgpsdata::Union{Number, Nothing}, "~"
    dgpsid::Union{Number, Nothing}, "~"
    extensions::Union{String, Nothing}, "~"
end
