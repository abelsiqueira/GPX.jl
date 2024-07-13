using GPX
using Test

@testset "GPX.jl" begin
  @test GPX.hello_world() == "Hello, World!"
end
