# 1287. Element Appearing More Than 25% In Sorted Array

Given an integer array sorted in non-decreasing order, there is exactly one integer
in the array that occurs more than 25% of the time, return that integer.

Example 1:
> Input: arr = [1,2,2,6,6,6,6,7,10]
> 
> Output: 6

Example 2:
> Input: arr = [1,1]
>
> Output: 1

Constraints:
* 1 <= arr.length <= 10^4
* 0 <= arr[i] <= 10^5

## Solution
```
public class Solution {
    public int FindSpecialInteger(int[] arr) 
    {
        Dictionary<int, int> dict = new Dictionary<int, int>();
        foreach(int a in arr)
        {
            dict[a] = 0;
        }
        int i = 0;
        int result = 0;
        foreach(int num in arr)
        {
            dict[arr[i]] += 1;

            //check if it's 25%
            if (dict[arr[i]] > 0.25 * (arr.Count()-1))
            {
                result = arr[i];
            }
            i++;
        }
        return result;
    }
}
```
