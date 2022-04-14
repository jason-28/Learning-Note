* shape函數可用於確認資料維度及長度，print出的形式為(維度，資料長度)

arr = np.array([[1, 2, 3, 4], [5, 6, 7, 8]])

print(arr.shape) #會print出(2,4)

**注意:若跨維度資料長度不一，會只顯示維度數值。**

* Reshape用於切割維度

* reshape過的array可以透過(-1)進行還原



