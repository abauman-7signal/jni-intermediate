#include <jni.h>
#include <iostream>
#include <unistd.h>
#include <sys/time.h>
#include <vector>
#include "HelloWorld.h"
using namespace std;

double getTimestampInSecs(struct timeval& tv) {
    return tv.tv_sec + (tv.tv_usec / 1000000.0);
}

double getCurrentTimestamp() {
  struct timeval time_info;

  gettimeofday(&time_info, 0);
  return getTimestampInSecs(time_info);
}

JNIEXPORT void JNICALL
Java_com_sevensignal_helloworld_HelloWorld_print(JNIEnv *, jobject){
    std::vector<double> sleepTimes;
    double afterSleepTimestamp;
    double startTimestamp = getCurrentTimestamp();
    double beginSleepTimestamp;

    cout << "Starting " << endl;

    cout << "Start time: " << startTimestamp << endl;

    while(1) {
      beginSleepTimestamp = getCurrentTimestamp();
      usleep(2 * 1000);
      afterSleepTimestamp = getCurrentTimestamp();
      sleepTimes.push_back(afterSleepTimestamp - beginSleepTimestamp);

      if (afterSleepTimestamp > startTimestamp + 30) {
        break;
      } else {
        continue;
      }
    }

    cout << "Test finished timestamp: " << afterSleepTimestamp << endl;
    cout << "Test duration: " << afterSleepTimestamp - startTimestamp << endl;
    cout << "Test sleep times:" << endl;

    std::vector<double>::const_iterator itr;
    for(itr=sleepTimes.begin(); itr!=sleepTimes.end(); ++itr) {
      cout << "" << (*itr) << endl;
    }
    cout << endl;

    return;
}
