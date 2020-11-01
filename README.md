# tutorial-material

## MATLAB:
MATLAB web app server
How can I send a file via Web Application
https://www.mathworks.com/matlabcentral/answers/425165-how-can-i-send-a-file-via-web-application


## PROGRAMMING OF FINITE DIFFERENCE METHODS IN MATLAB.pdf  
可參考https://en.wikipedia.org/wiki/Five-point_stencil裡面的2D

## nonadmin: 執行要admin的執行檔
1. 將exe執行到此nonadmin.bat
2. 以nox_setup_v7.0.0.0_full_intl.bat為範例進行修改

## python
#### 架簡單HTTP Server: 用IP就能訪問
e.g.: python -m http.server 9000  
https://riptutorial.com/zh-TW/python/example/14866/%E9%81%8B%E8%A1%8C%E7%B0%A1%E5%96%AE%E7%9A%84http%E6%9C%8D%E5%8B%99%E5%99%A8

#### pip更新失敗
pip install --upgrade pip
--> python -m pip install --user --upgrade pip  
https://github.com/pypa/pip/issues/5109

#### watershed
(半手動) https://emmanuelle.github.io/a-tutorial-on-segmentation.html  
https://github.com/scikit-image/scikit-image/issues/4398

#### 爬蟲
selenium css locator 範例
https://jzchangmark.wordpress.com/2015/03/16/selenium-%E4%BD%BF%E7%94%A8-css-locator-%E5%AE%9A%E4%BD%8D%E5%85%83%E4%BB%B6/

#### pip-not-working-behind-firewall  
https://stackoverflow.com/questions/21468550/pip-not-working-behind-firewall  
https://www.internalpointers.com/post/install-python-modules-pip-behind-proxy  
https://www.itdaan.com/tw/d3691eb76d39ca110fcb732ff24d9301  
https://stackoverflow.com/questions/40650846/pip-behind-a-company-proxy-workaround  
*https://www.semicolonworld.com/question/43488/using-pip-behind-a-proxy  
https://www.rushworth.us/lisa/?p=5485  
https://stackoverflow.com/questions/2989466/configuring-fiddler-to-use-company-networks-proxy  
https://stackoverflow.com/questions/14149422/using-pip-behind-a-proxy-with-cntlm  
https://stackoverflow.com/questions/25981703/pip-install-fails-with-connection-error-ssl-certificate-verify-failed-certi

SOP
1. Fiddler: "Rules" => click "Automatically Authenticate"
2. type 127.0.0.1:8888 on chorme (just test)
3. request.get("www.google.com", proxies=...) (just test)
4. pip install --proxy "127.0.0.1:8888" --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org pip [package]


proxy 查詢  
https://superuser.com/questions/346372/how-do-i-know-what-proxy-server-im-using

#### RPA
PyAutoGUI : 使用Python控制電腦  https://yanwei-liu.medium.com/pyautogui-%E4%BD%BF%E7%94%A8python%E6%93%8D%E6%8E%A7%E9%9B%BB%E8%85%A6-662cc3b18b80  
win32.Dispatch vs win32.gencache in Python  https://stackoverflow.com/questions/50127959/win32-dispatch-vs-win32-gencache-in-python-what-are-the-pros-and-cons  
Python启动Excel https://blog.51cto.com/indie/1626378  
Python 呼叫 Excel VBA 自動化執行巨集程式教學與範例  https://officeguide.cc/python-call-execute-excel-vba-macro-tutorial-example/

#### ROI
內插選轉的矩形ROI: https://stackoverflow.com/questions/49892205/extracting-patch-of-a-certain-size-at-certain-angle-with-given-center-from-an-im

#### Send Outlook Email Via Python
https://stackoverflow.com/questions/6332577/send-outlook-email-via-python  
https://stackoverflow.com/questions/20956424/how-do-i-generate-and-open-an-outlook-email-with-python-but-do-not-send  
PYTHON读取EXCEL内容再转变成HTML添加到OUTLOOK中: https://www.yinyubo.cn/?p=339  
HTML基本架構: http://www.pcnet.idv.tw/

#### Outlook-Python-Tutorial
https://github.com/israel-dryer/Outlook-Python-Tutorial/wiki  
https://github.com/israel-dryer/Outlook-Python-Tutorial

## Excel
公式現形: Ctrl+~  
切換絕對/相對座標: F4  
Excel 基礎教學 https://www.youtube.com/playlist?list=PL7enJ2-v6SPm-EHMuRMCG7R7C-vXQugNM  
利用VBA在Excel2010製作自動化流程(上)(VBA教學) https://www.youtube.com/watch?v=jgeCQJDjm44&ab_channel=%E5%AD%AB%E5%9C%A8%E9%99%BD  
Outlook寄信內嵌Excel tabl: 
https://www.youtube.com/watch?v=SzoGKwmHhNk&ab_channel=greggowaffles  
https://www.youtube.com/watch?v=9q8gZF0UOt8&t=8s&ab_channel=greggowaffles  
RangetoHTML:  http://www.rondebruin.nl/win/s1/outlook/bmail2.htm  
RangetoHTML(樞紐表也可以):  https://blog.csdn.net/cxygs5788/article/details/106351221  
RangetoHTML(樞紐表也可以):  https://bytes.com/topic/excel/insights/964626-rangetohtml-upgraded-function-using-export-table-htmlbody-excel-vba  

## MATLAB 
#### License Mangager Timeout設定  
http://matrix.etseq.urv.es/manuals/matlab/techdoc/install/pc/ch3_lic4.html  
https://www.mathworks.com/help/install/license/concurrent-licenses.html  

#### ROI
拉直線量距離: https://www.mathworks.com/help/images/measure-distances-in-images.html  
內插選轉的矩形ROI: https://www.mathworks.com/matlabcentral/fileexchange/48674-extract-rotated-patch-from-image

#### Callback Definition
https://www.mathworks.com/help/matlab/creating_plots/callback-definition.html

#### 定義branch point
https://www.mathworks.com/matlabcentral/answers/292215-how-does-bwmorph-define-a-branch-point
#### makelut、bwlookup
https://www.twblogs.net/a/5b8689472b71775d1cd593bf
#### watershed相關
Steal grain https://www.mathworks.com/company/newsletters/articles/the-watershed-transform-strategies-for-image-segmentation.html  
迷宮 https://www.mathworks.com/company/newsletters/articles/tips-and-tricks-solving-a-maze-with-the-watershed-transform.html?s_tid=srchtitle  
pears https://www.mathworks.com/help/images/marker-controlled-watershed-segmentation.html  
pears (中文) https://www.itread01.com/content/1548046104.html  
imhmin (常搭配函數) https://www.mathworks.com/help/images/ref/imhmin.html  
論文 http://www2.vincent-net.com/luc/papers/93ieeeip_recons.pdf  
imreconstruct介紹 https://blogs.mathworks.com/steve/2008/07/14/opening-by-reconstruction/  
imgradient 標準化 https://blog.csdn.net/sw3300255/article/details/82503400  

#### GUI
影像點擊callback https://stackoverflow.com/questions/41718666/interactive-mouse-click-on-the-image-area-in-matlab-gui

#### 影像紋理萃取範例
https://www.mathworks.com/help/images/texture-segmentation-using-gabor-filters.html  
https://www.mathworks.com/help/images/texture-segmentation-using-texture-filters.html

#### 影像分割
https://www.mathworks.com/help/images/color-based-segmentation-using-k-means-clustering.html  
https://www.mathworks.com/help/images/ref/imsegkmeans.html  
https://www.mathworks.com/help/images/land-classification-with-color-features-and-superpixels.html

#### 八連通骨架化
https://www.mathworks.com/help/images/ref/bwskel.html

## bat
windows環境變數: 查詢/新增/修改/刪除  
https://shaochien.gitbooks.io/command-line-and-environment-variable-tutorial/content/environment-variable.html

## VBA
跳行: _  
註解: Rem or '  

## 爬蟲
[Python實戰應用]淺談Python Selenium網站自動化套件  
https://www.learncodewithmike.com/2020/02/python-selenium.html  
Beautiful Soup + Pandas Dataframe + Table: https://blog.csdn.net/Canhui_WANG/article/details/81269814

## Notepad ++
如何使用Notepad++移除空白和換行符號  
https://kirstycx.wordpress.com/2018/03/17/%E5%A6%82%E4%BD%95%E4%BD%BF%E7%94%A8notepad%E7%A7%BB%E9%99%A4%E7%A9%BA%E7%99%BD%E5%92%8C%E6%8F%9B%E8%A1%8C%E7%AC%A6%E8%99%9F/  



