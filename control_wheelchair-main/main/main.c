#include "stdio.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_wifi.h"
#include "esp_system.h"
#include "nvs_flash.h"
#include "esp_event.h"
#include "esp_netif.h"

// ros library
#include "esp_echo.h"

// mcpwm library

#include "mcpwm_motor.h"
#include "driver/mcpwm.h"
#include "soc/mcpwm_periph.h"

//********
int duty_motorA = 0;
int duty_motorB = 0;
int flag_driver = 0;

// defined pin connect to driver moter
#define L298n 1 // test code with l298n driver
#if L298n
#define GPIO_PWM0A_OUT 13
#define GPIO_PWM0B_OUT 25
#define dirMotorA1 12
#define dirMotorA2 14
#define dirMotorB1 27
#define dirMotorB2 26
#else
#define GPIO_PWM0A_OUT 12
#define GPIO_PWM0B_OUT 19
#define dirMotorA 14
#define dirMotorB 18
#endif

void init_mcpwm(void)
{
  // 1. mcpwm gpio initialization
  mcpwm_example_gpio_initialize(GPIO_PWM0A_OUT, GPIO_PWM0B_OUT);

  // 2. initial mcpwm configuration
  printf("Configuring Initial Parameters of mcpwm...\n");
  mcpwm_config_t pwm_config;
  pwm_config.frequency = 1000; // frequency = 500Hz,
  pwm_config.cmpr_a = 0;       // duty cycle of PWMxA = 0
  pwm_config.cmpr_b = 0;       // duty cycle of PWMxb = 0
  pwm_config.counter_mode = MCPWM_UP_COUNTER;
  pwm_config.duty_mode = MCPWM_DUTY_MODE_0;
  mcpwm_init(MCPWM_UNIT_0, MCPWM_TIMER_0, &pwm_config); // Configure PWM0A & PWM0B with above settings
// mcpwm_init(MCPWM_UNIT_0, MCPWM_TIMER_1, &pwm_config);
#if L298n
  gpio_reset_pin(dirMotorA1);
  gpio_reset_pin(dirMotorA2);
  gpio_reset_pin(dirMotorB1);
  gpio_reset_pin(dirMotorB2);
  gpio_set_direction(dirMotorA1, GPIO_MODE_OUTPUT);
  gpio_set_direction(dirMotorA2, GPIO_MODE_OUTPUT);

  gpio_set_direction(dirMotorB1, GPIO_MODE_OUTPUT);
  gpio_set_direction(dirMotorB2, GPIO_MODE_OUTPUT);
#else
  gpio_reset_pin(dirMotor1);
  gpio_reset_pin(dirMotorB);
  gpio_set_direction(dirMotorA, GPIO_MODE_OUTPUT);
  gpio_set_direction(dirMotorB, GPIO_MODE_OUTPUT);
#endif
}
static void mcpwm_brushed_motor_control(void *arg)
{

  while (1)
  {
    
    //  printf(" speed_left= %d , speed_right = %d \n", duty_motorA, duty_motorB);
    if(abs(duty_motorA) > 90) duty_motorA = 90;
    if(abs(duty_motorB)>90) duty_motorB =90;
    if (duty_motorA > 0 && duty_motorB > 0)
    {
      gpio_set_level(dirMotorA1, 1);
      gpio_set_level(dirMotorA2, 0);
      gpio_set_level(dirMotorB1, 1);
      gpio_set_level(dirMotorB2, 0);
      brushed_motorA(MCPWM_UNIT_0, MCPWM_TIMER_0, abs(duty_motorA));
      brushed_motorB(MCPWM_UNIT_0, MCPWM_TIMER_0, abs(duty_motorB));
    }
    else if (duty_motorA <= 0 && duty_motorB > 0) // turn right
    {
      gpio_set_level(dirMotorA1, 1);
      gpio_set_level(dirMotorA2, 0);
      gpio_set_level(dirMotorB1, 1);
      gpio_set_level(dirMotorB2, 0);
      brushed_motorA(MCPWM_UNIT_0, MCPWM_TIMER_0, 0);
      brushed_motorB(MCPWM_UNIT_0, MCPWM_TIMER_0, abs(duty_motorB));
    }
    else if (duty_motorA > 0 && duty_motorB <= 0) // turn left
    {
      gpio_set_level(dirMotorA1, 1);
      gpio_set_level(dirMotorA2, 0);
      gpio_set_level(dirMotorB1, 1);
      gpio_set_level(dirMotorB2, 0);
      brushed_motorA(MCPWM_UNIT_0, MCPWM_TIMER_0, abs(duty_motorA));
      brushed_motorB(MCPWM_UNIT_0, MCPWM_TIMER_0, 0);
    }
    else if(duty_motorA < 0 && duty_motorB <0)
    {
      gpio_set_level(dirMotorA1, 0);
      gpio_set_level(dirMotorA2, 1);
      gpio_set_level(dirMotorB1, 0);
      gpio_set_level(dirMotorB2, 1);
      brushed_motorA(MCPWM_UNIT_0, MCPWM_TIMER_0, abs(duty_motorA));
      brushed_motorB(MCPWM_UNIT_0, MCPWM_TIMER_0, abs(duty_motorB));
    }
    else
    {
      brushed_motor_stop(MCPWM_UNIT_0, MCPWM_TIMER_0);
      duty_motorA = 0;
      duty_motorB = 0;
    }

    vTaskDelay(30 / portTICK_RATE_MS);
  }
}

// Create task for node pub_sub
static void rosserial_tcp(void *arg)
{
  while (1)
  {
    // rosserial_publish();
    rosserial_spinonce();
    duty_motorA = get_speedRight();
    duty_motorB = get_speedLeft();
    flag_driver = get_flag();



    vTaskDelay(15 / portTICK_RATE_MS);
  }
}

void app_main(void)
{
  init_mcpwm();
  rosserial_setup();

  xTaskCreate(rosserial_tcp, "rosserial_tcp", 4096, NULL, 1, NULL);
  xTaskCreate(mcpwm_brushed_motor_control, "mcpwm_brushed_motor_control", 4096, NULL, 2, NULL);
  // xTaskCreate(change_flag, "change_flag", 4096, NULL, 5, NULL);
}
