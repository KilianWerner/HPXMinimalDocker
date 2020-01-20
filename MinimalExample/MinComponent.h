#pragma once

class MinComponent;

#include <hpx/hpx.hpp>
#include <hpx/include/serialization.hpp>

#include <vector>

class MinComponent: public hpx::components::component_base<MinComponent> {

public:

    void receive(std::vector<std::uint64_t> toReceive);
    HPX_DEFINE_COMPONENT_ACTION(MinComponent, receive);

    void send(hpx::id_type target);
    HPX_DEFINE_COMPONENT_ACTION(MinComponent, send);

};

HPX_REGISTER_ACTION_DECLARATION(MinComponent::receive_action, treeConstructor_receive_action);
HPX_REGISTER_ACTION_DECLARATION(MinComponent::send_action, treeConstructor_send_action);
