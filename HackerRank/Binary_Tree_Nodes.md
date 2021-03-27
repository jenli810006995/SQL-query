You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.



Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
Sample Input


```
Sample Output

1 Leaf
2 Inner
3 Leaf
5 Root
6 Leaf
8 Inner
9 Leaf
```
Solution(MySQL):
```
select N, if(P is null, 'Root', if((select count(*) from BST where P = B.N)>0, 'Inner', 'Leaf'))
from BST as B order by N;

```
Solution(SQL Server):
```
select N,
      case when P is null then 'Root'
           when (select count(*) from BST where P=B.N) > 0 then 'Inner'
           else 'Leaf'
      end
from BST as B
order by N
;
```

Link: https://www.hackerrank.com/challenges/binary-search-tree-1/problem
