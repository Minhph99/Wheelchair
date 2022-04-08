#pragma once
#ifndef MCPWM_MOTOR_H
#define MCPWM_MOTOR_H

#ifdef __cplusplus
extern "C" {
#endif
// mcpwm library
#include "driver/mcpwm.h"
#include "soc/mcpwm_periph.h"


void mcpwm_example_gpio_initialize(int GPIO_PWM0A_OUT,int GPIO_PWM0B_OUT);
void brushed_motorA(mcpwm_unit_t mcpwm_num, mcpwm_timer_t timer_num, float duty_cycle);
void brushed_motorB(mcpwm_unit_t mcpwm_num, mcpwm_timer_t timer_num, float duty_cycle);
void brushed_motor_stop(mcpwm_unit_t mcpwm_num, mcpwm_timer_t timer_num);


#ifdef __cplusplus
}
#endif

#endif /* MCPWM_MOTOR_H */