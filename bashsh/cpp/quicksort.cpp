#include <iostream>
#include <stdio.h>

#include <algorithm>


using namespace std;

template <typename T>
void quick_sort_recursive(T arr[], int start, int end)
{
    if(start >= end)
            return ;
    T mid = arr[end];
    int left = start;
    int right = end-1;
    while(left < right){
        while((arr[left]<mid)&&(left<right)) left++;
        while((arr[right] > mid)&&(left<right)) right--;
        std::swap(arr[left], arr[right]);
    }
    if(arr[left] >= mid)
            std::swap(arr[left],arr[end]);
    else
            left++;
    quick_sort_recursive(arr, start, left -1);
    quick_sort_recursive(arr, left+1, end);
          
}


int main(int argc, char* argv[])
{
   int array[]={1, 3, 2, 4, 6, 7, 9, 8, 10, 5}; 
   quick_sort_recursive(array, 0, 9);

   for(int i =0; i<10 ; i++)
   {
       std::cout<<array[i]<<std::endl;
   }

    return 0;

}
