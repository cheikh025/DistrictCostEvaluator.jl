using CxxWrap
prefix_path = CxxWrap.prefix_path()
project_dir = @__DIR__ 
cpp_dir = joinpath(project_dir, "cpp")
build_dir = joinpath(cpp_dir, "build")

# Define a function to run the build script
function run_build_script()
    # Create the build directory if it doesn't exist
    isdir(build_dir) || mkdir(build_dir)

    # Change the current working directory to the build directory
    cd(build_dir) do
        # Run cmake and make commands within the build directory
        run(`cmake -DCMAKE_PREFIX_PATH=$prefix_path $cpp_dir`)
        run(`make`)
    end
end
lkh_dir = joinpath(project_dir, "lkh")
lkh_build_dir = joinpath(lkh_dir, "build")
function run_build_lkh()
    # Create the build directory if it doesn't exist
    isdir(lkh_build_dir) || mkdir(lkh_build_dir)

    # Change the current working directory to the build directory
    cd(lkh_build_dir) do
        # Run cmake and make commands within the build directory
        run(`cmake -DCMAKE_PREFIX_PATH=$prefix_path $lkh_dir`)
        run(`make`)
    end
end

# Only run the build script if the library has not been built yet
if !isfile(joinpath(build_dir, "libCostEvaluator.so"))
    run_build_script()
end

if !isfile(joinpath(lkh_build_dir, "lkh"))
    run_build_lkh()
end