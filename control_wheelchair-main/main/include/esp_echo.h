#ifndef ESP_ECHO_H
#define ESP_ECHO_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdbool.h>
int flag;

int get_speedRight();
int get_speedLeft();


void rosserial_setup();

void rosserial_spinonce();


int get_flag();
 
void set_flag(int input);


#ifdef __cplusplus
}
#endif

#endif /* ESP_ECHO_H */
