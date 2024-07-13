# Type definitions for the GPX schema
# https://www.topografix.com/GPX/1/1/

using AcuteML
using GeoInterface
using Dates




@aml mutable struct Link "linkType"
    href::String, "~"
    text::Union{String, Nothing}, "~"
    type::Union{String, Nothing}, "~"
end

@aml mutable struct Person "personType"
    name::Union{String, Nothing}, "~"
    email::Union{String, Nothing}, "~"
    link::Union{Link, Nothing}, "~"
end

@aml mutable struct Bounds "boundsType"
    minlat::Number, "~"
    minlon::Number, "~"
    maxlat::Number, "~"
    maxlon::Number, "~"
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

@aml mutable struct TrackSegment "trksegType"
    points::Vector{WayPoint}
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






@aml mutable struct Gpx "gpxType"
    version::String, "~"
    creator::String, "~"
    metadata::Union{Metadata, Nothing}, "~"
    waypoints::Vector{WayPoint}
    routes::Vector{Route}
    tracks::Vector{Track}
    extensions::Union{String, Nothing}, "~"
end

# Constraints for WayPoint
latCheck(lat) = lat >= -90 && lat <= 90
lonCheck(lon) = lon >= -180 && lon <= 180
magvarCheck(magvar) = magvar >= 0 && magvar <= 360
geoidheightCheck(geoidheight) = geoidheight >= 0
fixCheck(fix) = fix in ["none", "2d", "3d", "dgps", "pps"]
satCheck(sat) = sat >= 0 
hdopCheck(hdop) = hdop >= 0
vdopCheck(vdop) = vdop >= 0
pdopCheck(pdop) = pdop >= 0
ageofdgpsdataCheck(ageofdgpsdata) = ageofdgpsdata >= 0
dgpsidCheck(dgpsid) = dgpsid >= 0 && dgpsid <= 1023

# Constraints for TrackType


# Constraints for RouteType
numberCheck(number) = number >= 0

# Constraints for linkType
pattern_url = r"https?://(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)"
pattern_mime = r"^[a-zA-Z0-9]+/[a-zA-Z0-9\-\+\.]+(;[a-zA-Z0-9\-\+\.]+=[a-zA-Z0-9\-\+\.]+)*$"
hrefCheck(href) = pattern_url.match(href) 
mimeCheck(mime) = pattern_mime.match(mime)

# Constraints for boundsType
minlatCheck(minlat) = latCheck(minlat)
minlonCheck(minlon) = lonCheck(minlon)
maxlatCheck(maxlat) = latCheck(maxlat)
maxlonCheck(maxlon) = lonCheck(maxlon)