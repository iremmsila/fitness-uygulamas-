Kullanıcıların egzersiz hayatlarını kolaylaştıracak, yapacağı aktiviteleri gün gün kayıt edebileceği bir ekran oluşturdum. Saat, antrenman, zorluk derecesi seçebilecekleri bir ekran ve beraberinde bunları görüntüleyebileceği bir ekran tasarladım. Bu kayıtlar firebase sisteminde tutulmakla birlikte geçmiş aktivitelerini de görüntüleyebilecekler.
![takvim](https://github.com/user-attachments/assets/a5087294-9689-4ce2-8e2a-e8c2aa915919)
![takvim2](https://github.com/user-attachments/assets/34d6c94d-2d86-4148-9002-e01153a29fa9)
![image](https://github.com/user-attachments/assets/b070fd46-8948-44e9-9863-719a8ac584df)



![image](https://github.com/user-attachments/assets/67bb40b7-4aca-42cd-85d5-3c43016009b6)
![image](https://github.com/user-attachments/assets/5033ef54-3059-42a9-830d-c30e5f9cbf77)
![image](https://github.com/user-attachments/assets/2c52bc75-2270-4d06-b7cb-86c07443dc64)
![image](https://github.com/user-attachments/assets/6711d14b-80aa-4502-9ae8-cc7844f3d686)




Firebase sisteminde öncelikle “schedules” adında bir koleksiyon oluşturulmuştur. Burada kullanıcıların kayıt olurken aldıkları özel id değerleri ile koleksiyona kayıt edilmektedir. Böylece hem kullanıcı hem takvim bilgisi aynı id altında toplanmıştır.
Takvim alanını kullanmak isteyen her kullanıcı için id değerleri altına “userSchedules” adında bir koleksiyon daha oluşturulmuş ve koleksiyon içinde her biri özel id değerleri olan takvime eklediği veriler ayrı ayrı kayıt edilmiştir.  
Ekrana yansıtılırken bu veriler Firebase sisteminden okunup bir liste içine atılıyor ve liste bir map sistemine çevrildikten sonra veriler ayrıştırılmakta kullanıcının istediği saat ve tarih hizasında yerini almaktadır.
![image](https://github.com/user-attachments/assets/5caa93f5-41af-40b4-9305-26216b180cc6)
![image](https://github.com/user-attachments/assets/3a2061dc-9165-4d89-b76d-f7cc630fc444)
![image](https://github.com/user-attachments/assets/ef545df3-772a-41e4-a5c7-90f4d731a135)


![image](https://github.com/user-attachments/assets/f2ab3ff6-9eb1-46d1-aaab-183c504a8bac)



Firebase sistemine Kullanıcılara bildirim gönderimi yapıldı. İstenilen saat ve şekilde bildirim gönderimi yaparak kullanıcıya hatırlatmalar verilebilecek ve kullanıcıyla aktif bir iletişim gerçekleşecek. 
![image](https://github.com/user-attachments/assets/b4c3d63f-1147-49dd-8193-8ae9e4326073)
 ![image](https://github.com/user-attachments/assets/08eed32c-8a78-4ae8-bca7-3fca10e5b8d9)
![image](https://github.com/user-attachments/assets/3da19702-ddda-4ff7-81a3-344a98bf7e0c)
![image](https://github.com/user-attachments/assets/afc35627-50a2-48cf-83ee-970165f54414)












