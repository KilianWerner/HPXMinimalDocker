#include <hpx/hpx.hpp>
#include <hpx/hpx_init.hpp>

#include <iostream>

int hpx_main()
{
    // Print HPX info
    std::vector<hpx::id_type> localities = hpx::find_all_localities();
    std::cout << "Localities: " << localities.size();
    std::cout << "Threads: " << hpx::get_os_thread_count();

    return hpx::finalize();
}


int main(int argc, char* argv[])
{
    // Run HPX
    return hpx::init(argc, argv);
}
