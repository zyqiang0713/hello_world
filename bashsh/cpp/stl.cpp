#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <iostream>
#include <algorithm>
#include <vector>

using namespace std; 

class StudentScore
{
    public: 
            StudentScore(int ch, int ma, int en) : chinese(ch), math(ma), english(en) {total = chinese+math+english;}
            bool operator <(const StudentScore& b)
            {
                if(total < b.total)
                {
                    return true;
                }
                if((total == b.total)&&(chinese< b.chinese))
                {
                    return true;
                }

                return false;
            }
            friend void print(StudentScore a);
    private:
            int total;
            int chinese;
            int math;
            int english;
};
bool compare(StudentScore a, StudentScore b);

bool compare(StudentScore a, StudentScore b)
{
    return (a<b)? true:false;
}


void print(StudentScore a)
{
    std::cout<< "chinese: " << a.chinese<<";math: "<<a.math<<";english: "<<a.english<<std::endl;
}

int main()
{
   StudentScore stuA(89, 77, 80); 
   StudentScore stuB(90, 76, 80);
   if(stuA < stuB)
   {
       std::cout<<" A<B "<<endl;
   }
   else
   {
      std::cout<< "A>B" << endl;
   }

  vector<StudentScore> stuArr; 
  stuArr.push_back(StudentScore(80, 79, 90));
  stuArr.push_back(StudentScore(81, 78, 90));
  sort(std::begin(stuArr), std::end(stuArr), compare);
  for_each(std::begin(stuArr), std::end(stuArr), print);


    return 0;

}
