# Data Technology資料科技

## 主檔與異動檔

### 主檔(Master File) 

* 如電話簿、Line的通訊錄、群組、學生基本資料檔等。

* 儲存實體(Entity，如學生、教師、課程、顧客、員工等)有關的永久性與累積性(如year-to-date)資訊。

* 異動檔的異動資料將更新(update)主檔的累積性欄位。

### 異動檔(Transaction File或明細檔)

* 如通話記錄、Line通信記錄、學生的選課檔、員工每月的薪資檔、物料的進貨或出貨檔等。

* 異動檔儲存異動的一組記錄。同時也用來更新主檔中的累積資料。

## 資料庫正規化(Normal Form)

**資料庫綱要(Database Schema):** 每個表格應包括哪些欄位。

* 正規化(Normalization)可避免資料重複與節省儲存空間的目的，且防止資料不一致性的問題(就是將檔案拆開以利管理)。

* 高階的正規化一定會包含初階的正規化(例如符合三階的資料庫綱要，一定會符合一階、二階)。

**反正規化:** 將檔案重新結合以利查詢。

## 主從架構

* Two-Tier即是主從架構(Client/Server，C/S)，Client是PC或終端機，Server是Database Server(資料庫伺服器)。

* N-Tier多層式架構是一種開發技術，更是系統架構的體系設計概念。

### Database Server 的 2-Tier架構

* 所有的PC或Client都必須以SQL來下達指令給資料庫伺服器，並由其全權處理，**Client必須等待Server的執行結果。**

* 主從架構是一種分工的模式，先由Client提出申請，再由Server完成資料存取的目的。

