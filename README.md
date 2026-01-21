# Employee Record Django

إرشادات سريعة لنشر المشروع على Railway

1. افتح https://railway.app/ وسجّل دخولك.
2. أنشئ مشروع جديد واختر "Deploy from GitHub" ثم اربط المستودع:
   - `hn770678153-sudo/employee-record-django-Mhammed-Amer`
3. أضف Plugin قاعدة بيانات PostgreSQL (Add plugin → PostgreSQL). بعد الإنشاء، انسخ قيمة `DATABASE_URL` من الـ Variables.
4. في إعدادات المشروع (Variables / Environment): أضف المتغيرات التالية:
   - `SECRET_KEY` = قيمة سرية (مثلاً تولّدها محليًا)
   - `DEBUG` = `False`
   - `DATABASE_URL` = (قيمة من PostgreSQL plugin)
5. في إعدادات الـ Deploy → Build command ضع:
   - `pip install -r requirements.txt && python manage.py collectstatic --noinput`
6. في Start command اترك `gunicorn employeerecord.wsgi` أو تأكد أن `Procfile` يحتوي على:
   - `web: gunicorn employeerecord.wsgi`
7. بعد الربط، شغّل Deploy. بعد نشر التطبيق، شغّل المهاجرات (Migrations) من Console أو عبر أمر Release:
   - `python manage.py migrate`
   - (اختياري) `python manage.py createsuperuser`

ملاحظات:
- المشروع مُجهز لاستخدام `dj-database-url`, `whitenoise`, و`gunicorn` (موجودة في `requirements.txt`).
- تأكد إضافة أي متغيرات حسّاسة في لوحة Railway وليس في المستودع.
