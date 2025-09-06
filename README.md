 Netflix Data Analysis using SQL (PostgreSQL)

##  Project Overview  
This project analyzes the **Netflix Movies & TV Shows dataset** using **PostgreSQL**.  
It answers **15+ real-world business questions**, including:  
- What’s the ratio of Movies vs TV Shows?  
- Which country contributes the most Netflix content?  
- Who are the top actors and directors?  
- How has Netflix content grown over the years?  
- How much violent content exists compared to family-friendly content?  

The project demonstrates skills in:  
✅ Aggregations, Filtering  
✅ String Functions (`split_part`, `string_to_array`, `unnest`)  
✅ Window Functions (`RANK`)  
✅ Case Statements & Categorization  
✅ Date Functions (`TO_DATE`, `EXTRACT`)  

---

## 📂 Dataset  
- Dataset: **Netflix Movies and TV Shows**  
- Records: ~8,000 titles  
- Columns include:  
  - `show_id`, `type`, `title`, `director`, `casts`, `country`,  
  - `date_added`, `release_year`, `rating`, `duration`,  
  - `listed_in`, `description`.
