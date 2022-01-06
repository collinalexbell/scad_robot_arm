#include <vector>

using namespace std;

class Drive_Train
{
  int output_pin_num;
public:
  void forward(float deg_per_sec, float total_wheel_rotation_in_deg) {
  }
  void backward(float deg_per_sec, float total_whell_rotation_in_deg) {
  }
};

class Car_Base
{
  vector<Drive_Train> drive_trains;
public:
  Car_Base() {
    drive_trains.push_back(Drive_Train());
    drive_trains.push_back(Drive_Train());
    drive_trains.push_back(Drive_Train());
    drive_trains.push_back(Drive_Train());
  }
  void forward(float deg_per_sec, float total_wheel_rotation_in_deg) {
    for (auto drive_train : drive_trains) {
      drive_train.forward(0.5, 360);
    }
  }
  void backward(float deg_per_sec, float total_wheel_rotation_in_deg) {
    for (auto drive_train : drive_trains) {
      drive_train.backward(0.5, 360);
    }
  }
  void spin(float deg_per_sec, float total_wheel_rotation_in_deg) {
    if(deg_per_sec > 0) {
      for (auto drive_train : left_drive_trains()) {
        drive_train.backward(deg_per_sec, total_wheel_rotation_in_deg);
      }
      for (auto drive_train : right_drive_trains()) {
        drive_train.forward(deg_per_sec, total_wheel_rotation_in_deg);
      }
    }
  }

  vector<Drive_Train> left_drive_trains() {
    return vector<Drive_Train> {drive_trains[0], drive_trains[1]};
  }
  vector<Drive_Train> right_drive_trains() {
    return vector<Drive_Train>{drive_trains[2], drive_trains[3]};
  }
  vector<Drive_Train> front_drive_trains() {
    return vector<Drive_Train>{drive_trains[0], drive_trains[2]};
  }
  vector<Drive_Train> back_drive_trains() {
    return vector<Drive_Train>{drive_trains[1], drive_trains[3]};
  }
};
