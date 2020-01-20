#include "MinComponent.h"
#include "Log.h"
#include <random>

HPX_REGISTER_COMPONENT_MODULE();

typedef hpx::components::simple_component<MinComponent> TreeConstructorComponent;

HPX_REGISTER_COMPONENT(TreeConstructorComponent, MinComponent);
HPX_REGISTER_ACTION(TreeConstructorComponent::wrapped_type::receive_action, treeConstructor_receive_action);
HPX_REGISTER_ACTION(TreeConstructorComponent::wrapped_type::send_action, treeConstructor_send_action);

void MinComponent::receive(std::vector<std::uint64_t> toReceive){
    hpx::id_type tmp = hpx::find_here();
    Log().tag(std::to_string(*(reinterpret_cast<int*>(&tmp)))) << " receiving " << toReceive.size() << " elements.";
}

void MinComponent::send(hpx::id_type target){
    {
        std::vector<std::uint64_t> toSend;
        toSend.push_back(rand());
        toSend.push_back(rand());
        hpx::async<MinComponent::receive_action>(target, toSend);
    }
    int i = 0;
    for (; (i < 17); i++){
        if (i + (rand() % 5) < 10){
            continue;
        }
        return;
    }
}

