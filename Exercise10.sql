-- 01.請利用Workbench建立一使用者帳號 Username: william，Host: %，Password: 
-- P@ssw0rd (請擷圖)
-- 參考作業十(第一題截圖).jpg

-- 02.請授予使用者william 對資料庫EXAMPLE底下所有資料表的所有權限
grant all
on EXAMPLE.*
to 'william'@'%';

-- 03.請撤銷william 對資料庫EXAMPLE底下所有資料表的所有權限
revoke all
on EXAMPLE.*
from 'william'@'%';
