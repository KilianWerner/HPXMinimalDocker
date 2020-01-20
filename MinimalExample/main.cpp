#include <hpx/hpx.hpp>
#include <hpx/hpx_init.hpp>

#include <boost/algorithm/string.hpp>
#include <boost/align/aligned_alloc.hpp>
#include <boost/program_options.hpp>

#include <chrono>
#include <fstream>
#include <iomanip>
#include <queue>
#include <random>
#include <sstream>
#include <stdexcept>
#include <vector>

#include "Log.h"

std::ofstream Log::outfile;
hpx::lcos::local::mutex Log::outlock;

#include "MinComponent.h"

/**
 * @brief HPX main entry.
 * @param vm
 * @return
 */
int hpx_main(boost::program_options::variables_map& vm)
{
    // Print HPX info
    std::vector<hpx::id_type> localities = hpx::find_all_localities();
    int numThreads = hpx::get_os_thread_count();
    Log().tag("HPX") << "Localities: " << localities.size();
    Log().tag("HPX") << "Threads: " << numThreads;

    // Create minComponent on each locality
    std::vector<hpx::id_type> components;
    for (hpx::id_type locality : localities)
        components.push_back(hpx::new_<MinComponent>(locality).get());

    std::vector<hpx::future<void>> results;

    for (int i = 0; (i < 100); i++){
        results.push_back(hpx::async<MinComponent::send_action>(components[0], components[components.size()-1]));
        results.push_back(hpx::async<MinComponent::send_action>(components[components.size()-1], components[0]));
    }

    hpx::wait_all(results);

    return hpx::finalize();
}

/**
 * @brief Application entry point.
 * @param argc
 * @param argv
 * @return
 */
int main(int argc, char* argv[])
{
    // Command line description
    // ...

    boost::program_options::options_description allOptionDescriptions("hpxct [options] input");
    //    allOptionDescriptions.add(inputOutputOptionsDescription).add(parallelizationOptionsDescription).add(imageOptionsDescription).add(cameraOptionsDescription).add(debuggingOptionsDescription);

    // HPX config
    std::vector<std::string> const cfg = {
        //        "hpx.stacks.small_size=0x80000"
        "hpx.stacks.use_guard_pages=0"
    };

    // Run HPX
    return hpx::init(allOptionDescriptions, argc, argv, cfg);
}
