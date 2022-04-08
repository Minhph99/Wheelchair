#include "ros.h"
#include "std_msgs/String.h"
#include "esp_echo.h"
#include "esp_log.h"
#include <stdbool.h>
#include <sstream>
// ros library for geometry
#include "geometry_msgs/Twist.h"
int scale = 100;
float speed_wish_right = 0;
float speed_wish_left = 0;

ros::NodeHandle nh;

std_msgs::String str_msg1,str_msg2;


//ros::Publisher ack("ack", &str_msg);
ros::Publisher ack1("ack1", &str_msg1);
ros::Publisher ack2("ack2", &str_msg2);
// A callback function.  Executed each time a new pose
// message arrives.
static const char *ROS_TASK_TAG = "ROS_TASK";
void teleopMessageReceived(const geometry_msgs::Twist &msg)
{
  
  const float wheel_dist = 0.58;

  // Receive a message velocity
  // and calculate angle
  double angular = msg.angular.z; // rad/s
  double linear = msg.linear.x * 10;   // m/s

  speed_wish_right = ((angular * wheel_dist) / 2 + linear);
  speed_wish_left = (linear * 2 - speed_wish_right);

  std::stringstream ss1, ss2;
  ss1 <<">SpR: " << int(speed_wish_right*100);
  str_msg1.data = (ss1.str()).c_str();

  ss2 <<">SpL: " << int(speed_wish_left*100);
  str_msg2.data = (ss2.str()).c_str();

  ack1.publish(&str_msg1);
  ack2.publish(&str_msg2);

  //count++;
  //flag = 1;
  //ESP_LOGI(ROS_TASK_TAG, "Velocity  angula_z= %f , linear_x = %f", angular, linear);
  //printf("Velocity  speed_left= %f , speed_right = %f \n",speed_wish_left * 100, speed_wish_right*100);
}

int get_speedRight()
{
  const int speed = int(speed_wish_right *scale);
  return speed;
}

int get_speedLeft()
{
  const int speed = int(speed_wish_left * scale);
  return speed;
}

int get_flag()
{
  return flag;
}
void set_flag(int input)
{
  flag = input;
}

//void messageCb(const std_msgs::String &msg)
//{
//  ack.publish(&msg);
//}

//ros::Subscriber<std_msgs::String> echo("echo", &messageCb);
ros::Subscriber<geometry_msgs::Twist> subGeometry("cmd_vel", &teleopMessageReceived);
void rosserial_setup()
{


  // Initialize ROS
  nh.initNode();

  // Create subcriber object
  //nh.subscribe(echo);
  nh.subscribe(subGeometry);
  nh.advertise(ack1);
  nh.advertise(ack2);
  vTaskDelay(500);
}

void rosserial_spinonce()
{
  nh.spinOnce();

  while (!nh.connected())
  {
    nh.initNode();
    vTaskDelay(2000 / portTICK_PERIOD_MS);
  }
}