// kuberlog's onix bot @ TreeCybernetics.com
#include <iostream>
#include <stdio.h>
#include <string>
#include <vector>
#include <functional>
#include <thread>
#include <sstream>


using namespace std;

void clear_screen() {
  system("clear");
}

void start_simulation() {
  system("python3 Simulation.py");
}

void openscad(string filename) {
  stringstream ss;
  ss << "openscad " << filename;
  system(ss.str().c_str());
}

class Menu_Option {
  string _title;
  /*the*/ function<void(string)> _to_run;
public:


  string title()
  { return _title;}


  std::thread* run()
  {
    thread* rv =  new std::thread(self());
    return rv;
  }

  Menu_Option& running(function<void(string)> to_run)
  {
    _to_run = to_run;
    return *this;
  }

  Menu_Option self() {return *this;}

  void operator()()
  {
    _to_run(title());
  }




  static Menu_Option titled(string title)
  {
    Menu_Option rv;
    rv._title = title;
    return rv;
  }
};



void menu()
{
  int choice = 0;
  vector<thread *> threads;
  while (choice > -1)
    {
    vector<Menu_Option> menu_options;

    menu_options.push_back(
                           Menu_Option::titled("openscad onix_bot.scad")
                           .running([](string title) { cout << title << endl;
                               openscad("onix_bot.scad");
                           }));

    menu_options.push_back(
        Menu_Option::titled("run simulation").running([](string title) {
          cout << title << endl;
          start_simulation();
        }));

    cout << "Onix Bot Menu" << endl;
    for (int i = 0; i < menu_options.size(); i++) {
      cout << i << ") " << menu_options[i].title() << endl;
    }

    choice = -2;

    cin >> choice;
    if (choice >= 0) {
      if (choice < menu_options.size()) {
        thread* t = menu_options[choice].run();
        t->detach();
        threads.push_back(t);
      }
    }
  }
  for(auto thread: threads) {
    delete thread;
  }
}

int main()
{

  clear_screen();
  cout << "Welcome to the onix stream\n";
  menu();
}
