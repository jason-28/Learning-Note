以105年新北市政府警察局查獲兩性毒品嫌疑犯人數為資料集

```
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
data = pd.read_csv('./新北市政府警察局查獲兩性毒品嫌疑犯人數.csv',encoding='UTF8')
df = pd.DataFrame(data)
```
由於年份皆為同一年及資料集中有包含對各欄位的總計，在這邊先drop掉
```
df=df.drop(['year'], axis=1)
df.drop(df.loc[df['item']=='總計'].index, inplace=True)
df.drop(df.loc[df['method']=='總計'].index, inplace=True)
df.drop(df.loc[df['education']=='總計'].index, inplace=True)
```
```
      item method education  total  man  Female
109  第一級毒品  製造或栽種       不識字      0    0       0
110  第一級毒品  製造或栽種        自修      0    0       0
111  第一級毒品  製造或栽種        國小      0    0       0
112  第一級毒品  製造或栽種        國中      0    0       0
113  第一級毒品  製造或栽種     高中(職)      5    4       1
..     ...    ...       ...    ...  ...     ...
481  非四級其他     其他        國中      0    0       0
482  非四級其他     其他     高中(職)      3    3       0
483  非四級其他     其他        大專      4    4       0
484  非四級其他     其他       研究所      0    0       0
485  非四級其他     其他   其他(含不詳)      0    0       0

[312 rows x 6 columns]
```
### 教育程度

```
df.columns=['item','method','education','total','male','female']
print(df.groupby(['education']).sum().sort_values('total', ascending=False))
```
```
education        total  male  female                 
高中(職)       6814  5804    1010
國中          3192  2799     393
其他(含不詳)     1045   888     157
大專           299   263      36
國小           150   136      14
研究所            8     6       2
自修             1     1       0
不識字            0     0       0
```
以教育程度來看，大部分犯嫌學歷介於國高中間，這也使日後在國高中更積極推廣反毒宣導。

### 毒品類別

```
df.columns=['item','method','education','total','male','female']
print(df.groupby(['item']).sum().sort_values('total', ascending=False))
```
```
item             total  male  female                 
第二級毒品   8864  7660    1204
第一級毒品   2181  1815     366
第三級毒品    453   412      41
非四級其他      7     7       0
第四級毒品      4     3       1
```
以毒品類別來看，絕大多數事件都是跟第二級毒品有關，警方應更著重在追溯其來源及各流通管道。

### 犯罪方法

```
df.columns=['item','method','education','total','male','female']
print(df.groupby(['method']).sum().sort_values('total', ascending=False))
```
```
method       total  male  female                          
施用              5323  4559     764
持有              4557  3932     625
販賣               685   574     111
意圖販賣             540   462      78
轉讓               368   338      30
製造或栽種             14    11       3
其他                10    10       0
引誘他人施用             7     6       1
強暴、脅迫等非法使用人施用      3     3       0
製造                 1     1       0
運輸                 1     1       0
```

以犯罪方法來看，大部分為施用及持有，且多為男性，或許可以從嫌犯背景找出更多隱藏的犯嫌。
