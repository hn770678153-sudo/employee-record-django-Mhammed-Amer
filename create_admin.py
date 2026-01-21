from django.contrib.auth import get_user_model

User = get_user_model()

username = 'admin'
email = 'admin@example.com'
password = 'AdminPass123!'

if User.objects.filter(username=username).exists():
    print('admin user already exists')
else:
    User.objects.create_superuser(username, email, password)
    print('admin user created')
