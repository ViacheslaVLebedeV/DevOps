# 1582. Special Positions in a Binary Matrix
Given an m x n binary matrix mat, return the number of special positions in mat.
A position (i, j) is called special if mat[i][j] == 1 and all other elements in 
row i and column j are 0 (rows and columns are 0-indexed).

* Example 1:
![image](https://github.com/ViacheslaVLebedeV/DevOps/assets/102717803/ddbee120-7d12-40ba-9341-f3ea1dcadc3a)


> Input: mat = [[1,0,0],[0,0,1],[1,0,0]]
>
> Output: 1
>
> Explanation: (1, 2) is a special position because mat[1][2] == 1 and all other elements in row 1 and column 2 are 0.

Example 2:
![image](https://github.com/ViacheslaVLebedeV/DevOps/assets/102717803/2d4f8b41-7f15-4b30-b431-6dddd27eb0b8)
> Input: mat = [[1,0,0],[0,1,0],[0,0,1]]
>
> Output: 3
>
> Explanation: (0, 0), (1, 1) and (2, 2) are special positions.

Constraints:
* m == mat.length
* n == mat[i].length
* 1 <= m, n <= 100
* mat[i][j] is either 0 or 1.

# Solutions:
## Nested Loops:
```
public class Solution 
{
    public int NumSpecial(int[][] mat)
    {
        int ans = 0;
        int m = mat.Length;
        int n = mat[0].Length;

        for (int row = 0; row < m; row++)
        {
            for (int col = 0; col < n; col++)
            {
                // Если перед нами 0, то нам не интересно это
                if (mat[row][col] == 0)
                {
                    continue;
                }

                bool special = true;    // Проверка на особенность

                // Пробиваем ряд
                for (int r = 0; r < m; r++)
                {
                    if (r != row && mat[r][col] == 1)
                    {
                        special = false;
                        break;
                    }
                }

                // если в ряду только что была найдена единица, то нет смысла проверять столбец
                if (!special)
                {
                    break;
                }

                // Пробиваем столбец
                for (int c = 0; c < n; c++)
                {
                    if (c != col && mat[row][c] == 1)
                    {
                        special = false;
                        break;
                    }
                }

                // Проверка
                if (special)
                {
                    ans++;
                }
            }
        }

        return ans;
    }
}
```
* Объяснение: Циклом по рядам, циклом по столбцам - проходим все эл-ты матрицы. Особенными являются 1, поэтому нули не трогаем. Если встретилась 1, то делаем последовательно 2 проверки: 1) нет ли ещё единиц в этой строке (если есть, то флаг ставим отрицательным и выходим из цикла), 2) аналогично нет ли единиц других в том же столбце. Если обе проверки успешные, то увеличиваем счётчик уникальных позиций. Возвращаем ответ.
* Временная сложность высокая ввиду вложенных трижды циклов.
* Доп. память не требуется.

## RowCount (fastest):
```
public class Solution 
{
    public int NumSpecial(int[][] mat)
    {
        int ans = 0;
        int m = mat.Length;   // rows
        int n = mat[0].Length;// cols

        int[] rowCount = new int[m];
        int[] colCount = new int[n];

        for (int row = 0; row < m; row++)
        {
            for (int col = 0; col < n; col++)
            {
                if (mat[row][col] == 1)
                {
                    rowCount[row]++;
                    colCount[col]++;
                }
            }
        }

        for (int rc = 0; rc < m; rc++)
        {
            if (rowCount[rc] == 1)
            {
                for (int col = 0; col < n; col++)
                {
                    if(colCount[col] == 1 && mat[rc][col] == 1)
                    {
                        ans++;
                        break;
                    }
                }
            }
        }

        return ans;
    }
}
```
* Объяснение: Оптимизация состоит в том, чтобы не увеличивая кол-во вложенных массивов до 3, посчитать кол-во единиц в каждом ряду и каждом столбце, занеся данные в массивы. Вторым заходом ищутся в массиве rowCount (кол-ва единиц в рядах) та позиция, где кол-во равно 1. Далее ищутся colCount, где тоже лишь 1 единица была насчитана + проверка, что на найденных позициях в основной матрице стоит 1. Если все условия выполнены, то увеличиваем счётчик для ответа.


## LINQ C# (Visually Easiest):
```
public class Solution 
{
    public int NumSpecial(int[][] mat)
    {
    List<int[]> list = new List<int[]>();

    int N = mat.Length;    // строки
    int M = mat[0].Length; // столбцы

    // Цикл запоминания всех единиц
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < M; j++)
        {
            if (mat[i][j] == 1)
            {
                int[] coordinates = { i, j };
                list.Add(coordinates);
            }
        }
    }

    // Удаление элементов, не являющихся специальными позициями
    list.RemoveAll(position =>
        mat[position[0]].Count(value => value == 1) != 1 ||
        mat.Count(row => row[position[1]] == 1) != 1);

    return list.Count;
    }
}
```
* Объяснение: Заносим координаты единиц в список позиций list. С помощью выражений LINQ убираем все элементы, для которых в текущей строке ещё есть какие-либо единицы или тоже самое, но в текущем столбце
