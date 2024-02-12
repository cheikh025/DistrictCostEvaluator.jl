module DistrictCostEvaluator

    using CxxWrap
    # Define a function that returns the library path
    function get_libGenSC_path()
        script_dir = @__DIR__
        return joinpath(script_dir, "../deps/cpp/build/libCostEvaluator.so")
    end
    script_dir = @__DIR__
    @wrapmodule(joinpath(script_dir, "../deps/cpp/build/libCostEvaluator.so"))
    
    function __init__()
        @initcxx
    end
    
    # Define a Julia function that calls the C++ function
    function evaluate_cost(districts, instance_name)
        return DistrictCostEvaluator.EVmain(districts, instance_name)
    end

    export evaluate_cost
end
