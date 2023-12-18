# 1436. Destination City
You are given the array paths, where paths[i] = [cityAi, cityBi] means there exists a 
direct path going from cityAi to cityBi. Return the destination city, that is, the city
without any path outgoing to another city.
It is guaranteed that the graph of paths forms a line without any loop, therefore, there
will be exactly one destination city.

Example 1:
> Input: paths = [["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]
>
> Output: "Sao Paulo" 
* Explanation: Starting at "London" city you will reach "Sao Paulo" city which is the
destination city. Your trip consist of: "London" -> "New York" -> "Lima" -> "Sao Paulo".

Example 2:
> Input: paths = [["B","C"],["D","B"],["C","A"]]
>
> Output: "A"
* Explanation: All possible trips are: "D" -> "B" -> "C" -> "A". "B" -> "C" -> "A". "C" -> "A". 
"A". Clearly the destination city is "A".

Example 3:
> Input: paths = [["A","Z"]]
>
> Output: "Z"

Constraints:
* 1 <= paths.length <= 100
* paths[i].length == 2
* 1 <= cityAi.length, cityBi.length <= 10
* cityAi != cityBi
* All strings consist of lowercase and uppercase English letters and the space character.

# Solutions:
## Brute Force:
```
public class Solution {
    public string DestCity(IList<IList<string>> paths) {
        
        string candidate = "";
        bool found = false;

        for (int i = 0; i < paths.Count(); i++)
        {
            candidate = paths[i][1];
            found = true;
            for (int j = 0; j < paths.Count(); j++)
            {
                if (paths[j][0] == candidate)
                {
                    found = false;
                    break;
                }
            }

            if (found)
            {
                return candidate;
            }
        }
```
Объяснение: перебором каждой дороги берём город paths[i][1] (т.е. Destination) и проверяем вложенным циклом по paths[j][0], является ли он в каком-нибудь path точкой отправки в другой город. Если да, то он не может быть конечным пунктом - иначе мы нашли финальный город.

## Using HashSet:
```
public class Solution {
    public string DestCity(IList<IList<string>> paths) {
        
        string candidate = "";
        HashSet<string> hasOutgoing = new HashSet<string>();

        for (int i = 0; i < paths.Count(); i++)
        {
            hasOutgoing.Add(paths[i][0]);
        }

        for (int i = 0; i < paths.Count(); i++)
        {
            if(!hasOutgoing.Contains(paths[i][1]))
            {
                return candidate = paths[i][1];
            }
        }
        return candidate;
    }
}
```
Пояснение: на этот раз вместо того чтобы делать вложенный цикл используется следующий подход: сначала мы в HashSet кладём те города, из которых есть дорога в любой другой город, перебирая paths[0]. После этого мы снова проходимся уже по paths[1] и проверяем, лежит ли текущее место назначения в нашем HashSet. Если нет, то это конечный пункт, из которого нет дороги в другой город.
