#include <hpx/hpx.hpp>
#include <hpx/hpx_init.hpp>

#include <iostream>

int hpx_main()
{
    // Print HPX info
    try {
        std::vector<hpx::id_type> localities = hpx::find_all_localities();
        std::cout << "Localities: " << localities.size();
    } catch (const std::exception& e) {
        std::cout << "hpx::find_all_localities: " << e.what();
    }
    try {
        std::cout << "Threads: " << hpx::get_os_thread_count();
    } catch (const std::exception& e) {
        std::cout << "hpx::get_os_thread_count: " << e.what();
    }

    try {
        return hpx::finalize();
    } catch (const std::exception& e) {
        std::cout << "hpx::finalize: " << e.what();
    }

    return 1;
}


int main(int argc, char* argv[])
{
    // Run HPX
    try {
        return hpx::init(argc, argv);
    } catch (const std::exception& e) {
        std::cout << "hpx::init: " << e.what();
    }

    return 1;
}
