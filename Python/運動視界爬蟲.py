#!/usr/bin/env python
# coding: utf-8

# # 運動視界NBA版2022季後賽專題之標題、作者、日期爬取

# In[3]:


from selenium import webdriver
import time
from bs4 import BeautifulSoup
import csv


# In[4]:


driver = webdriver.Chrome("C:/Users/jason/OneDrive/桌面/SCU/chromedriver.exe")
driver.get('https://www.sportsv.net/feature/2022-NBA-Playoffs')
page_content = driver.page_source
soup = BeautifulSoup(page_content,'html.parser')
items = soup.select('.panel-content')
row_list = []

for item in items: 
    title = item.select('.title a')[0].text
    author = item.select('.author_name')[0].text
    date = item.select('.date')[0].text
    article_list = {}
    article_list['標題'] = title
    article_list['作者'] = author
    article_list['日期'] = date
    row_list.append(article_list)

headers = ['標題','作者','日期']

with open('C:/Users/jason/OneDrive/桌面/happycoder/2022NBAPlayoffs.csv','w',newline='',encoding='utf-8')as f:
    dict_writer = csv.DictWriter(f,headers)
    dict_writer.writeheader()
    dict_writer.writerows(row_list)

with open('C:/Users/jason/OneDrive/桌面/happycoder/2022NBAPlayoffs.csv','r',newline='',encoding='utf-8')as i_f:
    rows = csv.reader(i_f)
    for row in rows:
        print(row)

time.sleep(1)
driver.quit()

